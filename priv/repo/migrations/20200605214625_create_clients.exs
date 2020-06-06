defmodule Tutopoint.Repo.Migrations.CreateClients do
  use Ecto.Migration

  def change do
    create table(:clients) do
      add :user_id, references("users"), null: false
      add :name, :string
      add :phone, :string
      add :stripeid, :string

      timestamps()
    end

  end
end
