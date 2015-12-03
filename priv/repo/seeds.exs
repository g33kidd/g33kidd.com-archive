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

# content = "We sat and drank with the sun on our shoulders and felt like free men. Hell, we could have been tarring the roof of one of our own houses. We were the lords of all creation. As for Andy - he spent that break hunkered in the shade, a strange little smile on his face, watching us drink his beer."
# Blog.Repo.insert!(%Blog.Post{title: "Post Title", body: content, slug: "post-title"})

title = "New Post"
slug = "new-post"
body = "<p>Yep. Day of the game. I was sittin' in a bar, waitin' for the game to start,
and in walks this girl. Oh, it was an amazing game, though. You know, bottom of the eighth,
Carbo ties it up at 6-6. It went to twelve. Bottom of the twelfth, in stepped Carlton Fisk. Old Pudge.
Steps up to the plate, you know, and he's got that weird stance.</p>"

content_post = %Blog.Content{
  type: "post",
  data: %{
    title: title,
    body: body
  },
  slug: slug
}

content_page = %Blog.Content{
  type: "page",
  data: %{
    title: "Content(page) Title",
    html: "<h1>Some html!</h1>"
  },
  slug: "/page-test"
}

Blog.Repo.insert!(content_post)
Blog.Repo.insert!(content_page)
