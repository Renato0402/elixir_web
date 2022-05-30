defmodule ElixirWeb.Repo.Migrations.ReceitaBelongsToUser do
  use Ecto.Migration

  def change do
    alter table(:receita) do
      add :idUser, references(:user)
    end
  end
end
