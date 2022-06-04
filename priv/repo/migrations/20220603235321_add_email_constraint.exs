defmodule ElixirWeb.Repo.Migrations.AddEmailConstraint do
  use Ecto.Migration

  def change do
    create unique_index(:user, [:email])
  end
end
