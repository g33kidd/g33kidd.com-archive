defmodule Blog.PostSerializer do
  use JaSerializer

  attributes [:title, :body]
end
