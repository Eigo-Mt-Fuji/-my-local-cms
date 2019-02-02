defmodule MylocalCmsWeb.AttributeView do
  use MylocalCmsWeb, :view
  alias MylocalCmsWeb.AttributeView

  def render("index.json", %{attributes: attributes}) do
    %{data: render_many(attributes, AttributeView, "attribute.json")}
  end

  def render("show.json", %{attribute: attribute}) do
    %{data: render_one(attribute, AttributeView, "attribute.json")}
  end

  def render("attribute.json", %{attribute: attribute}) do
    %{id: attribute.id,
      label: attribute.label,
      value: attribute.value}
  end
end
