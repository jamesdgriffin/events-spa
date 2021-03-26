# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     EventsApp.Repo.insert!(%EventsApp.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.


alias EventsApp.Repo
alias EventsApp.Users.User
alias EventsApp.Events.Event

alice = Repo.insert!(%User{name: "alice", email: "alice@mail.com", password_hash: ""})
bob = Repo.insert!(%User{name: "bob", email: "bob@mail.com", password_hash: ""})

alice_post = Repo.insert!(%Event{name: "alices event", date: "03-26-2021", description: "alices bday partay", user_id: alice.id})
