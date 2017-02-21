defmodule ElixirSydney.PageController do
  use ElixirSydney.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
