defmodule Tutopoint.Users.Guide do
  use Ecto.Schema
  import Ecto.Changeset

  schema "guides" do
    belongs_to :user, Tutopoint.Users.User
    field :college, :string
    field :grade, :string
    field :hs, :string
    field :language, :string
    field :major, :string
    field :stripeid, :string

    timestamps()
  end

  @doc false
  def changeset(guide, attrs) do
    guide
    |> cast(attrs, [:college, :major, :grade, :hs, :language, :stripeid, :user_id])
    |> validate_required([:college, :major, :grade, :hs, :language, :stripeid, :user_id])
  end
end
