defmodule PodcasterinnenWeb.PageController do
  use PodcasterinnenWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
