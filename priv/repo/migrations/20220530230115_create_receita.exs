defmodule ElixirWeb.Repo.Migrations.CreateReceita do
  use Ecto.Migration

  def change do
    create table(:receita) do
      add :nome, :string
      add :valor, :string

      timestamps()
    end
  end
end
