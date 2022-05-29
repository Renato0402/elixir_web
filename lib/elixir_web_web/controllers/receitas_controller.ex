defmodule ElixirWebWeb.ReceitasController do
  use ElixirWebWeb, :controller

  def edit(conn, %{"idUser" => idUser, "id" => id}) do
    render(conn, "edit.html", idUser: idUser, id: id)
  end

  def index(conn, %{"idUser" => idUser}) do
    render(conn, "index.html", idUser: idUser)
  end

  def edit(conn, _params) do
    render(conn, "edit.html", idUser: "0", id: "0")
  end

  def index(conn, _params) do
    render(conn, "index.html", idUser: "0")
  end

  def new(conn, _params) do
    render(conn, "new.html", idUser: "0")
  end
  
end
