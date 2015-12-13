defmodule Blog.PostSerializer do
  use JaSerializer

  attributes [
    :title,
    :body,
    :slug,
    :data,
    :created_at,
    :updated_at
  ]
end
