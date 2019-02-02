defmodule MylocalCmsWeb.AttributeControllerTest do
  use MylocalCmsWeb.ConnCase

  alias MylocalCms.Attributes
  alias MylocalCms.Attributes.Attribute

  @create_attrs %{
    label: "some label",
    value: "some value"
  }
  @update_attrs %{
    label: "some updated label",
    value: "some updated value"
  }
  @invalid_attrs %{label: nil, value: nil}

  def fixture(:attribute) do
    {:ok, attribute} = Attributes.create_attribute(@create_attrs)
    attribute
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all attributes", %{conn: conn} do
      conn = get(conn, Routes.attribute_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create attribute" do
    test "renders attribute when data is valid", %{conn: conn} do
      conn = post(conn, Routes.attribute_path(conn, :create), attribute: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.attribute_path(conn, :show, id))

      assert %{
               "id" => id,
               "label" => "some label",
               "value" => "some value"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.attribute_path(conn, :create), attribute: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update attribute" do
    setup [:create_attribute]

    test "renders attribute when data is valid", %{conn: conn, attribute: %Attribute{id: id} = attribute} do
      conn = put(conn, Routes.attribute_path(conn, :update, attribute), attribute: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.attribute_path(conn, :show, id))

      assert %{
               "id" => id,
               "label" => "some updated label",
               "value" => "some updated value"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, attribute: attribute} do
      conn = put(conn, Routes.attribute_path(conn, :update, attribute), attribute: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete attribute" do
    setup [:create_attribute]

    test "deletes chosen attribute", %{conn: conn, attribute: attribute} do
      conn = delete(conn, Routes.attribute_path(conn, :delete, attribute))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.attribute_path(conn, :show, attribute))
      end
    end
  end

  defp create_attribute(_) do
    attribute = fixture(:attribute)
    {:ok, attribute: attribute}
  end
end
