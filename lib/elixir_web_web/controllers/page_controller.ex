defmodule ElixirWebWeb.PageController do
  use ElixirWebWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
