defmodule Blog.PostSerializer do
  use JaSerializer

  location "/posts"
  attributes [:title, :body]
end
