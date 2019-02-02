defmodule MylocalCms.OverviewsTest do
  use MylocalCms.DataCase

  alias MylocalCms.Overviews

  describe "overviews" do
    alias MylocalCms.Overviews.Overview

    @valid_attrs %{from_lat: 120.5, from_location: "some from_location", from_lon: 120.5, title: "some title", to_lat: 120.5, to_location: "some to_location", to_lon: 120.5}
    @update_attrs %{from_lat: 456.7, from_location: "some updated from_location", from_lon: 456.7, title: "some updated title", to_lat: 456.7, to_location: "some updated to_location", to_lon: 456.7}
    @invalid_attrs %{from_lat: nil, from_location: nil, from_lon: nil, title: nil, to_lat: nil, to_location: nil, to_lon: nil}

    def overview_fixture(attrs \\ %{}) do
      {:ok, overview} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Overviews.create_overview()

      overview
    end

    test "list_overviews/0 returns all overviews" do
      overview = overview_fixture()
      assert Overviews.list_overviews() == [overview]
    end

    test "get_overview!/1 returns the overview with given id" do
      overview = overview_fixture()
      assert Overviews.get_overview!(overview.id) == overview
    end

    test "create_overview/1 with valid data creates a overview" do
      assert {:ok, %Overview{} = overview} = Overviews.create_overview(@valid_attrs)
      assert overview.from_lat == 120.5
      assert overview.from_location == "some from_location"
      assert overview.from_lon == 120.5
      assert overview.title == "some title"
      assert overview.to_lat == 120.5
      assert overview.to_location == "some to_location"
      assert overview.to_lon == 120.5
    end

    test "create_overview/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Overviews.create_overview(@invalid_attrs)
    end

    test "update_overview/2 with valid data updates the overview" do
      overview = overview_fixture()
      assert {:ok, %Overview{} = overview} = Overviews.update_overview(overview, @update_attrs)
      assert overview.from_lat == 456.7
      assert overview.from_location == "some updated from_location"
      assert overview.from_lon == 456.7
      assert overview.title == "some updated title"
      assert overview.to_lat == 456.7
      assert overview.to_location == "some updated to_location"
      assert overview.to_lon == 456.7
    end

    test "update_overview/2 with invalid data returns error changeset" do
      overview = overview_fixture()
      assert {:error, %Ecto.Changeset{}} = Overviews.update_overview(overview, @invalid_attrs)
      assert overview == Overviews.get_overview!(overview.id)
    end

    test "delete_overview/1 deletes the overview" do
      overview = overview_fixture()
      assert {:ok, %Overview{}} = Overviews.delete_overview(overview)
      assert_raise Ecto.NoResultsError, fn -> Overviews.get_overview!(overview.id) end
    end

    test "change_overview/1 returns a overview changeset" do
      overview = overview_fixture()
      assert %Ecto.Changeset{} = Overviews.change_overview(overview)
    end
  end
end
