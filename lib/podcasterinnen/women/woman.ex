defmodule Podcasterinnen.Women.Woman do
  use Ecto.Schema
  import Ecto.Changeset


  schema "women" do
    field :forename, :string
    field :surname, :string
    field :twitter, :string
    field :podcasts, {:array, :string}

    timestamps()
  end

  @doc false
  def changeset(woman, attrs) do
    woman
    |> cast(attrs, [:forename, :surname, :twitter, :podcasts])
    |> validate_required([:forename, :surname, :twitter, :podcasts])
  end
end
