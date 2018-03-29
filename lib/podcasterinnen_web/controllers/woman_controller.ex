defmodule PodcasterinnenWeb.WomanController do
  use PodcasterinnenWeb, :controller

  alias Podcasterinnen.Women
  alias Podcasterinnen.Women.Woman

  plug :secure

  defp secure(conn, _params) do
    user = get_session(conn, :current_user)
    case user do
     nil ->
         conn |> redirect(to: "/auth/auth0") |> halt
     _ ->
       conn
       |> assign(:current_user, user)
    end
  end

  def index(conn, _params) do
    women = Women.list_women()
    render(conn, "index.html", women: women)
  end

  def new(conn, _params) do
    changeset = Women.change_woman(%Woman{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"woman" => woman_params}) do
    case Women.create_woman(woman_params) do
      {:ok, woman} ->
        conn
        |> put_flash(:info, "Woman created successfully.")
        |> redirect(to: woman_path(conn, :show, woman))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    woman = Women.get_woman!(id)
    render(conn, "show.html", woman: woman)
  end

  def edit(conn, %{"id" => id}) do
    woman = Women.get_woman!(id)
    changeset = Women.change_woman(woman)
    render(conn, "edit.html", woman: woman, changeset: changeset)
  end

  def update(conn, %{"id" => id, "woman" => woman_params}) do
    woman = Women.get_woman!(id)

    case Women.update_woman(woman, woman_params) do
      {:ok, woman} ->
        conn
        |> put_flash(:info, "Woman updated successfully.")
        |> redirect(to: woman_path(conn, :show, woman))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", woman: woman, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    woman = Women.get_woman!(id)
    {:ok, _woman} = Women.delete_woman(woman)

    conn
    |> put_flash(:info, "Woman deleted successfully.")
    |> redirect(to: woman_path(conn, :index))
  end
end
