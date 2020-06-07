defmodule Tutopoint.Repo.Migrations.CreateClasses do
  use Ecto.Migration

  def change do
    create table(:classes) do
      add :title, :string
      add :structure, :string
      add :instructor, :integer
      add :subs, :integer
      add :course_type, :string
      add :description, :text
      add :date, :naive_datetime
      add :max_student, :integer
      add :min, :integer
      add :waitlist, :boolean, default: false, null: false
      add :price, :integer
      add :pay_upfront, :boolean, default: false, null: false
      add :comments, :text

      timestamps()
    end

  end
end
