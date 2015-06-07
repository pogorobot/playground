defmodule Playground.NeedControllerTest do
  use Playground.Case, async: false

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

  test "/create creates a new need" do
    need_params = %{"need" => %{"description" => "A loving family", "urgency" => 3}}

    response = conn(:post, "/api/needs", need_params) |> send_request

    assert response.status == 201
  end

end