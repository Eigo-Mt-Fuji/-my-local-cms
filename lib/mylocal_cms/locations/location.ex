defmodule MylocalCms.Locations.Location do
  use Ecto.Schema
  import Ecto.Changeset


  schema "locations" do
    field :description, :string
    field :lat, :float
    field :lon, :float
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(location, attrs) do
    location
    |> cast(attrs, [:title, :description, :lat, :lon])
    |> validate_required([:title, :description, :lat, :lon])
  end
end
