defmodule Playground.PageController do
  use Playground.Web, :controller

  plug :action

  def index(conn, _params) do
    render conn, "index.html"
  end
end
