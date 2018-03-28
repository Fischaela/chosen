defmodule Podcasterinnen.Women do
  @moduledoc """
  The Women context.
  """

  import Ecto.Query, warn: false
  alias Podcasterinnen.Repo

  alias Podcasterinnen.Women.Woman

  @doc """
  Returns the list of women.

  ## Examples

      iex> list_women()
      [%Woman{}, ...]

  """
  def list_women do
    Repo.all(Woman)
  end

  @doc """
  Gets a single woman.

  Raises `Ecto.NoResultsError` if the Woman does not exist.

  ## Examples

      iex> get_woman!(123)
      %Woman{}

      iex> get_woman!(456)
      ** (Ecto.NoResultsError)

  """
  def get_woman!(id), do: Repo.get!(Woman, id)

  @doc """
  Creates a woman.

  ## Examples

      iex> create_woman(%{field: value})
      {:ok, %Woman{}}

      iex> create_woman(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_woman(attrs \\ %{}) do
    %Woman{}
    |> Woman.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a woman.

  ## Examples

      iex> update_woman(woman, %{field: new_value})
      {:ok, %Woman{}}

      iex> update_woman(woman, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_woman(%Woman{} = woman, attrs) do
    woman
    |> Woman.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Woman.

  ## Examples

      iex> delete_woman(woman)
      {:ok, %Woman{}}

      iex> delete_woman(woman)
      {:error, %Ecto.Changeset{}}

  """
  def delete_woman(%Woman{} = woman) do
    Repo.delete(woman)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking woman changes.

  ## Examples

      iex> change_woman(woman)
      %Ecto.Changeset{source: %Woman{}}

  """
  def change_woman(%Woman{} = woman) do
    Woman.changeset(woman, %{})
  end
end
