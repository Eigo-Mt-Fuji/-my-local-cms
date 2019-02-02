defmodule MylocalCms.Repo.Migrations.CreateHotels do
  use Ecto.Migration

  def change do
    create table(:hotels) do
      add :title, :string
      add :description, :string
      add :lat, :float
      add :lon, :float

      timestamps()
    end

  end
end
