# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Blog.Repo.insert!(%Blog.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

Blog.Repo.insert!(%Blog.Post{
  title: "Hello, World!",
  content: """
Hello, World!

No, this isn’t a programming tutorial, but I have thought about doing that sometime. This post is for welcoming you to my new website! I finally decided to take the time to sit down and put together a website for myself and you guys. Not only is this a website for me, but it’s also a website where I will give back to everyone reading and visiting. I’ll be posting tips/tricks for WordPress and some various programming languages, plus some stuff about my favorite frameworks to work with.

Intro

Just a little bit about me. I was born in Colorado and raised in Kansas where I would eventually learn about computer science and programming. About a few months ago I stayed in LA for a little bit and then moved to Colorado to work for Folsom Creative. Mainly I work with WordPress, PHP, Less, and JavaScript. When I’m just messing around with this I use Ruby, Sass, Node, Elixir, and GO. I love coming up with ideas and building them in code.

I hope you enjoy seeing all the cool stuff I have to offer.

See ya next time!
  """,
  slug: "hello-world"
})
