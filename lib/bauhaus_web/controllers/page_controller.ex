defmodule BauhausWeb.PageController do
  use BauhausWeb, :controller

  import Phoenix.LiveView.Controller

  def index(conn, _params) do
    render(conn, "index.html", session: %{id: 1})
  end
end
