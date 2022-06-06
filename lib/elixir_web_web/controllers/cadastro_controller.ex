defmodule ElixirWebWeb.CadastroController do

  use ElixirWebWeb, :controller

  alias ElixirWeb.Repo
  alias ElixirWeb.User

  def new(conn, _params) do
    changeset = User.changeset(%User{}, %{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"user" => user}) do
    changeset = User.changeset(%User{}, user)
    case Repo.insert(changeset) do

      {:ok, user} ->
        conn
        |> put_flash(:info, "Pessoa #{user.nome} cadastrada com sucesso!")
        |> redirect(to: Routes.page_path(conn, :index))

      {:error, %Ecto.Changeset{} = changeset} ->
        changeset = %{changeset | action: :check_errors}
        render(conn, "new.html", changeset: changeset)

    end

  end

end
