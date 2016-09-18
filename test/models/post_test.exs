defmodule Api.PostTest do
  use Api.ModelCase

  alias Api.Post

  @valid_attrs %{company: "some content", content: "some content", location: "some content", logo: "some content", title: "some content", url: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Post.changeset(%Post{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Post.changeset(%Post{}, @invalid_attrs)
    refute changeset.valid?
  end
end
