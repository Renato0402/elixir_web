import Ecto.Query
import Comeonin

defmodule ElixirWebWeb.LoginController do

  use ElixirWebWeb, :controller

  alias ElixirWeb.Repo
  alias ElixirWeb.User

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def new(conn, _params) do
    changesetLogin = User.changesetLogin(%User{}, %{})
    render(conn, "new.html", changesetLogin: changesetLogin)
  end

  def auth(conn, %{"user" => user}) do

    changesetLogin = User.changesetLogin(%User{}, user)

    if(Repo.exists?(from u in User, where: u.senha == ^user["senha"] and u.email == ^user["email"])) do

      user = Repo.get_by(User, email: user["email"])

      conn
      |> put_session(:current_user_id, user.id)
      |> put_flash(:info, "Logada com sucesso!")
      |> redirect(to: Routes.page_path(conn, :index))

    else
      changesetLogin = %{changesetLogin | action: :check_errors}
      render(conn, "new.html", changesetLogin: changesetLogin)

    end

  end
end
