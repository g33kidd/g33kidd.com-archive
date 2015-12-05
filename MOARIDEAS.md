## Slugs?

What does a slug in Content mean?

It could be any of these:

- Channel (socket)
- route (for pages, posts, etc)
- api endpoint

## Content Extras

```elixir

post = Content.create %{...}
post_extra = ContentExtra.compose([
  {:tags, "just,some,tags,for,a,post"}
])

# add_extra would validate the extra. That's why we only create it here.
ContentPost.add_extra(post, post_extra)
```
