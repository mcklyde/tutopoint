defmodule TutopointWeb.Router do
  use TutopointWeb, :router
  use Pow.Phoenix.Router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {TutopointWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :protected do
    plug Pow.Plug.RequireAuthenticated,
      error_handler: Pow.Phoenix.PlugErrorHandler
  end

  pipeline :auth do
    plug :put_root_layout, {TutopointWeb.LayoutView, "auth.html"}
    plug :put_layout, false

  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :admin do
    plug TutopointWeb.EnsureRolePlug, :admin
  end

  pipeline :user do
    plug TutopointWeb.EnsureRolePlug, :user
  end

  pipeline :guide do
    plug TutopointWeb.EnsureRolePlug, :guide
  end


  scope "/", TutopointWeb do
    pipe_through [:browser, :guide]


  end


  scope "/", as: "pow" do
    pipe_through [:browser, :auth]

    get "/register", TutopointWeb.RegisterController, :new
    post "/register", TutopointWeb.RegisterController, :create
    get "/signin", Pow.Phoenix.SessionController, :new
    get "/logout", Pow.Phoenix.SessionController, :delete
    post "/signin", Pow.Phoenix.SessionController, :create
  end

  scope "/", TutopointWeb do
    pipe_through :browser

    get "/dashboard", DashboardController, :index
    resources "/guides", GuideController
    resources "/clients", ClientController
    resources "/class", ClassController
    get "/", RootController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", TutopointWeb do
  #   pipe_through :api
  # end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser
      live_dashboard "/stats/dashboard", metrics: TutopointWeb.Telemetry
    end
  end
end
