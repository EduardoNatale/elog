defmodule Elog.Repo do
  use Ecto.Repo,
    otp_app: :elog,
    adapter: Ecto.Adapters.Postgres
end
