defmodule Podcasterinnen.Repo.Migrations.AddLanguagesFieldToWoman do
  use Ecto.Migration

  def change do
    alter table(:women) do
      add :languages, {:array, :string}
    end
  end
end
