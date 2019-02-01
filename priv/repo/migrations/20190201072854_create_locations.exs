defmodule MylocalCms.Repo.Migrations.CreateLocations do
  use Ecto.Migration

  def change do
    create table(:locations) do
      add :title, :string
      add :description, :string
      add :lat, :float
      add :lon, :float

      timestamps()
    end

  end
end
