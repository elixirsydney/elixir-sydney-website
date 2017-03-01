defmodule ElixirSydney.PageController do
  use ElixirSydney.Web, :controller
  alias ElixirSydney.Meetup

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

  def meetup(conn, %{"slug" => slug}) do
    meetup =
      Meetup.past_meetups
      |> Enum.find(& &1.slug == slug)

    if meetup do
      render conn, "meetup.html",
        meetup: meetup,
        page_name: "meetup"
    else
      redirect conn, to: page_path(conn, :meetups)
    end
  end
end
