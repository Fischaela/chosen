defmodule Podcasterinnen.Women.Woman do
  use Ecto.Schema
  import Ecto.Changeset


  schema "women" do
    field :forename, :string
    field :surname, :string
    field :city, :string
    field :country, :string
    field :twitter, :string
    field :website, :string
    field :podcasts, {:array, :string}
    field :remote, :boolean
    field :bio, :string

    timestamps()
  end

  @doc false
  def changeset(woman, attrs) do
    woman
    |> cast(attrs, [:forename, :surname, :city, :country, :twitter, :website, :podcasts, :remote, :bio])
    |> validate_required([:forename, :surname, :city, :country, :twitter, :website, :podcasts, :remote, :bio])
  end
end
