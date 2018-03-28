defmodule Podcasterinnen.Women.Woman do
  use Ecto.Schema
  import Ecto.Changeset


  schema "women" do
    field :name, :string
    field :podcasts, {:array, :string}

    timestamps()
  end

  @doc false
  def changeset(woman, attrs) do
    woman
    |> cast(attrs, [:name, :podcasts])
    |> validate_required([:name, :podcasts])
  end
end
