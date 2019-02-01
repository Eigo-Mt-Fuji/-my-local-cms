defmodule MylocalCmsWeb.PageController do
  use MylocalCmsWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
