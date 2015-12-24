template = Blog.Template.changeset %Blog.Template{}, %{
  name: "index.html",
  content: "<div class='posts'>
    <%= if length(@posts) == 0 do %>
      <h1>No Posts found!</h1>
    <%= else %>
      <%= for post <- @posts do %>
        <div class='post'>
          <div class='container'>
            <a href='/<%= post.slug %>'>
              <div class='title'><%= post.title %></div>
            </a>
            <div class='content'><%= raw post.data.short_text %></div>
          </div>
        </div>
      <%= end %>
    <%= end %>
  </div>
"
}

Blog.Repo.insert! template

changeset = Blog.User.changeset %Blog.User{}, %{
  username: "admin",
  name: "Name",
  email: "admin@email.com",
  admin: true,
  password: "admin",
  password_confirmation: "admin"
}

Blog.Repo.insert! changeset
