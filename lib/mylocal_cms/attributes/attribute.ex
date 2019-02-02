defmodule MylocalCms.Attributes.Attribute do
  use Ecto.Schema
  import Ecto.Changeset


  schema "attributes" do
    field :label, :string
    field :value, :string

    timestamps()
  end

  @doc false
  def changeset(attribute, attrs) do
    attribute
    |> cast(attrs, [:label, :value])
    |> validate_required([:label, :value])
  end
end
