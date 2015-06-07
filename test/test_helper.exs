defmodule Playground.Case do
  use ExUnit.CaseTemplate
  alias Playground.Repo

  using do
    quote do
      alias Playground.Repo
      alias Playground.Need
      use Plug.Test

      def send_request(conn) do
        conn
        |> put_private(:plug_skip_csrf_protection, true)
        |> Playground.Endpoint.call([])
      end
    end
  end
end

ExUnit.start

# Create the database, run migrations, and start the test transaction.
Mix.Task.run "ecto.create", ["--quiet"]
Mix.Task.run "ecto.migrate", ["--quiet"]
Ecto.Adapters.SQL.begin_test_transaction(Playground.Repo)
