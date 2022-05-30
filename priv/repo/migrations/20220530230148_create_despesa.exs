defmodule ElixirWeb.Repo.Migrations.CreateDespesa do
  use Ecto.Migration

  def change do
    create table(:despesa) do
      add :nome, :string
      add :valor, :string

      timestamps()
    end
  end
end
