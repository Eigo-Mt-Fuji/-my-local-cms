defmodule MylocalCmsWeb.OverviewControllerTest do
  use MylocalCmsWeb.ConnCase

  alias MylocalCms.Overviews
  alias MylocalCms.Overviews.Overview

  @create_attrs %{
    from_lat: 120.5,
    from_location: "some from_location",
    from_lon: 120.5,
    title: "some title",
    to_lat: 120.5,
    to_location: "some to_location",
    to_lon: 120.5
  }
  @update_attrs %{
    from_lat: 456.7,
    from_location: "some updated from_location",
    from_lon: 456.7,
    title: "some updated title",
    to_lat: 456.7,
    to_location: "some updated to_location",
    to_lon: 456.7
  }
  @invalid_attrs %{from_lat: nil, from_location: nil, from_lon: nil, title: nil, to_lat: nil, to_location: nil, to_lon: nil}

  def fixture(:overview) do
    {:ok, overview} = Overviews.create_overview(@create_attrs)
    overview
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all overviews", %{conn: conn} do
      conn = get(conn, Routes.overview_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create overview" do
    test "renders overview when data is valid", %{conn: conn} do
      conn = post(conn, Routes.overview_path(conn, :create), overview: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.overview_path(conn, :show, id))

      assert %{
               "id" => id,
               "from_lat" => 120.5,
               "from_location" => "some from_location",
               "from_lon" => 120.5,
               "title" => "some title",
               "to_lat" => 120.5,
               "to_location" => "some to_location",
               "to_lon" => 120.5
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.overview_path(conn, :create), overview: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update overview" do
    setup [:create_overview]

    test "renders overview when data is valid", %{conn: conn, overview: %Overview{id: id} = overview} do
      conn = put(conn, Routes.overview_path(conn, :update, overview), overview: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.overview_path(conn, :show, id))

      assert %{
               "id" => id,
               "from_lat" => 456.7,
               "from_location" => "some updated from_location",
               "from_lon" => 456.7,
               "title" => "some updated title",
               "to_lat" => 456.7,
               "to_location" => "some updated to_location",
               "to_lon" => 456.7
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, overview: overview} do
      conn = put(conn, Routes.overview_path(conn, :update, overview), overview: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete overview" do
    setup [:create_overview]

    test "deletes chosen overview", %{conn: conn, overview: overview} do
      conn = delete(conn, Routes.overview_path(conn, :delete, overview))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.overview_path(conn, :show, overview))
      end
    end
  end

  defp create_overview(_) do
    overview = fixture(:overview)
    {:ok, overview: overview}
  end
end
