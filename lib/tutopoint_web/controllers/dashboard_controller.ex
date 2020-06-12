defmodule TutopointWeb.DashboardController do
    use TutopointWeb, :controller
    plug :put_root_layout, {TutopointWeb.LayoutView, "dashboard.html"}
    plug :put_layout, false

    def index(conn, _params) do
        render(conn, "index.html")

    end


end