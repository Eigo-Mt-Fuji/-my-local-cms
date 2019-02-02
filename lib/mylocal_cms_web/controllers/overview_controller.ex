defmodule MylocalCmsWeb.OverviewController do
  use MylocalCmsWeb, :controller

  alias MylocalCms.Overviews
  alias MylocalCms.Overviews.Overview

  action_fallback MylocalCmsWeb.FallbackController

  def index(conn, _params) do
    overviews = Overviews.list_overviews()
    render(conn, "index.json", overviews: overviews)
  end

  def create(conn, %{"overview" => overview_params}) do
    with {:ok, %Overview{} = overview} <- Overviews.create_overview(overview_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.overview_path(conn, :show, overview))
      |> render("show.json", overview: overview)
    end
  end

  def show(conn, %{"id" => id}) do
    overview = Overviews.get_overview!(id)
    render(conn, "show.json", overview: overview)
  end

  def update(conn, %{"id" => id, "overview" => overview_params}) do
    overview = Overviews.get_overview!(id)

    with {:ok, %Overview{} = overview} <- Overviews.update_overview(overview, overview_params) do
      render(conn, "show.json", overview: overview)
    end
  end

  def delete(conn, %{"id" => id}) do
    overview = Overviews.get_overview!(id)

    with {:ok, %Overview{}} <- Overviews.delete_overview(overview) do
      send_resp(conn, :no_content, "")
    end
  end
end
