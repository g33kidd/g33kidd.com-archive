defmodule Blog.SettingTest do
  use Blog.ModelCase

  alias Blog.Setting

  @valid_attrs %{key: "some content", map: %{}, val: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Setting.changeset(%Setting{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Setting.changeset(%Setting{}, @invalid_attrs)
    refute changeset.valid?
  end
end
