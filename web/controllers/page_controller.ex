defmodule ElixirSydney.PageController do
  use ElixirSydney.Web, :controller
  alias ElixirSydney.Meetup

  def index(conn, _params) do
    meetup =
      %Meetup{
        title: "Authentication, Recursion and Registries",
        date: "Wednesday 1st, March 2017",
        location: "Pivotal Labs",
        url: "https://www.meetup.com/en-AU/sydney-ex/events/237380598/"
      }

    render conn, "index.html", meetup: meetup
  end

  def about(conn, _params) do
    render conn, "about.html"
  end
end
