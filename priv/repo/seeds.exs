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

Blog.Setting.create "styles", "
.single-post {
  padding: 50px;
  background-color: #EEEEEE;
  color: #333333;
  height: 100%;
}

.single-post a {
  color: #e3a85b;
}

.single-post:nth-child(2n+2) {
  background-color: #333333;
  color: #cccccc;
}

.single-post:nth-child(2n+2) a {
  color: #e3a85b;
}

.single-post:nth-child(2n+2).active .title {
  background-color: #EEEEEE;
  color: #333333;
}

.single-post .title {
  font-size: 40px;
  padding-bottom: 30px;
}

.single-post p {
  font-size: 18px;
  line-height: 1.56;
}

.single-post.active .title {
  position: fixed;
  top: 0px;
  left: 0px;
  right: 0px;
  padding: 10px;
}

.posts {
  padding: 0px;
  margin: 0px;
}

.posts .post {
  padding: 50px;
  background-color: #EEEEEE;
  color: #333333;
}

.posts .post a {
  color: #e3a85b;
}

.posts .post:nth-child(2n+2) {
  background-color: #333333;
  color: #cccccc;
}

.posts .post:nth-child(2n+2) a {
  color: #e3a85b;
}

.posts .post:nth-child(2n+2).active .title {
  background-color: #EEEEEE;
  color: #333333;
}

.posts .post .title {
  font-size: 40px;
  padding-bottom: 30px;
}

.posts .post p {
  font-size: 18px;
  line-height: 1.56;
}

.posts .post.active .title {
  position: fixed;
  top: 0px;
  left: 0px;
  right: 0px;
  padding: 10px;
}
"

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
