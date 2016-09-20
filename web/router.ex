defmodule Elixirhunt.Router do
  use Elixirhunt.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", Elixirhunt do
    pipe_through :api

    # Endpoints
    resources "/posts", PostController, except: [:new, :edit]
    
    # Misc
    get "/ifttt/maker", IftttController, :maker

    scope "/admin", Admin do
      get "/session/show", SessionController, :show
      get "/session/revoke", SessionController, :revoke
      get "/session/create", SessionController, :create
    end
  end
end
