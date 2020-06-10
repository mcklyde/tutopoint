defmodule TutopointWeb.RegisterController do
    use TutopointWeb, :controller
    alias Tutopoint.Users.Client
    alias Tutopoint.Users.User


    def new(conn, _params) do

        changeset = Client.changeset(%Client{}, %{})

        conn 
        |> put_view(TutopointWeb.Pow.RegistrationView)
        |> render("new.html", changeset: changeset)
        
    end

    def create(conn, %{"user" => user_params}) do
        case Tutopoint.Users.create_client(user_params) do
            {:ok, _} -> 
                conn
                |>redirect("/")
            {:error, changeset} ->
                changeset = %{changeset | action: :insert}
                conn
                |> put_view(TutopointWeb.Pow.RegistrationView)
                |> render("new.html", changeset: changeset)

        end

    end
    
end