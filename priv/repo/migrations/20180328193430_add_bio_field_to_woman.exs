defmodule Podcasterinnen.Repo.Migrations.AddBioFieldToWoman do
  use Ecto.Migration

  def change do
    alter table(:women) do
      add :bio, :string
    end
  end
end
