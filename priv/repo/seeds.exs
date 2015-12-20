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
