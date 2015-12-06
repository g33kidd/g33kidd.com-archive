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


  @doc """

    This gets the assigns for a template.

    For now, all we need is conn, but variables that could be set by
    the env could also be loaded here: System.get_env("SOME_VAR")

  """
  def get_template_assigns(conn) do
    conn.assigns
  end
end
