defmodule MylocalCmsWeb.HotelControllerTest do
  use MylocalCmsWeb.ConnCase

  alias MylocalCms.Hotels
  alias MylocalCms.Hotels.Hotel

  @create_attrs %{
    description: "some description",
    lat: 120.5,
    lon: 120.5,
    title: "some title"
  }
  @update_attrs %{
    description: "some updated description",
    lat: 456.7,
    lon: 456.7,
    title: "some updated title"
  }
  @invalid_attrs %{description: nil, lat: nil, lon: nil, title: nil}

  def fixture(:hotel) do
    {:ok, hotel} = Hotels.create_hotel(@create_attrs)
    hotel
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all hotels", %{conn: conn} do
      conn = get(conn, Routes.hotel_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create hotel" do
    test "renders hotel when data is valid", %{conn: conn} do
      conn = post(conn, Routes.hotel_path(conn, :create), hotel: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.hotel_path(conn, :show, id))

      assert %{
               "id" => id,
               "description" => "some description",
               "lat" => 120.5,
               "lon" => 120.5,
               "title" => "some title"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.hotel_path(conn, :create), hotel: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update hotel" do
    setup [:create_hotel]

    test "renders hotel when data is valid", %{conn: conn, hotel: %Hotel{id: id} = hotel} do
      conn = put(conn, Routes.hotel_path(conn, :update, hotel), hotel: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.hotel_path(conn, :show, id))

      assert %{
               "id" => id,
               "description" => "some updated description",
               "lat" => 456.7,
               "lon" => 456.7,
               "title" => "some updated title"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, hotel: hotel} do
      conn = put(conn, Routes.hotel_path(conn, :update, hotel), hotel: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete hotel" do
    setup [:create_hotel]

    test "deletes chosen hotel", %{conn: conn, hotel: hotel} do
      conn = delete(conn, Routes.hotel_path(conn, :delete, hotel))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.hotel_path(conn, :show, hotel))
      end
    end
  end

  defp create_hotel(_) do
    hotel = fixture(:hotel)
    {:ok, hotel: hotel}
  end
end
