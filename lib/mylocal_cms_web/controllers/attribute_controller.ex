defmodule MylocalCmsWeb.AttributeController do
  use MylocalCmsWeb, :controller

  alias MylocalCms.Attributes
  alias MylocalCms.Attributes.Attribute

  action_fallback MylocalCmsWeb.FallbackController

  def index(conn, _params) do
    attributes = Attributes.list_attributes()
    render(conn, "index.json", attributes: attributes)
  end

  def create(conn, %{"attribute" => attribute_params}) do
    with {:ok, %Attribute{} = attribute} <- Attributes.create_attribute(attribute_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.attribute_path(conn, :show, attribute))
      |> render("show.json", attribute: attribute)
    end
  end

  def show(conn, %{"id" => id}) do
    attribute = Attributes.get_attribute!(id)
    render(conn, "show.json", attribute: attribute)
  end

  def update(conn, %{"id" => id, "attribute" => attribute_params}) do
    attribute = Attributes.get_attribute!(id)

    with {:ok, %Attribute{} = attribute} <- Attributes.update_attribute(attribute, attribute_params) do
      render(conn, "show.json", attribute: attribute)
    end
  end

  def delete(conn, %{"id" => id}) do
    attribute = Attributes.get_attribute!(id)

    with {:ok, %Attribute{}} <- Attributes.delete_attribute(attribute) do
      send_resp(conn, :no_content, "")
    end
  end
end
