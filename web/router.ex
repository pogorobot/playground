defmodule Playground.Router do
  use Playground.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Playground do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  scope "/api", Playground do
    pipe_through :api

    resources "/needs", NeedController
  end
end
