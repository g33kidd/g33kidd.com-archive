defmodule Blog.LayoutView do
  use Blog.Web, :view

  def get_tracking_code(assigns) do
    Phoenix.HTML.raw(assigns.analytics_code)
  end

  def get_stylesheets do
    style = Blog.Repo.get_by! Blog.Setting, name: "styles"
    "<style>#{style.text}</style>"
  end
end
