import Ecto.Query

defmodule ElixirWebWeb.ReceitasController do

  use ElixirWebWeb, :controller

  alias ElixirWeb.Repo
  alias ElixirWeb.User
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

      {:ok, receita} ->
        conn
        |> put_flash(:info, "Receita cadastrada com sucesso!")
        |> redirect(to: Routes.receitas_path(conn, :index))

      {:error, %Ecto.Changeset{} = changeset} ->
        changeset = %{changeset | action: :check_errors}
        render(conn, "new.html", changeset: changeset)

    end

  end

  def update(conn, %{"user" => user}) do


  end

  def delete(conn, %{"user" => user}) do


  end

end
