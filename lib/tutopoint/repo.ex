defmodule Tutopoint.Repo do
  use Ecto.Repo,
    otp_app: :tutopoint,
    adapter: Ecto.Adapters.Postgres
end
