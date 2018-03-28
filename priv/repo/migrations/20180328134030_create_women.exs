defmodule Podcasterinnen.Repo.Migrations.CreateWomen do
  use Ecto.Migration

  def change do
    create table(:women) do
      add :name, :string
      add :podcasts, {:array, :string}

      timestamps()
    end

  end
end
