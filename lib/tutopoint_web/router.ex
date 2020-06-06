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

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :admin do
    plug TutopointWeb.EnsureRolePlug, :admin
  end

  pipeline :user do
    plug TutopointWeb.EnsureRolePlug, :admin
  end

  pipeline :guide do
    plug TutopointWeb.EnsureRolePlug, :admin
  end


  scope "/", Pow.Phoenix, as: "pow" do
    pipe_through :browser

    get "/register", RegistrationController, :new
    post "/register", RegistrationController, :create
    get "/signin", SessionController, :new
    get "/logout", SessionController, :delete
    post "/signin", SessionController, :create
  end

  scope "/", TutopointWeb do
    pipe_through :protected
    pipe_through :browser

    resources "/guides", GuideController
    live "/", PageLive, :index
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
      live_dashboard "/dashboard", metrics: TutopointWeb.Telemetry
    end
  end
end