defmodule MylocalCmsWeb.HotelView do
  use MylocalCmsWeb, :view
  alias MylocalCmsWeb.HotelView

  def render("index.json", %{hotels: hotels}) do
    %{data: render_many(hotels, HotelView, "hotel.json")}
  end

  def render("show.json", %{hotel: hotel}) do
    %{data: render_one(hotel, HotelView, "hotel.json")}
  end

  def render("hotel.json", %{hotel: hotel}) do
    %{id: hotel.id,
      title: hotel.title,
      description: hotel.description,
      lat: hotel.lat,
      lon: hotel.lon}
  end
end
