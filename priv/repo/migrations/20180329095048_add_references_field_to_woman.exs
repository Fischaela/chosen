defmodule Podcasterinnen.Repo.Migrations.AddReferencesFieldToWoman do
  use Ecto.Migration

  def change do
    alter table(:women) do
      add :references, {:array, :string}
    end
  end
end
