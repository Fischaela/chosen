defmodule Podcasterinnen.Repo.Migrations.AddAuthidFieldToWoman do
  use Ecto.Migration

  def change do
    alter table(:women) do
      add :authId, :string
    end
  end
end
