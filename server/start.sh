#!/bin/bash

# Could factor some of this out into an env.sh
# to share with deploy.sh
export MIX_ENV=prod
export PORT=4794

CFGD=$(readlink -f ~/.config/events-spa)

if [ ! -e "$CFGD/base" ]; then
    echo "Need to deploy first"
    exit 1
fi

SECRET_KEY_BASE=$(cat "$CFGD/base")
export SECRET_KEY_BASE

DB_PASS=$(cat "$CFGD/db_pass")
export DATABASE_URL=ecto://events-spa:$DB_PASS@localhost/events_app_spa_prod

_build/prod/rel/events_app/bin/events_app start
