defmodule Playground.Need do
  use Ecto.Model

  schema "needs" do
    field :description
    field :urgency, :integer

    timestamps
  end
end