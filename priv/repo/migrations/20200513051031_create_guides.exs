defmodule Tutopoint.Repo.Migrations.CreateGuides do
  use Ecto.Migration

  def change do
    create table(:guides) do
      add :user_id, references("users"), null: false
      add :name, :string
      add :college, :string
      add :major, :string
      add :grade, :string
      add :hs, :string
      add :language, :string
      add :stripeid, :string

      timestamps()
    end

  end
end
