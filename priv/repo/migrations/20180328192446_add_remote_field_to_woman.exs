defmodule Podcasterinnen.Repo.Migrations.AddRemoteFieldToWoman do
  use Ecto.Migration

  def change do
    alter table(:women) do
      add :remote, :boolean
    end
  end
end
