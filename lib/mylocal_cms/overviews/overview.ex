defmodule MylocalCms.Overviews.Overview do
  use Ecto.Schema
  import Ecto.Changeset


  schema "overviews" do
    field :from_lat, :float
    field :from_location, :string
    field :from_lon, :float
    field :title, :string
    field :to_lat, :float
    field :to_location, :string
    field :to_lon, :float

    timestamps()
  end

  @doc false
  def changeset(overview, attrs) do
    overview
    |> cast(attrs, [:title, :from_lat, :from_lon, :from_location, :to_lat, :to_lon, :to_location])
    |> validate_required([:title, :from_lat, :from_lon, :from_location, :to_lat, :to_lon, :to_location])
  end
end
