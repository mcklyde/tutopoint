defmodule Tutopoint.Repo.Migrations.CreateClasses do
  use Ecto.Migration

  def change do
    create table(:classes) do
      add :title, :string
      add :structure, :string
      add :instructor, references(:guides)
      add :subs, {:array, :integer}, null: true
      add :course_type, :string
      add :description, :text
      add :date, {:array, :utc_datetime}
      add :max_student, :integer
      add :min, :integer
      add :waitlist, :boolean, default: false, null: false
      add :price, :integer
      add :pay_upfront, :boolean, default: false, null: false
      add :approved , :boolean, default: false, null: false
      add :rating, :integer, default: -1
      add :comments, {:array, :text}

      timestamps()
    end

  end
end
