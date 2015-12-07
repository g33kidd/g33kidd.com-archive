defmodule Blog.ContentExt.Markdown do
  def parse(content) do
    html = Earmark.to_html(content.data["body"])
    content.data |> Dict.put("html", html)
  end
end
