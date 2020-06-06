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
alias Tutopoint.Users

testPass = "12345678"

guide = [
  %{password: testPass, email: "mcklyde@lagnada.com", college: "UW", major: "CS", grade: "Freshman", hs: "BHS", language: "JP", stripeid: "currently_null", password_confirmation: "12345678"}
]

Enum.map(guide, fn guide ->
  Users.create_guide(guide)
end)

clients = [
  %{password: testPass, email: "client@client.com", name: "Test Client", phone: "4255595226", stripeid: "currently_null", password_confirmation: testPass}
]

Enum.map(clients, fn client ->
  Users.create_client(client)
end)