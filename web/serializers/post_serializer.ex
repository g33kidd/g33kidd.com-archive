defmodule Blog.PostSerializer do
  use JaSerializer

  attributes [
    :title,
    :body,
    :data,
    :created_at,
    :updated_at
  ]
end
