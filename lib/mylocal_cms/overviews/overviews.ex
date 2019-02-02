defmodule MylocalCms.Overviews do
  @moduledoc """
  The Overviews context.
  """

  import Ecto.Query, warn: false
  alias MylocalCms.Repo

  alias MylocalCms.Overviews.Overview

  @doc """
  Returns the list of overviews.

  ## Examples

      iex> list_overviews()
      [%Overview{}, ...]

  """
  def list_overviews do
    Repo.all(Overview)
  end

  @doc """
  Gets a single overview.

  Raises `Ecto.NoResultsError` if the Overview does not exist.

  ## Examples

      iex> get_overview!(123)
      %Overview{}

      iex> get_overview!(456)
      ** (Ecto.NoResultsError)

  """
  def get_overview!(id), do: Repo.get!(Overview, id)

  @doc """
  Creates a overview.

  ## Examples

      iex> create_overview(%{field: value})
      {:ok, %Overview{}}

      iex> create_overview(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_overview(attrs \\ %{}) do
    %Overview{}
    |> Overview.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a overview.

  ## Examples

      iex> update_overview(overview, %{field: new_value})
      {:ok, %Overview{}}

      iex> update_overview(overview, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_overview(%Overview{} = overview, attrs) do
    overview
    |> Overview.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Overview.

  ## Examples

      iex> delete_overview(overview)
      {:ok, %Overview{}}

      iex> delete_overview(overview)
      {:error, %Ecto.Changeset{}}

  """
  def delete_overview(%Overview{} = overview) do
    Repo.delete(overview)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking overview changes.

  ## Examples

      iex> change_overview(overview)
      %Ecto.Changeset{source: %Overview{}}

  """
  def change_overview(%Overview{} = overview) do
    Overview.changeset(overview, %{})
  end
end
