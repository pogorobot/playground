defmodule Playground.NeedController do
  use Playground.Web, :controller
  alias Playground.Need

  plug :action

  def index(conn, _params) do
    needs = Repo.all(Need)
    render conn, needs: needs
  end

  def create(conn, %{"need" => %{"description" => description, "urgency" => urgency}}) do
    need = %Playground.Need{description: description, urgency: urgency}
    Repo.insert(need)

    conn
    |> send_resp(201, [])
  end
end