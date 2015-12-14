defmodule Blog.PostSerializer do
  use JaSerializer

  attributes [
    :title,
    :body,
    :slug,
    :data,
    :inserted_at,
    :updated_at
  ]
end
