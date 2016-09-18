defmodule Elixirhunt.Router do
  use Elixirhunt.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api/v1", Elixirhunt do
    pipe_through :api

    resources "/posts", PostController, except: [:new, :edit]
    get "/ifttt/maker", IftttController, :maker
    get "/hello", PostController, :hello
  end
end
