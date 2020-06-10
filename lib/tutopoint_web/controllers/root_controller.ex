defmodule TutopointWeb.RootController do
    use TutopointWeb, :controller
    alias Tutopoint.Users
    alias Tutopoint.Course
    alias Tutopoint.Repo


    def index(conn, _params) do
        classes = Course.list_classes()
        |> Repo.preload(:instructorProfile)
        IO.inspect(classes)
        render(conn, "index.html", classes: classes)
    end
    
end