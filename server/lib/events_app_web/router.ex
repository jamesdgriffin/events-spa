defmodule EventsAppWeb.Router do
  use EventsAppWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api/v1", EventsAppWeb do
    pipe_through :api

    resources "/users", UserController, except: [:new, :edit]
    resources "/events", EventController, except: [:new, :edit]
  end

  # Other scopes may use custom stacks.
  # scope "/api", EventsAppWeb do
  #   pipe_through :api
  # end
end
