defmodule PodcasterinnenWeb.Router do
  use PodcasterinnenWeb, :router
  require Ueberauth

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/auth", PodcasterinnenWeb do
    pipe_through :browser

    get "/:provider", AuthController, :request
    get "/:provider/callback", AuthController, :callback
    post "/:provider/callback", AuthController, :callback
  end

  scope "/", PodcasterinnenWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/women", WomanController
    get "/logout", AuthController, :logout
  end

  # Other scopes may use custom stacks.
  # scope "/api", PodcasterinnenWeb do
  #   pipe_through :api
  # end
end
