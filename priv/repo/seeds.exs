# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Blog.Repo.insert!(%SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

changeset = Blog.User.changeset %Blog.User{}, %{
  username: "g33kidd",
  name: "Name",
  email: "some@email.com",
  admin: true,
  password: "admin",
  password_confirmation: "admin",
  profiles: %{
    website: "g33kidd.com",
    twitter: "g33k_kidd"
  }
}

Blog.Repo.insert! changeset
