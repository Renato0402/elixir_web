defmodule ElixirWebWeb.PageController do
  use ElixirWebWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def delete(conn, _params) do

    conn
    |> delete_session(:current_user_id)
    |> redirect(to: Routes.page_path(conn, :index))

  end
end
