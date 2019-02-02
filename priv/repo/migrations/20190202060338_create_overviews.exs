defmodule MylocalCms.Repo.Migrations.CreateOverviews do
  use Ecto.Migration

  def change do
    create table(:overviews) do
      add :title, :string
      add :from_lat, :float
      add :from_lon, :float
      add :from_location, :string
      add :to_lat, :float
      add :to_lon, :float
      add :to_location, :string

      timestamps()
    end

  end
end
