defmodule Blog.SiteView do
  use Blog.Web, :view

  def render("index.html", %{template: template}) do
    EEx.eval_string template.content, []
  end
end
