defmodule Playground.NeedView do
  use Playground.Web, :view

  def render("index.json", %{needs: needs}) do
    needs
  end

  def render("create.json", %{need: need}) do
    need
  end
end