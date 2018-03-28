defmodule Podcasterinnen.Repo.Migrations.AddCountryCityFieldsToWoman do
  use Ecto.Migration

  def change do
    alter table(:women) do
      add :city, :string
      add :country, :string
    end
  end
end
