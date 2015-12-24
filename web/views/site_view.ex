defmodule Blog.SiteView do
  use Blog.Web, :view

  def render(conn, "index.html", %{template: template}) do
    EEx.eval_string template.content, conn.assigns
  end
end
