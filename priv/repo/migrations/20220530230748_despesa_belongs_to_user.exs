defmodule ElixirWeb.Repo.Migrations.DespesaBelongsToUser do
  use Ecto.Migration

  def change do
    alter table(:despesa) do
      add :idUser, references(:user)
    end
  end
end
