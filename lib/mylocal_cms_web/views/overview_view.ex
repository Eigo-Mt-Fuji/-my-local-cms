defmodule MylocalCmsWeb.OverviewView do
  use MylocalCmsWeb, :view
  alias MylocalCmsWeb.OverviewView

  def render("index.json", %{overviews: overviews}) do
    %{data: render_many(overviews, OverviewView, "overview.json")}
  end

  def render("show.json", %{overview: overview}) do
    %{data: render_one(overview, OverviewView, "overview.json")}
  end

  def render("overview.json", %{overview: overview}) do
    %{id: overview.id,
      title: overview.title,
      from_lat: overview.from_lat,
      from_lon: overview.from_lon,
      from_location: overview.from_location,
      to_lat: overview.to_lat,
      to_lon: overview.to_lon,
      to_location: overview.to_location}
  end
end
