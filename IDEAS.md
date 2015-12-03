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

extra_example = %{
  tags: "just,some,tags,for,a,post"
}

# add_extra would validate the extra. That's why we only create it here.
ContentPost.add_extra(post, post_extra)
```

When any page is loaded, extras will be automatically added.

Content extras are basically just an id, key, and val/map. Normal values are stored as text, such as strings or integers and will be parsed when the are loaded.

## Templates and Styles
Custom templates are stored in their own directory, outside of `web/templates`. Templates can have a `ContentType` associated with them, meaning that if content with that type is accessed, that template will be rendered.

The templates directory will be configurable. Preferably the option for third-party providers like AWS S3, Dropbox, or some other platform? If there is a way to render templates from Strings, it would be cool to store templates in the DB as well.

## Template Revisions

Template revisions would just be backups of a template version. Once the user saves a template, it would be added as a revision and a file would be saved somewhere. Under a folder of the version, or... The filename would include the version number:`revisions/<template_name>_v34.html.eex`

See: templates/revisions/ for an example of how this might look.
