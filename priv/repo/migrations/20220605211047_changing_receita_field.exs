defmodule ElixirWeb.Repo.Migrations.ChangingReceitaField do
  use Ecto.Migration

  def change do
    rename table(:receita), :idUser, to: :user_id
  end
end
