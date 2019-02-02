defmodule MylocalCms.HotelsTest do
  use MylocalCms.DataCase

  alias MylocalCms.Hotels

  describe "hotels" do
    alias MylocalCms.Hotels.Hotel

    @valid_attrs %{description: "some description", lat: 120.5, lon: 120.5, title: "some title"}
    @update_attrs %{description: "some updated description", lat: 456.7, lon: 456.7, title: "some updated title"}
    @invalid_attrs %{description: nil, lat: nil, lon: nil, title: nil}

    def hotel_fixture(attrs \\ %{}) do
      {:ok, hotel} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Hotels.create_hotel()

      hotel
    end

    test "list_hotels/0 returns all hotels" do
      hotel = hotel_fixture()
      assert Hotels.list_hotels() == [hotel]
    end

    test "get_hotel!/1 returns the hotel with given id" do
      hotel = hotel_fixture()
      assert Hotels.get_hotel!(hotel.id) == hotel
    end

    test "create_hotel/1 with valid data creates a hotel" do
      assert {:ok, %Hotel{} = hotel} = Hotels.create_hotel(@valid_attrs)
      assert hotel.description == "some description"
      assert hotel.lat == 120.5
      assert hotel.lon == 120.5
      assert hotel.title == "some title"
    end

    test "create_hotel/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Hotels.create_hotel(@invalid_attrs)
    end

    test "update_hotel/2 with valid data updates the hotel" do
      hotel = hotel_fixture()
      assert {:ok, %Hotel{} = hotel} = Hotels.update_hotel(hotel, @update_attrs)
      assert hotel.description == "some updated description"
      assert hotel.lat == 456.7
      assert hotel.lon == 456.7
      assert hotel.title == "some updated title"
    end

    test "update_hotel/2 with invalid data returns error changeset" do
      hotel = hotel_fixture()
      assert {:error, %Ecto.Changeset{}} = Hotels.update_hotel(hotel, @invalid_attrs)
      assert hotel == Hotels.get_hotel!(hotel.id)
    end

    test "delete_hotel/1 deletes the hotel" do
      hotel = hotel_fixture()
      assert {:ok, %Hotel{}} = Hotels.delete_hotel(hotel)
      assert_raise Ecto.NoResultsError, fn -> Hotels.get_hotel!(hotel.id) end
    end

    test "change_hotel/1 returns a hotel changeset" do
      hotel = hotel_fixture()
      assert %Ecto.Changeset{} = Hotels.change_hotel(hotel)
    end
  end
end
