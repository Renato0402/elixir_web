defmodule ElixirWebWeb.DespesasController do
  use ElixirWebWeb, :controller

  def index(conn, %{"nome" => nome}) do
    render(conn, "index.html", nome: nome)
  end

  def index(conn, _params) do
    render(conn, "index.html", nome: "None")
  end
end
