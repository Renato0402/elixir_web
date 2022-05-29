defmodule ElixirWebWeb.CadastroController do
  use ElixirWebWeb, :controller

  def new(conn, _params) do
    render(conn, "new.html")
  end

end
