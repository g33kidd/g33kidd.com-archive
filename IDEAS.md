# Some Ideas...

Here are some rough ideas for my Phoenix CMS.

## For Posts/Pages/Content

The model for posts, pages, etc... is called Content. Content could literally be anything. Posts and pages will be a Content Entry. The type of content would be specified in the db.

```elixir
post_content_entry = %Content{
  type: :post,
  data: %{
    title: "New Post",
    body: "My post content!",
    author: "references user here by id?"
    ...
  },
  ...
}

# Maybe, for convenience, defaults could be created like:
post_entry = ContentPost.new %{
  title: "New Post",
  ...
}

page_entry = ContentPage.new %{}
```

## More on Content Types: Content Extras
### What's an Extra?
Extras give you the ability to extend the data of a Content entry.

```elixir

post = ContentPost.new(%{title: "", ...})
post_extra = ContentExtra.compose([
  {:tags, "just,some,tags,for,a,post"},
  {:scripts, [jquery: Extras.extern_script("jQuery")]}
])

# add_extra would validate the extra. That's why we only create it here.
ContentPost.add_extra(post, post_extra)
```

When any page is loaded, extras will be automatically added. If there are any `:scripts`, they will be loaded in footer. And... in the order they are arranged in the List.

#### Template Modification
Each content-type would be defined in ContentTypes/types? Somewhere either in the configuration or in the database.

The type's content would be a file stored somewhere with a template. This way a user can modify a templates content on their system or from within the Admin Dashboard.

Content
  id: 1234
  type: 'post' or 'page' or 'admin_section' or 'addon'
  data: 'stored as a map' %{}

Content Extras
  - would be key/val storage for a content entry
    # Simple Extra... adding tags to be accessed from a template/component.
    post_extras = %Extra{
      # will be loaded when the post page is loaded.
      scripts: ["jquery", "extern-script"],

      # will be parsed when created.
      # no default templates will have tags... only addons?
      tags: "some,tags,for,a,post"
    }
