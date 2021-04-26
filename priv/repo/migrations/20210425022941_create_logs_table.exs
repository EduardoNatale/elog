defmodule Elog.Repo.Migrations.CreateLogsTable do
  use Ecto.Migration

  def change do
    create table("logs") do
      add :data, :jsonb

      timestamps()
    end
  end
end
