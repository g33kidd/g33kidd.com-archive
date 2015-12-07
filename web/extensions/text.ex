defmodule Blog.ContentExt.Text do
  def parse(content) do
    if html = content["html"] do
      text = HtmlSanitizeEx.strip_tags(html)
      # excerpt = html |> String.split()
      tokens = String.split(text, ".")
      IO.inspect tokens

      # text_data = %{
      #   "text" => HtmlSanitizeEx.strip_tags(html),
      #   "basic_html" => HtmlSanitizeEx.basic_html(html)
      # }

      %{ content | data: %{ content.data | text: text, tokens: tokens }}
    else
      content
    end
  end
end
