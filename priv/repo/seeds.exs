# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     ElixirSydney.Repo.insert!(%ElixirSydney.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

defmodule Seeds do
  alias ElixirSydney.{Repo, Meetup, Talk, Person, Location}

  def insert_meetups do

    pivotal_office = Repo.insert!(
      %Location{
        name: "Pivotal Labs, Level 11, 155 Clarence Street",
        map_url: "https://www.google.com.au/maps/dir//Pivotal,+11%2F155+Clarence+St,+Sydney+NSW+2000/@-33.8679869,151.1698764,13z/data=!3m1!4b1!4m8!4m7!1m0!1m5!1m1!1s0x6b12ae3f3b312871:0x40fe7bd0f94a2249!2m2!1d151.2049818!2d-33.8679919"
      }
    )

    andrew_harvey = Repo.insert!(
      %Person{
        name: "Andrew Harvey",
        avatar_url: "https://a248.e.akamai.net/secure.meetupstatic.com/photos/member/5/a/3/e/member_224183102.jpeg",
        meetup_url: "https://www.meetup.com/en-AU/sydney-ex/members/11138446/",
        website_url: "",
        twitter: "@mootpointer"
      }
    )

    josh_price = Repo.insert!(
      %Person{
        name: "Josh Price",
        avatar_url: "https://a248.e.akamai.net/secure.meetupstatic.com/photos/member/4/5/c/e/member_12197870.jpeg",
        meetup_url: "https://www.meetup.com/en-AU/sydney-ex/members/8425371/",
        website_url: "",
        twitter: "@joshprice"
      }
    )

    sunil_gopinath = Repo.insert!(
      %Person{
        name: "Sunil Gopinath",
        avatar_url: "https://a248.e.akamai.net/secure.meetupstatic.com/photos/member/c/2/d/a/member_115669882.jpeg",
        meetup_url: "https://www.meetup.com/en-AU/sydney-ex/members/43452202/",
        website_url: "",
        twitter: ""
      }
    )

    martin_stannard = Repo.insert!(
      %Person{
        name: "Martin Stannard",
        avatar_url: "https://a248.e.akamai.net/secure.meetupstatic.com/photos/member/1/7/c/c/member_251766092.jpeg",
        meetup_url: "https://www.meetup.com/en-AU/sydney-ex/members/83178992/",
        website_url: "",
        twitter: ""
      }
    )

    nick_gunn = Repo.insert!(
      %Person{
        name: "Nick Gunn",
        avatar_url: "https://a248.e.akamai.net/secure.meetupstatic.com/s/img/2982428616572973604/noPhoto_80.gif",
        meetup_url: "https://www.meetup.com/en-AU/sydney-ex/members/205821026/",
        website_url: "",
        twitter: ""
      }
    )

    robin_hilliard = Repo.insert!(
      %Person{
        name: "Robin Hilliard",
        avatar_url: "https://a248.e.akamai.net/secure.meetupstatic.com/photos/member/a/5/2/f/member_3822287.jpeg",
        meetup_url: "https://www.meetup.com/en-AU/sydney-ex/members/7114884/",
        website_url: "",
        twitter: ""
      }
    )

    james_sadler = Repo.insert!(
      %Person{
        name: "James Sadler",
        avatar_url: "https://a248.e.akamai.net/secure.meetupstatic.com/photos/member/2/8/f/b/member_258850491.jpeg",
        meetup_url: "https://www.meetup.com/en-AU/sydney-ex/members/202221787/",
        website_url: "",
        twitter: "@freshtonic"
      }
    )

    geoff_hodgson = Repo.insert!(
    %Person{
      name: "Geoff Hodgson",
      avatar_url: "https://a248.e.akamai.net/secure.meetupstatic.com/photos/member/d/e/2/8/member_138056872.jpeg",
      meetup_url: "https://www.meetup.com/en-AU/sydney-ex/members/105623792/",
      website_url: "",
      twitter: "@geoffroh"
    }
    )

    alex_tsirel = Repo.insert!(
    %Person{
      name: "Alex Tsirel",
      avatar_url: "https://secure.meetupstatic.com/photos/member/1/b/c/8/member_126127112.jpeg",
      meetup_url: "https://www.meetup.com/en-AU/sydney-ex/members/98555692/",
      website_url: "",
      twitter: ""
    }
    )

    alan_milligan = Repo.insert!(
    %Person{
      name: "Alan Milligan",
      avatar_url: "https://secure.meetupstatic.com/photos/member/a/1/b/0/highres_209981392.jpeg",
      meetup_url: "https://www.meetup.com/en-AU/sydney-ex/members/13064111/",
      website_url: "",
      twitter: "@bastionlinux"
    }
    )

    garret_heinlen = Repo.insert!(
    %Person{
      name: "Garret Heinlen",
      avatar_url: "https://secure.meetupstatic.com/photos/member/b/7/a/4/member_184907012.jpeg",
      meetup_url: "https://www.meetup.com/en-AU/sydney-ex/members/98723842/",
      website_url: "",
      twitter: "@gogogarrett"
    }
    )

    raw_meetups = [
      %Meetup{
        title: "🔥 Phoenix, Ecto and Nerves",
        slug: "phoenix-ecto-and-nerves",
        date: ~D[2017-04-05],
        location: pivotal_office,
        description: """
        With the new updates to Phoenix 1.3 and Ecto 2.1, we will take another look at the things we can do with Phoenix and Ecto. We will also discuss Nerves which allows the building of embedded software for RaspberryPis in Elixir.
        """,
        url: "https://www.meetup.com/en-AU/sydney-ex/events/238021480/",
        talks: [
          %Talk{
            title: "Functional Firmware with Nerves",
            slug: "functional-firmware-with-nerves",
            description: """
            In this talk we will explore Nerves, the Elixir framework for building and deploying embedded software. Nerves is the easiest way to deploy Elixir to the Raspberry Pi or the Beaglebone.
            """,
            presenter: andrew_harvey
          },
          %Talk{
            title: "What's New in Phoenix 1.3",
            slug: "whats-new-in-phoenix-1-3",
            description: """
            Phoenix 1.3 has just been released and there are lots of new changes. The project structure is significantly different and guide developers in the right direction for the best way to structure applications. We'll take a look at this and all the other cool new features.
            """,
            slide_url: "https://github.com/sydneyelixir/sydneyelixir.github.io/tree/master/meetups/2017-04/whats_new_in_phoenix_1.3-josh_price",
            presenter: josh_price
          },
          %Talk{
            title: "Ecto 2.1 Tips and Tricks",
            slug: "ecto-2-1-tips-and-tricks",
            description: """
            If you want to talk to a datastore, you’re going to want to make friends with Ecto. It lets you compose query fragments with ease, and takes advantage of powerful Postgres features like Upserts. We’ll do a quick intro, and then take a deeper look at these new features.
            """,
            presenter: james_sadler
          }
        ]
      },
      %Meetup{
        title: "Authentication, Recursion and Registries",
        slug: "authentication-recursion-and-registries",
        date: ~D[2017-03-01],
        location: pivotal_office,
        description: """
        This month we'll be talking about a topic that we haven't covered before, but is important for securing your webapps: Authentication with JWT and their usage with Plugs, Joken and Phoenix.
        We'll also be getting with writing Elixir in a recursive style. This may not be what you're used from other languages but it's pretty great in Elixir and Erlang. We'll learn how to write the ridiculously fast Elixir functions that are easy to read.
        Lastly we'll learn about what's new in Elixir 1.4 with a deep dive into the new Process Registry module.
        It's going to be a great meetup, so come along and join us!
        """,
        url: "https://www.meetup.com/en-AU/sydney-ex/events/237380598/",
        talks: [
          %Talk{
            title: "Authentication with JWT",
            slug: "authentication-with-jwt",
            description: """
            Need to secure your Phoenix or Plug application? Not sure how JWT works? Well there are lots of options in Elixir for adding security to your webapp. Sunil will introduce JWT and the various options for add Authentication to your app.
            """,
            slide_url: "https://github.com/sunilgopinath/joken_plug",
            presenter: sunil_gopinath
          },
          %Talk{
            title: "Getting Comfortable With Recursion",
            slug: "getting-comfortable-with-recursion",
            description: """
            You might not be used to writing code in a recursive style if you're coming from a more imperative language. Heard of Tail Recursion or Tail Call Optimisation, but not sure what it really means?
            Josh will demystify writing recursive functions that are blazingly fast and help you avoid some of the traps.
            """,
            slide_url: "https://github.com/sydneyelixir/sydneyelixir.github.io/blob/master/meetups/2017-03/the_elixir_way-josh_price/idiomatic_performant-elixir-josh_price.md",
            video_url: "https://www.youtube.com/watch?v=56Ui7nFg7WA",
            presenter: josh_price
          },
          %Talk{
            title: "Using the New Registry in Elixir 1.4",
            slug: "using-the-new-registry-in-elixir-1-4",
            description: """
            Elixir 1.4 introduces the new Process Registry module to help manage your processes in OTP. If you've attended our OTP introductory series then you'll be ready to join Martin as he shows us how we can use this in our Elixir OTP applications.
            """,
            video_url: "https://www.youtube.com/watch?v=56Ui7nFg7WA",
            presenter: martin_stannard
          }
        ]
      },
      %Meetup{
        title: "Sydney Elixir Meetup",
        slug: "sydney-elixir-meetup",
        date: ~D[2017-02-01],
        location: pivotal_office,
        description: """
        Nick Gunn will reveal the awesome power of Supervisors.
        Robin Hilliard will show us How to release Hex packages and tell us about his first: DefUnit
        We'll also discuss what has been happening in Elixir-land (like Elixir 1.4.1 and friends).
        Beginners are more than welcome, and this a great chance to get started and get help from more experienced Elixir developers.
        """,
        url: "https://www.meetup.com/en-AU/sydney-ex/events/237380598/",
        talks: [
          %Talk{
            title: "Introduction to Supervisors",
            slug: "introduction-to-supervisors",
            description: """
            Want to know more about supervisors? Nick has got the talk for you.
            """,
            slide_url: "http://blog.ausimian.net/supervision-presentation/#/",
            presenter: nick_gunn
          },
          %Talk{
            title: "Adventures in Dialyzer with Defunit",
            slug: "adventures-in-dialyzer-with-defunit",
            description: """
            Ever wondered how to add type safety to Elixir code? Robin will show you how!
            """,
            slide_url: "https://github.com/robinhilliard/defunit_syd_elixir",
            presenter: robin_hilliard
          }
        ]
      },
      %Meetup{
        title: "The OTP Edition",
        slug: "the-otp-edition",
        date: ~D[2016-12-07],
        location: pivotal_office,
        description: """
        We'll be covering OTP from the beginning in the last meetup for the year.
        """,
        url: "https://www.meetup.com/en-AU/sydney-ex/events/235288631/",
        talks: [
          %Talk{
            title: "Intro to Processes and the Actor model",
            slug: "intro-to-processes-and-the-actor-model",
            description: """
            A Quick intro into Processes and the Actor model
            """,
            slide_url: "https://github.com/sydneyelixir/sydneyelixir.github.io/blob/master/meetups/2016-12/intro_to_processes_actor_model-josh_price/intro_to_processes_actor_model.md",
            presenter: josh_price
          },
          %Talk{
            title: "Serving Generally",
            slug: "serving-generally",
            description: """
            A Primer into GenServers
            """,
            slide_url: "https://github.com/sydneyelixir/sydneyelixir.github.io/tree/master/meetups/2016-12/presentations/serving_generally-garrett_heinlen",
            presenter: garret_heinlen
          }
        ]
      },
      %Meetup{
        title: "Back to Basics Part 2",
        slug: "back-to-basics-part-2",
        date: ~D[2016-11-02],
        location: pivotal_office,
        description: """
        We're going to keep going with our beginners focus this month continuing on from last month.
        We'll be looking at some more practical exercises and tackling them as a group and also in pairs.
        """,
        url: "https://www.meetup.com/en-AU/sydney-ex/events/234729669/",
        talks: []
      },
      %Meetup{
        title: "Back to Basics Part 1",
        slug: "back-to-basics-part-1",
        date: ~D[2016-10-05],
        location: pivotal_office,
        description: """
        This month we'll be going back to basics as a way to help those new to Elixir to get up to speed quickly. We'll be doing short talks with Q&A.
        """,
        url: "https://www.meetup.com/en-AU/sydney-ex/events/234518782/",
        talks: [
          %Talk{
            title: "Elixir Syntax Basics",
            slug: "elixir-syntax-basics",
            description: """
            Elixir Syntax Basics
            """,
            presenter: andrew_harvey
          },
          %Talk{
            title: "Pattern Matching",
            slug: "pattern-matching",
            description: """
            Pattern Matching
            """,
            presenter: james_sadler
          },
          %Talk{
            title: "Intro to Plugs",
            slug: "intro-to-plugs",
            description: """
            Intro to Plugs
            """,
            slide_url: "https://github.com/sydneyelixir/sydneyelixir.github.io/tree/master/meetups/2016-10/intro_to_plugs-josh_price",
            presenter: josh_price
          },
          %Talk{
            title: "Intro to Phoenix",
            slug: "intro-to-phoenix",
            description: """
            Intro to Phoenix
            """,
            presenter: geoff_hodgson
          },
          %Talk{
            title: "Mix, ExUnit and Advanced Pattern Matching",
            slug: "mix-exunit-and-advanced-pattern-matching",
            description: """
            Mix, ExUnit and Advanced Pattern Matching
            """,
            presenter: josh_price
          },
          %Meetup{
            title: "August Meetup",
            slug: "august-meetup",
            date: ~D[2016-08-03],
            location: pivotal_office,
            description: """
            Thanks to Pivotal Labs for hosting, we'll be road testing the slightly cosier board room this month.
            """,
            url: "https://www.meetup.com/en-AU/sydney-ex/events/232740340/",
            talks: [
              %Talk{
                title: "Better APIs with GraphQL",
                slug: "better-apis-with-graphql",
                description: """
                Making better APIs with GraphQL
                """,
                slide_url: "https://github.com/sydneyelixir/sydneyelixir.github.io/tree/master/meetups/2016-08/better_apis_with_graphql-josh_price",
                presenter: josh_price
              },
              %Talk{
                title: "Migrating an App from Ruby to Elixir",
                slug: "migrating-an-app-from-ruby-to-elixir",
                description: """
                How to migrate your Ruby App into Elixir
                """,
                presenter: alex_tsirel
              }
            ]
          },
          %Meetup{
            title: "July Meetup",
            slug: "july-meetup",
            date: ~D[2016-07-06],
            location: pivotal_office,
            description: """
            We're back at Pivotal Labs again this month, they're central and food/drinks will be provided.
            """,
            url: "https://www.meetup.com/en-AU/sydney-ex/events/231582443/",
            talks: [
              %Talk{
                title: "A Gentle introduction to the Erlang Ecosystem",
                slug: "a-gentle-introduction-to-the-erlang-ecosystem",
                description: """
                """,
                presenter: alan_milligan
              },
              %Talk{
                title: "Hassle free deployment with EXRM and edeliver",
                slug: "hassle-free-deployment-with-exrm-and-edliver",
                description: """
                """,
                presenter: alex_tsirel
              },
              %Talk{
                title: "Discussion of all the new things",
                slug: "discussion-of-all-the-new-things",
                description: """
                Elixir 1.3, Ecto 2.0 and Phoenix 1.2
                """,
                presenter: andrew_harvey
              }
            ]
          },
          %Meetup{
            title: "June Meetup",
            slug: "june-meetup",
            date: ~D[2016-06-01],
            location: pivotal_office,
            description: """
            New Venue

            We've moved to Pivotal Labs, they're nice and central and pizza will still be provided.
            """,
            url: "https://www.meetup.com/en-AU/sydney-ex/events/230868144/",
            talks: [
              %Talk{
                title: "ElixirConf EU part 1",
                slug: "elixirconf-eu-part-1",
                description: """
                Sharing from ElixirConf EU
                """,
                slide_url: "https://github.com/sydneyelixir/sydneyelixir.github.io/tree/master/meetups/2016-06/elixirconfeu-empex-recap-josh_price_and_james_sadler",
                presenter: josh_price
              },
              %Talk{
                title: "ElixirConf EU part 2",
                slug: "elixirconf-eu-part-2",
                description: """
                Sharing from ElixirConf EU
                """,
                presenter: james_sadler
              },
              %Talk{
                title: "Getting PG2 working on AWS",
                slug: "getting-pg2-working-on-aws",
                description: """
                A lightning talk on getting PG2 (how Phoenix talks between nodes for PubSub) working on AWS
                """,
                slide_url: "https://github.com/sydneyelixir/sydneyelixir.github.io/tree/master/meetups/2016-06/pg2_in_action-andrew_harvey",
                presenter: andrew_harvey
              }
            ]
          }
        ]
      }
    ]

    for raw_meetup <- raw_meetups do
      ElixirSydney.Repo.insert!(raw_meetup)
    end

  end
end

Seeds.insert_meetups
