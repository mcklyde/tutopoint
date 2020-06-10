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
alias Tutopoint.Course

testPass = "12345678"

guide = [
  %{password: testPass, email: "mcklyde@lagnada.com", college: "TitorU", major: "CS", grade: "Freshman", hs: "BHS", language: "JP", stripeid: "currently_null", password_confirmation: "12345678", name: "Titor Lagnada"},
  %{password: testPass, email: "zizcheng@berkeley.edu", college: "Berkeley", major: "CS", grade: "Freshman", hs: "BHS", language: "CZ", stripeid: "currently_null", password_confirmation: "12345678", name: "zeCheng"}
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

classes = [
%{title: "Elixir with TitorTheGod", structure: "Group Lessons", instructor: 1, course_type: "weekly", date: [DateTime.utc_now()], max_student: 8, min: 0, price: 20, description: "meme class sign up now!"},
%{title: "ACT Class with the best: ZizCheng", structure: "Group Lessons", instructor: 2, course_type: "weekly", date: [DateTime.utc_now()], max_student: 8, min: 0, price: 20, description: "meme class sign up now!"}
]


Enum.map(classes, fn class ->
 Course.create_class(class) 
end)