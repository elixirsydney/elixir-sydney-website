defmodule ElixirSydney.PageController do
  use ElixirSydney.Web, :controller
  alias ElixirSydney.Meetup
  alias ElixirSydney.Talk
  alias ElixirSydney.Speaker

  def index(conn, _params) do
    render conn, "index.html",
      meetup: Meetup.next_meetup,
      page_name: "home"
  end

  def about(conn, _params) do
    render conn, "about.html",
      page_name: "about"
  end

  def meetups(conn, _params) do
    render conn, "meetups.html",
      next_meetup: Meetup.next_meetup,
      past_meetups: Meetup.past_meetups,
      page_name: "meetups"
  end
end
