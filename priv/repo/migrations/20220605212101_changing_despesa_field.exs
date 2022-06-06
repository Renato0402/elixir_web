defmodule ElixirWeb.Repo.Migrations.ChangingDespesaField do
  use Ecto.Migration

  def change do
    rename table(:despesa), :idUser, to: :user_id
  end
end
