defmodule Blog.ExtraTest do
  use Blog.ModelCase

  alias Blog.Extra

  @valid_attrs %{map: %{}, name: "some content", text: "some content", type: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Extra.changeset(%Extra{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Extra.changeset(%Extra{}, @invalid_attrs)
    refute changeset.valid?
  end
end
