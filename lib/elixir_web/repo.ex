defmodule ElixirWeb.Repo do
  use Ecto.Repo,
    otp_app: :elixir_web,
    adapter: Ecto.Adapters.Postgres
end
