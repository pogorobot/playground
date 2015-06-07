defmodule Playground.NeedController do
  use Playground.Web, :controller
  alias Playground.Need

  plug :action

  def index(conn, _params) do
    needs = Repo.all(Need)
    render conn, needs: needs
  end
end