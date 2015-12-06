defmodule ContentExt do
  require Logger

  def parse(content, type \\ :markdown) do
    type = type |> Atom.to_string() |> String.capitalize()
    :"ContentExt.#{type}".parse(content)
  end
end
