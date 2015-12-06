defmodule Blog.ContentExt.Markdown do
  def parse(content) do
    html = Earmark.to_html(content.data.body)
    content = %{ content | data: %{ content.data | html: html } }
    content
  end
end
