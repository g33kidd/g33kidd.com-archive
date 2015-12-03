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

title = "Test Post"
slug = "test-post"
body = "<p>Here it goes: I sped. I followed too closely. I ran a stop sign. I almost hit a Chevy. I sped some more. I failed to yield at a crosswalk. I changed lanes at an intersection. I changed lanes without signaling while running a red light and SPEEDING!</p>
<p>Simmons is old. He should've been out of the game years ago but he can't stay home because he hates his wife. You've met her at the Christmas parties, she's the one that gets plastered and calls him a retard, and you, Tom; you're the biggest brownnose I've ever seen. You've got your head so far up Mr. Allen's ass, I can't tell where you end and he begins. [...] You have bad breath caused by gingivitis. You couldn't get a porn star off. Your hairpiece looks like something that was killed crossing the highway. I don't know whether to comb it or scrape it off with a shovel and bury it in lime. Loser! Idiot! Wimp! Degenerate! SLUUUUUUUTTT! </p>
<p>Here it goes: I sped. I followed too closely. I ran a stop sign. I almost hit a Chevy. I sped some more. I failed to yield at a crosswalk. I changed lanes at an intersection. I changed lanes without signaling while running a red light and SPEEDING!</p>
<p>Nothing! Because if I take it to small claims court, it will just drain eight hours out of my life and you probably won't show up and even if I got the judgment you'd just stiff me anyway; so what I am going to do is piss and moan like an impotent jerk, and then bend over and take it up the tailpipe!</p>"

content_post = %Blog.Content{
  type: "post",
  data: %{
    title: title,
    body: body
  },
  slug: slug
}

Blog.Repo.insert!(content_post)
