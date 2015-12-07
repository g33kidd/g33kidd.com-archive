defmodule Blog.ContentExt do
  @moduledoc """
    ## Content Extension
    A content extension just manipulates the post model when the page is loaded.
  """
  require Logger


  def parse(content) do
    content
      |> Blog.ContentExt.Markdown.parse()
      |> Blog.ContentExt.Text.parse()
      |> Blog.Repo.update! content
  end
end
