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

## Content Type extensions

A hex package that could be added that parses Content differently. Based on it's `:type`. By default, a "Basic HTML" and "Markdown" extension would be added.

```elixir

# example
defmodule ContentExtension do
  def parse(content) do
    # would take this:
    # content = %Content{type: :post, data: %{}, slug: "/"}

    # this would run just before adding the entry when saved or updated.
    content_html = Earmark.to_html(content.data.body)

    # the new Content entry
    %{content | html: content_html}
  end

  def make_safe(content) do end
  def get_html(content) do end
  def get_markdown(content) do end

  ... etc.
  # things to make it easier to work with different types of content...
end
```

Extension Ideas:

- HTML to excerpt
- Markdown to HTML
- JSON stuff?
  - pass json to the template of that content type, access variables with @
- Inline Stylesheets... should be possible, for emails and what not...
