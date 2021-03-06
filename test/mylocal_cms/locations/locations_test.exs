defmodule MylocalCms.LocationsTest do
  use MylocalCms.DataCase

  alias MylocalCms.Locations

  describe "locations" do
    alias MylocalCms.Locations.Location

    @valid_attrs %{description: "some description", lat: 120.5, lon: 120.5, title: "some title"}
    @update_attrs %{description: "some updated description", lat: 456.7, lon: 456.7, title: "some updated title"}
    @invalid_attrs %{description: nil, lat: nil, lon: nil, title: nil}

    def location_fixture(attrs \\ %{}) do
      {:ok, location} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Locations.create_location()

      location
    end

    test "list_locations/0 returns all locations" do
      location = location_fixture()
      assert Locations.list_locations() == [location]
    end

    test "get_location!/1 returns the location with given id" do
      location = location_fixture()
      assert Locations.get_location!(location.id) == location
    end

    test "create_location/1 with valid data creates a location" do
      assert {:ok, %Location{} = location} = Locations.create_location(@valid_attrs)
      assert location.description == "some description"
      assert location.lat == 120.5
      assert location.lon == 120.5
      assert location.title == "some title"
    end

    test "create_location/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Locations.create_location(@invalid_attrs)
    end

    test "update_location/2 with valid data updates the location" do
      location = location_fixture()
      assert {:ok, %Location{} = location} = Locations.update_location(location, @update_attrs)
      assert location.description == "some updated description"
      assert location.lat == 456.7
      assert location.lon == 456.7
      assert location.title == "some updated title"
    end

    test "update_location/2 with invalid data returns error changeset" do
      location = location_fixture()
      assert {:error, %Ecto.Changeset{}} = Locations.update_location(location, @invalid_attrs)
      assert location == Locations.get_location!(location.id)
    end

    test "delete_location/1 deletes the location" do
      location = location_fixture()
      assert {:ok, %Location{}} = Locations.delete_location(location)
      assert_raise Ecto.NoResultsError, fn -> Locations.get_location!(location.id) end
    end

    test "change_location/1 returns a location changeset" do
      location = location_fixture()
      assert %Ecto.Changeset{} = Locations.change_location(location)
    end
  end
end
