defmodule Elixirhunt.PostView do
  use Elixirhunt.Web, :view

  def render("index.json", %{posts: posts}) do
    %{posts: render_many(posts, Elixirhunt.PostView, "post.json")}
  end

  def render("show.json", %{post: post}) do
    %{post: render_one(post, Elixirhunt.PostView, "post.json")}
  end

  def render("post.json", %{post: post}) do
    %{id: post.id,
      title: post.title,
      company: post.company,
      location: post.location,
      content: post.content,
      logo: post.logo,
      url: post.url}
  end
end
