defmodule MylocalCms.Repo do
  use Ecto.Repo,
    otp_app: :mylocal_cms,
    adapter: Ecto.Adapters.Postgres
end
