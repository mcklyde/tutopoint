# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Tutopoint.Repo.insert!(%Tutopoint.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

testPass = "12345678"

users = [
    %{email: "mcklyde@lagnada.com", password: testPass, confirm_password: testPass}
]

Enum.map(users, fn user -> %Tutopoint.Users.User{} |> Tutopoint.Users.User.changeset(user) |> Tutopoint.Repo.insert!() end)