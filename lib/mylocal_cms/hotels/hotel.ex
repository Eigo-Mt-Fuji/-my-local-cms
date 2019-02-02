defmodule MylocalCms.Hotels.Hotel do
  use Ecto.Schema
  import Ecto.Changeset


  schema "hotels" do
    field :description, :string
    field :lat, :float
    field :lon, :float
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(hotel, attrs) do
    hotel
    |> cast(attrs, [:title, :description, :lat, :lon])
    |> validate_required([:title, :description, :lat, :lon])
  end
end
