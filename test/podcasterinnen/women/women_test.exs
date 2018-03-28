defmodule Podcasterinnen.WomenTest do
  use Podcasterinnen.DataCase

  alias Podcasterinnen.Women

  describe "women" do
    alias Podcasterinnen.Women.Woman

    @valid_attrs %{name: "some name", podcasts: []}
    @update_attrs %{name: "some updated name", podcasts: []}
    @invalid_attrs %{name: nil, podcasts: nil}

    def woman_fixture(attrs \\ %{}) do
      {:ok, woman} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Women.create_woman()

      woman
    end

    test "list_women/0 returns all women" do
      woman = woman_fixture()
      assert Women.list_women() == [woman]
    end

    test "get_woman!/1 returns the woman with given id" do
      woman = woman_fixture()
      assert Women.get_woman!(woman.id) == woman
    end

    test "create_woman/1 with valid data creates a woman" do
      assert {:ok, %Woman{} = woman} = Women.create_woman(@valid_attrs)
      assert woman.name == "some name"
      assert woman.podcasts == []
    end

    test "create_woman/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Women.create_woman(@invalid_attrs)
    end

    test "update_woman/2 with valid data updates the woman" do
      woman = woman_fixture()
      assert {:ok, woman} = Women.update_woman(woman, @update_attrs)
      assert %Woman{} = woman
      assert woman.name == "some updated name"
      assert woman.podcasts == []
    end

    test "update_woman/2 with invalid data returns error changeset" do
      woman = woman_fixture()
      assert {:error, %Ecto.Changeset{}} = Women.update_woman(woman, @invalid_attrs)
      assert woman == Women.get_woman!(woman.id)
    end

    test "delete_woman/1 deletes the woman" do
      woman = woman_fixture()
      assert {:ok, %Woman{}} = Women.delete_woman(woman)
      assert_raise Ecto.NoResultsError, fn -> Women.get_woman!(woman.id) end
    end

    test "change_woman/1 returns a woman changeset" do
      woman = woman_fixture()
      assert %Ecto.Changeset{} = Women.change_woman(woman)
    end
  end
end
