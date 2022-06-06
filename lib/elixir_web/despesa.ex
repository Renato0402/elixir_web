defmodule ElixirWeb.Despesa do
  use Ecto.Schema
  import Ecto.Changeset

  schema "despesa" do
    field :nome, :string
    field :valor, :string

    belongs_to :user, ElixirWeb.User

    timestamps()
  end

  @doc false
  def changeset(despesa, attrs) do
    despesa
    |> cast(attrs, [:nome, :valor, :user_id])
    |> validate_required([:nome, :valor])
  end
end
