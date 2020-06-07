defmodule Tutopoint.Users.Client do
  use Ecto.Schema
  import Ecto.Changeset

  schema "clients" do
    belongs_to :user, Tutopoint.Users.User
    field :name, :string
    field :phone, :string
    field :stripeid, :string

    timestamps()
  end

  @doc false
  def changeset(client, attrs) do
    client
    |> cast(attrs, [:name, :phone, :stripeid, :user_id])
    |> validate_required([:name, :phone, :stripeid])
  end
end
