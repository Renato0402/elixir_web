import Ecto.Query

defmodule ElixirWebWeb.DespesasController do

  use ElixirWebWeb, :controller

  alias ElixirWeb.Repo
  alias ElixirWeb.User
  alias ElixirWeb.Despesa

  def edit(conn, _params) do
    changeset = Despesa.changeset(%Despesa{}, %{})
    render(conn, "edit.html", changeset: changeset)
  end

  def new(conn, _params) do
    changeset = Despesa.changeset(%Despesa{}, %{})
    render(conn, "new.html", changeset: changeset)
  end

  def index(conn, _params) do
    user_id = get_session(conn, :current_user_id)

    query = from d in Despesa,
      where: d.user_id == ^user_id

    despesas = Repo.all(query)

    render(conn, "index.html", despesas: despesas)
  end


  def create(conn, %{"despesa" => despesa}) do

    user_id = get_session(conn, :current_user_id)

    despesa = Map.merge(despesa, %{"user_id" => user_id})

    changeset = Despesa.changeset(%Despesa{},despesa)

    case Repo.insert(changeset) do

      {:ok,despesa} ->
        conn
        |> put_flash(:info, "Despesa cadastrada com sucesso!")
        |> redirect(to: Routes.despesas_path(conn, :index))

      {:error, %Ecto.Changeset{} = changeset} ->
        changeset = %{changeset | action: :check_errors}
        render(conn, "new.html", changeset: changeset)

    end

  end

  def update(conn, %{"despesa" => despesa}) do

    despesa = Repo.get_by(Despesa, nome: despesa["nome"], valor: despesa["valor"])




  end

  def delete(conn, %{"despesa" => despesa}) do

    despesa = Repo.get_by(Despesa, nome: despesa["nome"], valor: despesa["valor"])

    case Repo.delete(despesa) do

      {:ok,despesa} ->
        conn
        |> put_flash(:info, "Despesa deletada com sucesso!")
        |> redirect(to: Routes.despesas_path(conn, :index))

      {:error, _} ->
        conn
        |> redirect(to: Routes.despesas_path(conn, :index))

    end

  end

end
