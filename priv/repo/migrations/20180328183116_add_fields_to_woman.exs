defmodule Podcasterinnen.Repo.Migrations.AddFieldsToWoman do
  use Ecto.Migration

  def change do
    alter table(:women) do
      remove :name, :string
      add :forename, :string
      add :surname, :string
      add :twitter, :string
      add :website, :string
    end
  end
end
