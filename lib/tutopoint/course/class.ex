defmodule Tutopoint.Course.Class do
  use Ecto.Schema
  import Ecto.Changeset
  alias Tutopoint.Users.Guide

  schema "classes" do
    field :comments, {:array, :string}
    field :course_type, :string
    field :date, {:array, :utc_datetime}
    field :description, :string
    field :instructor, :integer
    belongs_to :instructorProfile, Guide, foreign_key: :instructor, define_field: false
    field :max_student, :integer
    field :min, :integer
    field :pay_upfront, :boolean, default: false
    field :price, :integer
    field :structure, :string
    field :subs, {:array, :integer}, null: true
    field :title, :string
    field :approved, :boolean, default: false
    field :waitlist, :boolean, default: false

    timestamps()
  end

  @doc false
  def changeset(class, attrs) do
    class
    |> cast(attrs, [:title, :structure, :instructor, :subs, :course_type, :description, :date, :max_student, :min, :waitlist, :price, :pay_upfront, :comments])
    |> validate_inclusion(:structure, ["Group Lessons", "One-to-One Lessons", "Tutoring"])
    |> validate_required([:title, :structure, :instructor, :course_type, :description, :date, :max_student, :min, :waitlist, :price, :pay_upfront])
  end
end
