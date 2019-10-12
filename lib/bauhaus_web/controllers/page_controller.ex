defmodule BauhausWeb.PageController do
  use BauhausWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
