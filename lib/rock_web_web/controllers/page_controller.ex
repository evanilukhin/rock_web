defmodule RockWebWeb.PageController do
  use RockWebWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
