defmodule ElixirWebWeb.Router do
  use ElixirWebWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {ElixirWebWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ElixirWebWeb do
    pipe_through :browser

    get "/", PageController, :index

    get "/receitas", ReceitasController, :index

    get "/receitas/new", ReceitasController, :new

    get "/receitas/edit", ReceitasController, :edit

    get "/receitas/:idUser", ReceitasController, :index

    get "/receitas/:idUser/new", ReceitasController, :new

    get "/receitas/:idUser/edit/:id", ReceitasController, :edit

    get "/despesas", DespesasController, :index

    get "/despesas/new", DespesasController, :new

    get "/despesas/edit", DespesasController, :edit

    get "/despesas/:idUser", DespesasController, :index

    get "/despesas/:idUser/new", DespesasController, :new

    get "/despesas/:idUser/edit/:id", DespesasController, :edit

    get "/login", LoginController, :index

    get "/login/new", LoginController, :new

    get "/cadastro", CadastroController, :new

  end

  # Other scopes may use custom stacks.
  # scope "/api", ElixirWebWeb do
  #   pipe_through :api
  # end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: ElixirWebWeb.Telemetry
    end
  end

  # Enables the Swoosh mailbox preview in development.
  #
  # Note that preview only shows emails that were sent by the same
  # node running the Phoenix server.
  if Mix.env() == :dev do
    scope "/dev" do
      pipe_through :browser

      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
