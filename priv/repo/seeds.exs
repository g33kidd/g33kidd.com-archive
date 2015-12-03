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

content = "We sat and drank with the sun on our shoulders and felt like free men. Hell, we could have been tarring the roof of one of our own houses. We were the lords of all creation. As for Andy - he spent that break hunkered in the shade, a strange little smile on his face, watching us drink his beer."
Blog.Repo.insert!(%Blog.Post{title: "Post Title", body: content, slug: "post-title"})
