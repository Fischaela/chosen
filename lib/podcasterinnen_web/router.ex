defmodule PodcasterinnenWeb.Router do
  use PodcasterinnenWeb, :router

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

  scope "/", PodcasterinnenWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/podcasterinnen", PodcasterinnenController, :index
    get "/podcasterinnen/:messenger", PodcasterinnenController, :show
  end

  # Other scopes may use custom stacks.
  # scope "/api", PodcasterinnenWeb do
  #   pipe_through :api
  # end
end
