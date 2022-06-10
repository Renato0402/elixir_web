import Ecto.Query

defmodule ElixirWebWeb.ReceitasController do

  use ElixirWebWeb, :controller

  alias ElixirWeb.Repo
  alias ElixirWeb.Receita

  def edit(conn, _params) do
    changeset = Receita.changeset(%Receita{}, %{})
    render(conn, "edit.html", changeset: changeset)
  end

  def new(conn, _params) do
    changeset = Receita.changeset(%Receita{}, %{})
    render(conn, "new.html", changeset: changeset)
  end

  def index(conn, _params) do

    user_id = get_session(conn, :current_user_id)

    query = from r in Receita,
      where: r.user_id == ^user_id

    receitas = Repo.all(query)

    render(conn, "index.html", receitas: receitas)

  end



  def create(conn, %{"receita" => receita}) do

    user_id = get_session(conn, :current_user_id)

    receita = Map.merge(receita, %{"user_id" => user_id})

    changeset = Receita.changeset(%Receita{}, receita)

    case Repo.insert(changeset) do

      {:ok, _} ->
        conn
        |> put_flash(:info, "Receita cadastrada com sucesso!")
        |> redirect(to: Routes.receitas_path(conn, :index))

      {:error, %Ecto.Changeset{} = changeset} ->
        changeset = %{changeset | action: :check_errors}
        render(conn, "new.html", changeset: changeset)

    end

  end

  def update(conn, %{"receita" => receita}) do

    id = conn.cookies["item_to_update"]

    receitaReal = Repo.get_by(Receita, id: id)

    changeset = Ecto.Changeset.change(receitaReal, %{nome: receita["nome"], valor: receita["valor"]})

    changeset = Ecto.Changeset.validate_required(changeset, [:nome, :valor])

    case Repo.update(changeset) do

      {:ok, _} ->
        conn
        |> put_flash(:info, "Receita atualizada com sucesso!")
        |> redirect(to: Routes.receitas_path(conn, :index))

      {:error, %Ecto.Changeset{} = changeset} ->
        changeset = %{changeset | action: :check_errors}
        render(conn, "edit.html", changeset: changeset)

    end

  end

  def delete(conn, _params) do

    id = conn.cookies["item_to_delete"]

    receita = Repo.get_by(Receita, id: id)

    case Repo.delete(receita) do

      {:ok, _} ->
        conn
        |> put_flash(:info, "Receita deletada com sucesso!")
        |> redirect(to: Routes.receitas_path(conn, :index))

      {:error, _} ->
        conn
        |> redirect(to: Routes.receitas_path(conn, :index))

    end


  end

end
