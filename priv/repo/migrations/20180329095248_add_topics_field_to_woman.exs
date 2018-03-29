defmodule Podcasterinnen.Repo.Migrations.AddTopicsFieldToWoman do
  use Ecto.Migration

  def change do
    alter table(:women) do
      add :topics, {:array, :string}
    end
  end
end
