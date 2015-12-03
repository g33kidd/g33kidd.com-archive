# Some Ideas...

Here are some rough ideas for my Phoenix CMS.

## For Posts/Pages/Content

The model for posts, pages, etc... is called Content. Content could literally be anything. Posts and pages will be a Content Entry. The type of content would be specified in the db.

```elixir
# Create a content Struct add to Repo
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
Repo.insert! post_content_entry

# or...
# create and validate
post = Content.create %{
  type: :post,
  data: %{
    title: "",
    ...
  }
}
```

## More on Content Types: Content Extras
### What's an Extra?
Extras give you the ability to extend the data of a Content entry.

```elixir

post = Content.create %{...}
post_extra = ContentExtra.compose([
  {:tags, "just,some,tags,for,a,post"}
])

# add_extra would validate the extra. That's why we only create it here.
ContentPost.add_extra(post, post_extra)
```

When any page is loaded, extras will be automatically added.

Content extras are basically just an id, key, and val/map. Normal values are stored as text, such as strings or integers and will be parsed when the are loaded.

## Templates and Styles


#### Template Modification
Each content-type would be defined in ContentTypes/types? Somewhere either in the configuration or in the database.

The type's content would be a file stored somewhere with a template. This way a user can modify a templates content on their system or from within the Admin Dashboard.
