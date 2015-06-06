defmodule Playground.NeedControllerTest do
  use ExUnit.Case, async: false
  use Plug.Test
  alias Playground.Need
  alias Playground.Repo
  alias Ecto.Adapters.SQL


  setup do
    SQL.begin_test_transaction(Repo)

    on_exit fn ->
      SQL.rollback_test_transaction(Repo)
    end
  end

  test "/index returns a list of needs" do
    needs_as_json =
      %Need {description: "A better life", urgency: 5}
      |> Repo.insert
      |> List.wrap
      |> Poison.encode!

    response = conn(:get, "/api/needs") |> send_request

    assert response.status == 200
    assert response.resp_body == needs_as_json
  end

  defp send_request(conn) do
    conn
    |> put_private(:plug_skip_csrf_protection, true)
    |> Playground.Endpoint.call([])
  end
end