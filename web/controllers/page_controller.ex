defmodule ElixirSydney.PageController do
  use ElixirSydney.Web, :controller
  alias ElixirSydney.Meetup

  defmodule Talk do
    defstruct [:title, :description, :speaker]
  end

  defmodule Speaker do
    defstruct [:name, :avatar_url, :meetup_url, :website_url, :twitter]
  end

  def index(conn, _params) do
    meetup =
      %Meetup{
        title: "Authentication, Recursion and Registries",
        date: "Wednesday 1st, March 2017, 6:00pm - 8:30pm",
        location: "Pivotal Labs, Level 11, 155 Clarence Street",
        location_url: "https://www.google.com.au/maps/dir//Pivotal,+11%2F155+Clarence+St,+Sydney+NSW+2000/@-33.8679869,151.1698764,13z/data=!3m1!4b1!4m8!4m7!1m0!1m5!1m1!1s0x6b12ae3f3b312871:0x40fe7bd0f94a2249!2m2!1d151.2049818!2d-33.8679919",
        description: """
        Single-origin coffee selfies tbh, pabst hexagon farm-to-table ennui kogi neutra. 3 wolf moon umami art party, ethical flexitarian street art venmo. Vape hoodie wayfarers pop-up, artisan heirloom forage taxidermy. Venmo umami whatever, chicharrones activated charcoal pabst hammock prism master cleanse. VHS woke sartorial, tattooed glossier pug swag cray chicharrones PBR&B. Deep v woke swag, normcore viral photo booth actually. Typewriter cornhole meggings, forage ramps whatever godard art party gentrify mustache kickstarter PBR&B fashion axe.

        Cliche retro leggings vaporware vexillologist 90's. Ramps salvia taxidermy narwhal wayfarers. Meditation hoodie umami next level, gastropub keytar church-key man bun butcher pitchfork direct trade blue bottle pabst. Pinterest XOXO unicorn trust fund, microdosing subway tile church-key coloring book whatever hella tumblr la croix 90's ethical next level. Flannel bushwick sartorial asymmetrical flexitarian pinterest, heirloom locavore church-key raclette fam schlitz quinoa try-hard yuccie. Disrupt narwhal tacos iPhone mustache, vexillologist waistcoat hell of ennui fap jean shorts. Craft beer scenester listicle vinyl vape small batch.
        """,
        url: "https://www.meetup.com/en-AU/sydney-ex/events/237380598/",
        talks: [
          %Talk{
            title: "Authentication with JWT",
            description: """
            Well, the way they make shows is, they make one show. That show's called a pilot. Then they show that show to the people who make shows, and on the strength of that one show they decide if they're going to make more shows. Some pilots get picked and become television programs. Some don't, become nothing. She starred in one of the ones that became nothing.
            """,
            speaker: %Speaker{
              name: "Sunil Gopinath",
              avatar_url: "https://a248.e.akamai.net/secure.meetupstatic.com/photos/member/c/2/d/a/member_115669882.jpeg",
              meetup_url: "https://www.meetup.com/en-AU/sydney-ex/members/43452202/",
              website_url: "",
              twitter: ""
            }
          },
          %Talk{
            title: "Getting Comfortable With Recursion",
            description: """
            You think water moves fast? You should see ice. It moves like it has a mind. Like it knows it killed the world once and got a taste for murder. After the avalanche, it took us a week to climb out. Now, I don't know exactly when we turned on each other, but I know that seven of us survived the slide... and only five made it out. Now we took an oath, that I'm breaking now. We said we'd say it was the snow that killed the other two, but it wasn't. Nature is lethal but it doesn't hold a candle to man.
            """,
            speaker: %Speaker{
              name: "Josh Price",
              avatar_url: "https://a248.e.akamai.net/secure.meetupstatic.com/photos/member/4/5/c/e/member_12197870.jpeg",
              meetup_url: "https://www.meetup.com/en-AU/sydney-ex/members/8425371/",
              website_url: "",
              twitter: "@joshprice"
            }
          },
          %Talk{
            title: "Using the New Registry in Elixir 1.4",
            description: """
            Do you see any Teletubbies in here? Do you see a slender plastic tag clipped to my shirt with my name printed on it? Do you see a little Asian child with a blank expression on his face sitting outside on a mechanical helicopter that shakes when you put quarters in it? No? Well, that's what you see at a toy store. And you must think you're in a toy store, because you're here shopping for an infant named Jeb.
            """,
            speaker: %Speaker{
              name: "Martin Stannard",
              avatar_url: "https://a248.e.akamai.net/secure.meetupstatic.com/photos/member/1/7/c/c/member_251766092.jpeg",
              meetup_url: "https://www.meetup.com/en-AU/sydney-ex/members/83178992/",
              website_url: "",
              twitter: ""
            }
          }
        ]
      }

    render conn, "index.html", meetup: meetup
  end

  def about(conn, _params) do
    render conn, "about.html"
  end
end
