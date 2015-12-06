defmodule Blog.ContentExt do
  require Logger

  # just markdown for now
  def parse(content, type \\ :markdown) do
    type = type |> Atom.to_string() |> String.capitalize()
    Blog.ContentExt.Markdown.parse(content)

    # TODO: is this right?
    # :"Blog.ContentExt.#{type}".parse(content)
  end
end
