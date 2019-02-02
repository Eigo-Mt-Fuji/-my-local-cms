defmodule MylocalCms.Attributes do
  @moduledoc """
  The Attributes context.
  """

  import Ecto.Query, warn: false
  alias MylocalCms.Repo

  alias MylocalCms.Attributes.Attribute

  @doc """
  Returns the list of attributes.

  ## Examples

      iex> list_attributes()
      [%Attribute{}, ...]

  """
  def list_attributes do
    Repo.all(Attribute)
  end

  @doc """
  Gets a single attribute.

  Raises `Ecto.NoResultsError` if the Attribute does not exist.

  ## Examples

      iex> get_attribute!(123)
      %Attribute{}

      iex> get_attribute!(456)
      ** (Ecto.NoResultsError)

  """
  def get_attribute!(id), do: Repo.get!(Attribute, id)

  @doc """
  Creates a attribute.

  ## Examples

      iex> create_attribute(%{field: value})
      {:ok, %Attribute{}}

      iex> create_attribute(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_attribute(attrs \\ %{}) do
    %Attribute{}
    |> Attribute.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a attribute.

  ## Examples

      iex> update_attribute(attribute, %{field: new_value})
      {:ok, %Attribute{}}

      iex> update_attribute(attribute, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_attribute(%Attribute{} = attribute, attrs) do
    attribute
    |> Attribute.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Attribute.

  ## Examples

      iex> delete_attribute(attribute)
      {:ok, %Attribute{}}

      iex> delete_attribute(attribute)
      {:error, %Ecto.Changeset{}}

  """
  def delete_attribute(%Attribute{} = attribute) do
    Repo.delete(attribute)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking attribute changes.

  ## Examples

      iex> change_attribute(attribute)
      %Ecto.Changeset{source: %Attribute{}}

  """
  def change_attribute(%Attribute{} = attribute) do
    Attribute.changeset(attribute, %{})
  end
end
