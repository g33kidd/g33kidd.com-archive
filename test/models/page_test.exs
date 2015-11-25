defmodule Blog.PageTest do
  use Blog.ModelCase

  alias Blog.Page

  @valid_attrs %{content: "some content", html: "some content", styles: %{}, title: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Page.changeset(%Page{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Page.changeset(%Page{}, @invalid_attrs)
    refute changeset.valid?
  end
end
