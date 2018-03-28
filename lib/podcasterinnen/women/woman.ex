defmodule Podcasterinnen.Women.Woman do
  use Ecto.Schema
  import Ecto.Changeset


  schema "women" do
    field :forename, :string
    field :surname, :string
    field :twitter, :string
    field :website, :string
    field :podcasts, {:array, :string}
    field :remote, :boolean

    timestamps()
  end

  @doc false
  def changeset(woman, attrs) do
    woman
    |> cast(attrs, [:forename, :surname, :twitter, :website, :podcasts, :remote])
    |> validate_required([:forename, :surname, :twitter, :website, :podcasts, :remote])
  end
end
