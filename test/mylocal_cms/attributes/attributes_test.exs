defmodule MylocalCms.AttributesTest do
  use MylocalCms.DataCase

  alias MylocalCms.Attributes

  describe "attributes" do
    alias MylocalCms.Attributes.Attribute

    @valid_attrs %{label: "some label", value: "some value"}
    @update_attrs %{label: "some updated label", value: "some updated value"}
    @invalid_attrs %{label: nil, value: nil}

    def attribute_fixture(attrs \\ %{}) do
      {:ok, attribute} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Attributes.create_attribute()

      attribute
    end

    test "list_attributes/0 returns all attributes" do
      attribute = attribute_fixture()
      assert Attributes.list_attributes() == [attribute]
    end

    test "get_attribute!/1 returns the attribute with given id" do
      attribute = attribute_fixture()
      assert Attributes.get_attribute!(attribute.id) == attribute
    end

    test "create_attribute/1 with valid data creates a attribute" do
      assert {:ok, %Attribute{} = attribute} = Attributes.create_attribute(@valid_attrs)
      assert attribute.label == "some label"
      assert attribute.value == "some value"
    end

    test "create_attribute/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Attributes.create_attribute(@invalid_attrs)
    end

    test "update_attribute/2 with valid data updates the attribute" do
      attribute = attribute_fixture()
      assert {:ok, %Attribute{} = attribute} = Attributes.update_attribute(attribute, @update_attrs)
      assert attribute.label == "some updated label"
      assert attribute.value == "some updated value"
    end

    test "update_attribute/2 with invalid data returns error changeset" do
      attribute = attribute_fixture()
      assert {:error, %Ecto.Changeset{}} = Attributes.update_attribute(attribute, @invalid_attrs)
      assert attribute == Attributes.get_attribute!(attribute.id)
    end

    test "delete_attribute/1 deletes the attribute" do
      attribute = attribute_fixture()
      assert {:ok, %Attribute{}} = Attributes.delete_attribute(attribute)
      assert_raise Ecto.NoResultsError, fn -> Attributes.get_attribute!(attribute.id) end
    end

    test "change_attribute/1 returns a attribute changeset" do
      attribute = attribute_fixture()
      assert %Ecto.Changeset{} = Attributes.change_attribute(attribute)
    end
  end
end
