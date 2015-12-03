defmodule Blog.BlogView do
  use Blog.Web, :view

  alias Content.Templates

  # changes "strings" to :atoms
  def clean_content(content) do
    for {key, val} <- content.data, into: %{}, do: {String.to_atom(key), val}
  end

  def render_template(template, assigns \\ []) do
    Templates.render(template, assigns)
  end
end
