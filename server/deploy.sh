#!/bin/bash
# This is deploy.sh

export MIX_ENV=prod
export PORT=4794
export SECRET_KEY_BASE=insecure
export DATABASE_URL=ecto://events-spa:bad@localhost/events_app_spa_prod

mix ecto.create
mix deps.get --only prod
mix compile

CFGD=$(readlink -f ~/.config/events-spa)

if [ ! -d "$CFGD" ]; then
mkdir -p $CFGD
fi

if [ ! -e "$CFGD/base" ]; then
mix phx.gen.secret > "$CFGD/base"
fi

if [ ! -e "$CFGD/db_pass" ]; then
pwgen 12 1 > "$CFGD/db_pass"
fi

SECRET_KEY_BASE=$(cat "$CFGD/base")
export SECRET_KEY_BASE

DB_PASS=$(cat "$CFGD/db_pass")
export DATABASE_URL=ecto://events-spa:$DB_PASS@localhost/events_app_spa_prod

mix ecto.migrate

npm install --prefix ./assets
npm run deploy --prefix ./assets
mix phx.digest

mix release
