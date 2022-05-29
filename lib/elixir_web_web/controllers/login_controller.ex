defmodule ElixirWebWeb.LoginController do
  use ElixirWebWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def new(conn, _params) do
    render(conn, "new.html")
  end
end
