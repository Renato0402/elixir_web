defmodule ElixirWeb.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "user" do
    field :email, :string
    field :nome, :string
    field :senha, :string
    field :senha_confirmation, :string, virtual: true

    has_many :receita, ElixirWeb.Receita
    has_many :despesa, ElixirWeb.Despesa

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:nome, :email, :senha, :senha_confirmation])
    |> validate_required([:nome, :email, :senha, :senha_confirmation])
    |> validate_confirmation(:senha)
    |> unique_constraint(:email)
  end

  def changesetLogin(user, attrs) do
    user
    |> cast(attrs, [:email, :senha])
    |> validate_required([:email, :senha])
  end
end
