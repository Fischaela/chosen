defmodule PodcasterinnenWeb.WomanControllerTest do
  use PodcasterinnenWeb.ConnCase

  alias Podcasterinnen.Women

  @create_attrs %{name: "some name", podcasts: []}
  @update_attrs %{name: "some updated name", podcasts: []}
  @invalid_attrs %{name: nil, podcasts: nil}

  def fixture(:woman) do
    {:ok, woman} = Women.create_woman(@create_attrs)
    woman
  end

  describe "index" do
    test "lists all women", %{conn: conn} do
      conn = get conn, woman_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Women"
    end
  end

  describe "new woman" do
    test "renders form", %{conn: conn} do
      conn = get conn, woman_path(conn, :new)
      assert html_response(conn, 200) =~ "New Woman"
    end
  end

  describe "create woman" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, woman_path(conn, :create), woman: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == woman_path(conn, :show, id)

      conn = get conn, woman_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Woman"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, woman_path(conn, :create), woman: @invalid_attrs
      assert html_response(conn, 200) =~ "New Woman"
    end
  end

  describe "edit woman" do
    setup [:create_woman]

    test "renders form for editing chosen woman", %{conn: conn, woman: woman} do
      conn = get conn, woman_path(conn, :edit, woman)
      assert html_response(conn, 200) =~ "Edit Woman"
    end
  end

  describe "update woman" do
    setup [:create_woman]

    test "redirects when data is valid", %{conn: conn, woman: woman} do
      conn = put conn, woman_path(conn, :update, woman), woman: @update_attrs
      assert redirected_to(conn) == woman_path(conn, :show, woman)

      conn = get conn, woman_path(conn, :show, woman)
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, woman: woman} do
      conn = put conn, woman_path(conn, :update, woman), woman: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Woman"
    end
  end

  describe "delete woman" do
    setup [:create_woman]

    test "deletes chosen woman", %{conn: conn, woman: woman} do
      conn = delete conn, woman_path(conn, :delete, woman)
      assert redirected_to(conn) == woman_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, woman_path(conn, :show, woman)
      end
    end
  end

  defp create_woman(_) do
    woman = fixture(:woman)
    {:ok, woman: woman}
  end
end
