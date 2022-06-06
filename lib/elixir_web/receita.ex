defmodule ElixirWeb.Receita do
  use Ecto.Schema
  import Ecto.Changeset

  schema "receita" do
    field :nome, :string
    field :valor, :string

    belongs_to :user, ElixirWeb.User

    timestamps()

  end

  @doc false
  def changeset(receita, attrs) do
    receita
    |> cast(attrs, [:nome, :valor, :user_id])
    |> validate_required([:nome, :valor])
  end
end
