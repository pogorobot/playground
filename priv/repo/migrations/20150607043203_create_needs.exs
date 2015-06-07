defmodule Playground.Repo.Migrations.CreateNeeds do
  use Ecto.Migration

  def change do
    create table(:needs) do
      add :description,  :string
      add :urgency,      :integer

      timestamps
    end
  end
end
