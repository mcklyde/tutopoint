defmodule Tutopoint.Course.Class do
  use Ecto.Schema
  import Ecto.Changeset

  schema "classes" do
    field :comments, :string
    field :course_type, :string
    field :date, :naive_datetime
    field :description, :string
    field :instructor, :integer
    field :max_student, :integer
    field :min, :integer
    field :pay_upfront, :boolean, default: false
    field :price, :integer
    field :structure, :string
    field :subs, :integer
    field :title, :string
    field :waitlist, :boolean, default: false

    timestamps()
  end

  @doc false
  def changeset(class, attrs) do
    class
    |> cast(attrs, [:title, :structure, :instructor, :subs, :course_type, :description, :date, :max_student, :min, :waitlist, :price, :pay_upfront, :comments])
    |> validate_required([:title, :structure, :instructor, :subs, :course_type, :description, :date, :max_student, :min, :waitlist, :price, :pay_upfront, :comments])
  end
end
