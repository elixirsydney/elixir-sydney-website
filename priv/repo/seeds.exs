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
  alias ElixirSydney.Repo
  alias ElixirSydney.Events.{Meetup, Talk, Person, Location}

  def insert_meetups do
    pivotal_office = Repo.insert!(%Location{
      name: "Pivotal Labs",
      address: "Level 11, 155 Clarence Street",
      map_url: "https://www.google.com.au/maps/dir//Pivotal,+11%2F155+Clarence+St,+Sydney+NSW+2000/@-33.8679869,151.1698764,13z/data=!3m1!4b1!4m8!4m7!1m0!1m5!1m1!1s0x6b12ae3f3b312871:0x40fe7bd0f94a2249!2m2!1d151.2049818!2d-33.8679919"
    }, conflict_target: :name, on_conflict: :replace_all)

    boodl_offices = Repo.insert!(%Location{
      name: "Boodl",
      address: "10 Boronia St",
      suburb: "Redfern",
      postcode: "2016",
      map_url: "https://www.google.com/maps/place/10+Boronia+St,+Redfern+NSW+2016,+Australia/@-33.8935443,151.2108881,17z/data=!3m1!4b1!4m5!3m4!1s0x6b12b1e11d04f5f9:0xf0d997b2532ed131!8m2!3d-33.8935443!4d151.2130768?hl=en"
    }, conflict_target: :name, on_conflict: :replace_all)

    the_workbench = Repo.insert!(%Location{
      name: "The Workbench",
      address: "645 Harris Street",
      suburb: "Ultimo",
      postcode: "2007",
      map_url: "https://www.google.com/maps/place/645+Harris+St,+Ultimo+NSW+2007,+Australia/@-33.8807136,151.1977567,17z/data=!3m1!4b1!4m5!3m4!1s0x6b12ae25ea406f59:0x76166db07716dbbc!8m2!3d-33.8807136!4d151.1999454?hl=en"
    }, conflict_target: :name, on_conflict: :replace_all)

    tabcorp = Repo.insert!(%Location{
      name: "Tabcorp",
      address: "Level 31, 680 George Street",
      map_url: "https://www.google.com/maps/place/31%2F680+George+St,+Sydney+NSW+2000,+Australia/@-33.8773271,151.2039305,17z/data=!3m1!4b1!4m5!3m4!1s0x6b12ae3cc6719adf:0x592d81d4f9316f02!8m2!3d-33.8773271!4d151.2061192?hl=en"
    }, conflict_target: :name, on_conflict: :replace_all)

    camp_wombaroo = Repo.insert!(%Location{
      name: "Camp Wombaroo",
      address: "162 Black Spring Rd",
      suburb: "High Range",
      postcode: "2575",
      map_url: "https://www.google.com.au/maps/place/162+Black+Spring+Rd,+High+Range+NSW+2575/@-34.3844071,150.3211074,17z/data=!3m1!4b1!4m5!3m4!1s0x6b13bbf3af35d4ad:0x1f01929efe5f4dfc!8m2!3d-34.3844071!4d150.3232961"
    }, conflict_target: :name, on_conflict: :replace_all)

    andrew_harvey = Repo.insert!(
      %Person{
        name: "Andrew Harvey",
        avatar_url: "https://a248.e.akamai.net/secure.meetupstatic.com/photos/member/5/a/3/e/member_224183102.jpeg",
        meetup_url: "https://www.meetup.com/en-AU/sydney-ex/members/11138446/",
        website_url: "",
        twitter: "@mootpointer"
      }, conflict_target: :name, on_conflict: :replace_all
    )

    josh_price = Repo.insert!(
      %Person{
        name: "Josh Price",
        avatar_url: "https://a248.e.akamai.net/secure.meetupstatic.com/photos/member/4/5/c/e/member_12197870.jpeg",
        meetup_url: "https://www.meetup.com/en-AU/sydney-ex/members/8425371/",
        website_url: "",
        twitter: "@joshprice"
      }, conflict_target: :name, on_conflict: :replace_all
    )

    sunil_gopinath = Repo.insert!(
      %Person{
        name: "Sunil Gopinath",
        avatar_url: "https://a248.e.akamai.net/secure.meetupstatic.com/photos/member/c/2/d/a/member_115669882.jpeg",
        meetup_url: "https://www.meetup.com/en-AU/sydney-ex/members/43452202/",
        website_url: "",
        twitter: ""
      }, conflict_target: :name, on_conflict: :replace_all
    )

    martin_stannard = Repo.insert!(
      %Person{
        name: "Martin Stannard",
        avatar_url: "https://a248.e.akamai.net/secure.meetupstatic.com/photos/member/1/7/c/c/member_251766092.jpeg",
        meetup_url: "https://www.meetup.com/en-AU/sydney-ex/members/83178992/",
        website_url: "",
        twitter: ""
      }, conflict_target: :name, on_conflict: :replace_all
    )

    nick_gunn = Repo.insert!(
      %Person{
        name: "Nick Gunn",
        avatar_url: "https://a248.e.akamai.net/secure.meetupstatic.com/s/img/2982428616572973604/noPhoto_80.gif",
        meetup_url: "https://www.meetup.com/en-AU/sydney-ex/members/205821026/",
        website_url: "",
        twitter: ""
      }, conflict_target: :name, on_conflict: :replace_all
    )

    robin_hilliard = Repo.insert!(
      %Person{
        name: "Robin Hilliard",
        avatar_url: "https://a248.e.akamai.net/secure.meetupstatic.com/photos/member/a/5/2/f/member_3822287.jpeg",
        meetup_url: "https://www.meetup.com/en-AU/sydney-ex/members/7114884/",
        website_url: "",
        twitter: ""
      }, conflict_target: :name, on_conflict: :replace_all
    )

    james_sadler = Repo.insert!(
      %Person{
        name: "James Sadler",
        avatar_url: "https://a248.e.akamai.net/secure.meetupstatic.com/photos/member/2/8/f/b/member_258850491.jpeg",
        meetup_url: "https://www.meetup.com/en-AU/sydney-ex/members/202221787/",
        website_url: "",
        twitter: "@freshtonic"
      }, conflict_target: :name, on_conflict: :replace_all
    )

    geoff_hodgson = Repo.insert!(
      %Person{
        name: "Geoff Hodgson",
        avatar_url: "https://a248.e.akamai.net/secure.meetupstatic.com/photos/member/d/e/2/8/member_138056872.jpeg",
        meetup_url: "https://www.meetup.com/en-AU/sydney-ex/members/105623792/",
        website_url: "",
        twitter: "@geoffroh"
      }, conflict_target: :name, on_conflict: :replace_all
    )

    alex_tsirel = Repo.insert!(
      %Person{
        name: "Alex Tsirel",
        avatar_url: "https://secure.meetupstatic.com/photos/member/1/b/c/8/member_126127112.jpeg",
        meetup_url: "https://www.meetup.com/en-AU/sydney-ex/members/98555692/",
        website_url: "",
        twitter: ""
      }, conflict_target: :name, on_conflict: :replace_all
    )

    alan_milligan = Repo.insert!(
      %Person{
        name: "Alan Milligan",
        avatar_url: "https://secure.meetupstatic.com/photos/member/a/1/b/0/highres_209981392.jpeg",
        meetup_url: "https://www.meetup.com/en-AU/sydney-ex/members/13064111/",
        website_url: "",
        twitter: "@bastionlinux"
      }, conflict_target: :name, on_conflict: :replace_all
    )

    garrett_heinlen = Repo.insert!(
      %Person{
        name: "Garrett Heinlen",
        avatar_url: "https://secure.meetupstatic.com/photos/member/b/7/a/4/member_184907012.jpeg",
        meetup_url: "https://www.meetup.com/en-AU/sydney-ex/members/98723842/",
        website_url: "",
        twitter: "@gogogarrett"
      }, conflict_target: :name, on_conflict: :replace_all
    )

    kevin_yank = Repo.insert!(
      %Person{
        name: "Kevin Yank",
        avatar_url: "https://secure.meetupstatic.com/photos/member/c/7/0/d/highres_260810957.jpeg",
        meetup_url: "https://www.meetup.com/en-AU/Elm-Melbourne/members/121828272/",
        website_url: "",
        twitter: "@sentience"
      }, conflict_target: :name, on_conflict: :replace_all
    )

    rob_howard = Repo.insert!(
      %Person{
        name: "Rob Howard",
        avatar_url: "https://secure.meetupstatic.com/photos/member/7/5/b/d/highres_255690141.jpeg",
        meetup_url: "https://www.meetup.com/en-AU/sydney-ex/members/12492360/",
        website_url: "",
        twitter: "@damncabbage"
      }, conflict_target: :name, on_conflict: :replace_all
    )

    jo_cranford = Repo.insert!(
      %Person{
        name: "Jo Cranford",
        avatar_url: "https://secure.meetupstatic.com/photos/member/2/e/c/8/highres_243551976.jpeg",
        meetup_url: "https://www.meetup.com/en-AU/Elixir-Melbourne/members/9079730/",
        website_url: "",
        twitter: "@jocranford"
      }, conflict_target: :name, on_conflict: :replace_all
    )

    alan_harper = Repo.insert!(
      %Person{
        name: "Alan Harper",
        avatar_url: "https://secure.meetupstatic.com/photos/member/4/d/7/8/highres_167239832.jpeg",
        meetup_url: "https://www.meetup.com/en-AU/Elixir-Melbourne/members/349/",
        website_url: "",
        twitter: "@aussiegeek"
      }, conflict_target: :name, on_conflict: :replace_all
    )

    brenton_annan = Repo.insert!(
      %Person{
        name: "Brenton Annan",
        avatar_url: "https://secure.meetupstatic.com/photos/member/2/3/3/4/highres_129969012.jpeg",
        meetup_url: "https://www.meetup.com/en-AU/sydney-ex/members/100865042/",
        website_url: "",
        twitter: ""
      }, conflict_target: :name, on_conflict: :replace_all
    )

    dylan_griffith = Repo.insert!(
      %Person{
        name: "Dylan Griffith",
        avatar_url: "https://secure.meetupstatic.com/photos/member/2/a/9/2/highres_253750898.jpeg",
        meetup_url: "https://www.meetup.com/en-AU/sydney-ex/members/199501518/",
        website_url: "dylangriffith.net",
        twitter: "@DylanJGriffith"
      }, conflict_target: :name, on_conflict: :replace_all
    )

    mick_heywood = Repo.insert!(
      %Person{
        name: "Mick Heywood",
        avatar_url: "https://secure.meetupstatic.com/photos/member/c/b/8/b/highres_248512107.jpeg",
        meetup_url: "https://www.meetup.com/en-AU/sydney-ex/members/181553272/",
        website_url: "",
        twitter: ""
      }, conflict_target: :name, on_conflict: :replace_all
    )

    igor_kapkov = Repo.insert!(
      %Person{
        name: "Igor Kapkov",
        avatar_url: "https://secure.meetupstatic.com/photos/member/b/9/6/6/highres_195167462.jpeg",
        meetup_url: "https://www.meetup.com/en-AU/sydney-ex/members/144945092/",
        website_url: "",
        twitter: "@igasgeek"
      }, conflict_target: :name, on_conflict: :replace_all
    )

    toby_hede = Repo.insert!(
      %Person{
        name: "Toby Hede",
        avatar_url: "https://media.licdn.com/mpr/mpr/shrinknp_400_400/AAEAAQAAAAAAAAvUAAAAJDQzMWM5ZGMzLTAzN2ItNGRiMi1iMDJmLWI4MWM4MzVkNTUzOA.jpg",
        meetup_url: "https://www.meetup.com/en-AU/sydney-ex/members/144945092/",
        website_url: "",
        twitter: "@tobyhede"
      }, conflict_target: :name, on_conflict: :replace_all
    )

    dave_parry = Repo.insert!(
      %Person{
        name: "Dave Parry",
        avatar_url: "https://secure.meetupstatic.com/photos/member/d/3/4/c/member_81234092.jpeg",
        meetup_url: "https://www.meetup.com/sydney-ex/members/12433325/",
        website_url: "http://suranyami.com/",
        twitter: "@suranyami"
      }, conflict_target: :name, on_conflict: :replace_all
    )

    jon_rowe = Repo.insert!(
      %Person{
        name: "Jon Rowe",
        avatar_url: "https://pbs.twimg.com/profile_images/752380573746753536/1H9fH_ng_400x400.jpg",
        meetup_url: "https://www.meetup.com/en-AU/sydney-ex/members/202515018/",
        website_url: "http://jonrowe.co.uk",
        twitter: "@jonrowe"
      }, conflict_target: :name, on_conflict: :replace_all
    )

    qing_wu = Repo.insert!(
      %Person{
        name: "Qing Wu",
        avatar_url: "https://media.licdn.com/mpr/mpr/shrinknp_200_200/p/6/005/00b/2e0/21b8453.jpg",
        meetup_url: "https://www.meetup.com/en-AU/sydney-ex/members/140014642/",
        website_url: "http://www.wiserfirst.com",
        twitter: "@wiserfirst"
      }, conflict_target: :name, on_conflict: :replace_all
    )

    richard_heycock = Repo.insert!(
      %Person{
        name: "Richard Heycock",
        avatar_url: "https://pbs.twimg.com/profile_images/52705913/fish_400x400.png",
        meetup_url: "",
        website_url: "",
        twitter: "@filterfish"
      }, conflict_target: :name, on_conflict: :replace_all
    )

    cath_jones = Repo.insert!(
      %Person{
        name: "Cath Jones",
        avatar_url: "https://secure.meetupstatic.com/photos/member/7/d/4/0/highres_254012064.jpeg",
        meetup_url: "https://www.meetup.com/sydney-ex/members/80708842/",
        website_url: "http://bitgirl101.com/",
        twitter: "@cathjones0"
      }, conflict_target: :name, on_conflict: :replace_all
    )

    paul_fioravanti = Repo.insert!(
      %Person{
        name: "Paul Fioravanti",
        avatar_url: "https://secure.meetupstatic.com/photos/member/7/1/6/8/highres_67829032.jpeg",
        meetup_url: "https://www.meetup.com/sydney-ex/members/58665142/",
        website_url: "http://paulfioravanti.com",
        twitter: "@paulfioravanti"
      }, conflict_target: :name, on_conflict: :replace_all
    )

    meetups = [
      %Meetup{
        title: "💃🏻 Elixir Girls Celebration",
        slug: "elixir-girls-celebration",
        date: ~D[2017-08-02],
        location: pivotal_office,
        description: """
          This month we are celebrating Elixir Girls which happened over the weekend and it was an amazing event!
          We'll be celebrating this with a recap of the event, and some talks aimed at those new to Elixir and Phoenix and programming as well as consolidating knowledge from the event.

          Cath will recap everything that happened at the first Elixir Girls event and might even tell us what she has in store for the next one.

          Garrett will talk us through how to design maintainable Phoenix web applications with service contracts.

          Paul will reprise his talk about the Queen of functions `Enum.reduce`, in case you missed it the first time or didn't catch all the subtle details.

          These talks will help you expand your knowledge of core Elixir and how to build more maintainable Phoenix apps.

          See you there!

          Josh, Andrew and James
        """,
        url: "https://www.meetup.com/en-AU/sydney-ex/events/239476421/",
        talks: [
          %Talk{
            title: "Elixir Girls Recap",
            slug: "elixir-girls-recap",
            description: """
              Cath will tell us all the great stuff that happened at the first event,
              what you can do to help mentor, and possibly hint at plans for the next one.
            """,
            presenter: cath_jones
          },
          %Talk{
            title: "Service Contracts in Phoenix",
            slug: "phoenix-service-contracts",
            description: """
              Phoenix 1.3 emphasises "Contexts" as a way of decoupling your application from your web interface.

              The next level of decoupling is using umbrella applications to enfore the service boundaries even further,
              while still maintaining an easy to work with system.

              Garrett will compare approaches and tell us why we need to separate the application from the web UI.
            """,
            slide_url: nil,
            presenter: garrett_heinlen
          },
          %Talk{
            title: "Enum.reduce",
            slug: "enum-reduce",
            description: """
              Paul will talk about the powerful and fundamental function in Enum, `reduce`.

              Definitely something you'll want in your functional programming toolkit.
            """,
            slide_url: nil,
            presenter: jon_rowe
          },
        ]
      },
      %Meetup{
        title: "API Gateways 🚪💂, Requirements Makeovers 💅 and Fire Chickens 🔥🐔",
        slug: "",
        date: ~D[2017-07-05],
        location: pivotal_office,
        description: """
          This month we are widening our horizons beyond Elixir. We have two excellent but not Elixir-specific talks in addition to an Elixir talk.

          Richard will be giving a talk about API Gateways (with bonus wit and charisma) and why you should consider using one.

          Robin will take us on a journey to the promised land of beautifully distilled and clear requirements using "thinly disguised real world examples".

          Lastly, Jon will guide us through the steps to upgrade a Phoenix app from 1.2 to 1.3 while paying homage to the official emoji representation of our favorite web framework.

          Expect all talks to be peppered with entertaining anecdotes and delightful little segues that we can discuss over some tasty hot chips later in the evening.
        """,
        url: "https://www.meetup.com/en-AU/sydney-ex/events/239476421/",
        talks: [
          %Talk{
            title: "An Introduction to API Gateways",
            slug: "an-introduction-to-api-gateways",
            description: """
             API Gateways are a way of managing multiple resources and can be used to provide concerns such as authentication, request throttling, bot detection and all manner of things. This edifying and entertaining talk, given my one of the most inspiring and charismatic speakers of modern times, gives a brief introduction to this fascinating subject: what an API gateway really is, how you might use one, when you probably should use one and when you probably shouldn't. It'll be a roller coaster of a ride.
            """,
            presenter: richard_heycock
          },
          %Talk{
            title: "Requirements Makeover",
            slug: "requirements-makeover",
            description: """
              Robin will walk you through the process of converting a shopping list of random motherhood statements, acronyms and hopefully vague statements into useable requirements. Using thinly disguised real world examples, Robin will show you how to recognise common types of problem and describe the things developers will need to know to solve them.
            """,
            slide_url: nil,
            presenter: robin_hilliard
          },,
          %Talk{
            title: "🔥🐔 1.2 ~> 🔥🐔 1.3",
            slug: "phoenix-upgrade",
            description: """
              Jon will take you through the steps for upgrading a Phoenix app and let us know what to watch out for!
            """,
            slide_url: nil,
            presenter: jon_rowe
          },
        ]
      },
      %Meetup{
        title: "⛱ Umbrella Apps and 💧 Elixir Macros",
        slug: "umbrella-apps-and-elixir-macros",
        date: ~D[2017-06-07],
        location: pivotal_office,
        description: """
        This month we'll be seeing how you can achieve microservices bliss without all the pain and examine the power and mystery of Elixir macros.

        Jon will take us through the basics of Umbrella Apps and explore some interesting use cases for umbrella apps for building a microservice architecture with Phoenix.

        Qing Wu will lead you gently into the land of Elixir macros, you'll be an expert before you know it!

        Beginners are more than welcome, and this a great chance to get started and get help from more experienced Elixir developers.

        We've got not one, but TWO brand new speakers this month which is fantastic! If you'd like to present something or see something presented next month just let us know.
        """,
        url: "https://www.meetup.com/en-AU/sydney-ex/events/239476421/",
        talks: [
          %Talk{
            title: "Umbrella Apps and Phoenix Microservices",
            slug: "umbrella-apps-and-phoenix-microservices",
            description: """
            Jon will take us through the basics of Umbrella Apps and explore some interesting use cases for umbrella apps for building a microservice architecture with Phoenix.
            """,
            presenter: jon_rowe
          },
          %Talk{
            title: "A Gentle Introduction to Elixir Macros",
            slug: "a-gentle-introduction-to-elixir-macros",
            description: """
            Qing Wu will lead you gently into the land of Elixir macros, you'll be an expert before you know it!

            Elixir Macros are super powerful but confusing, this talk will give you a much better handle on them.
            """,
            slide_url: nil,
            presenter: qing_wu
          },
        ]
      },
      %Meetup{
        title: "☁️ Cloud Deployment and 🚨 Nerves",
        slug: "cloud-deployment-and-nerves",
        date: ~D[2017-05-03],
        location: pivotal_office,
        description: """
        This month we'll be recapping the awesomeness that was Elixir Camp.

        Dave Parry will walk us through a fully buzzword compliant cloud deployment stack including Kubernetes, Terraform, AWS and Buildkite.

        Andrew will keep trucking and dive deeper into running Elixir on embedded hardware.
        """,
        url: "https://www.meetup.com/en-AU/sydney-ex/events/238021480/",
        talks: [
          %Talk{
            title: "Functional Firmware with Nerves (Part 2)",
            slug: "functional-firmware-with-nerves-part-2",
            description: """
            In this talk we will keep exploring Nerves, the Elixir framework for building and deploying embedded software. Nerves is the easiest way to deploy Elixir to the Raspberry Pi or the Beaglebone.
            """,
            presenter: andrew_harvey
          },
          %Talk{
            title: "Cloud Deployment with Kubernetes, Terraform and Buildkite",
            slug: "cloud-deployment-with-kubernetes-terraform-and-buildkite",
            description: """
            Dave will give a quick tour of his "Fully Buzzword Compliant" cloud deployment setup on AWS for deploying Elixir applications.
            """,
            slide_url: nil,
            presenter: dave_parry
          },
          %Talk{
            title: "Elixir Camp Recap",
            slug: "elixir-camp-recap",
            description: """
            Elixir was a really fantastic weekend. We had great talks, we had fires while we munched on delicious food (including 10hr smoked pulled pork).

            Josh will give you a quick rundown of some of the highlights.
            """,
            presenter: josh_price
          }
        ]
      },
      %Meetup{
        title: "⛺️ Elixir Camp",
        slug: "elixir-camp",
        date: ~D[2017-04-22],
        location: camp_wombaroo,
        description: """
        Elixir Camp is a place for people interested in Elixir, Erlang and related technologies to gather, network, share ideas and generally have a great time. While there's a general focus on Elixir developers, techy people of any background are encouraged to attend.
        """,
        url: "https://elixir.camp/",
        talks: [
          %Talk{
            title: "Intro to GraphQL with Elixir",
            slug: "intro-to-graphql-with-elixir",
            description: """
            GraphQL is a relevant up and coming API technology that offers API consumers much more flexibility than REST. It's a well-defined standard (as opposed to REST, which is convention driven) and supports streaming and subscriptions. Elixir is an ideal platform on which to build GraphQL APIs.
            """,
            presenter: james_sadler
          },
          %Talk{
            title: "Intro to Phoenix 1.3 and Plug",
            slug: "intro-to-phoenix-1-3-and-plug",
            description: """
            A talk to demystify the macro magic in Phoenix to demonstrate it's simplicity.
            """,
            presenter: josh_price
          },
          %Talk{
            title: "Introduction to Elm",
            slug: "introduction-to-elm",
            description: """
            Just like Elixir challenges some of Ruby’s design decisions on the backend, Elm challenges aspects of the JavaScript language on the frontend to create a delightful developer experience. In this session, you’ll get a grand tour of the sources of developer happiness in Elm, and hopefully be convinced to give this exciting new language a closer look.
            """,
            presenter: kevin_yank
          },
          %Talk{
            title: "Beyond Simple Types in Elm",
            slug: "beyond-simple-types-in-elm",
            description: """
            Elm gives us the ability to use types to talk about the shape of our data. It's really tempting to just use simple things like String, Number, etc, but there's a bunch of ways we can tell Elm more about what we intend, and use types as a tool instead of just a constraint.
            """,
            presenter: rob_howard
          },
          %Talk{
            title: "Production Maintenance",
            slug: "production-maintenance",
            description: """
            Right after you head to production lots of issues will appear. This talk will cover common issues with building/publishing releases, showing difference between production environment and production release, monitoring and zero-downtime deploy with upgrade or phased reboot.
            """,
            presenter: alex_tsirel
          },
          %Talk{
            title: "Drinking the Elixir a story about breaking up a Rails Monolith",
            slug: "drinking-the-elixir-a-story-about-breaking-up-a-rails-monolith",
            description: """
            A tale about a journey from a Rails Monolith into Elixir Microservices. Why we chose Elixir, and what we've learned along the way.
            """,
            presenter: jo_cranford
          },
          %Talk{
            title: "Whats the point of a process registry",
            slug: "whats-the-point-of-a-process-registry",
            description: """
            Thoughts on how to handle many many genservers doing tiny jobs.
            """,
            presenter: alan_harper
          },
          %Talk{
            title: "GenServer 101",
            slug: "genserver-101",
            description: """
            A quick rundown on GenServers and their implementation
            """,
            presenter: martin_stannard
          }
        ]
      },
      %Meetup{
        title: "🔥 Phoenix, Ecto and Nerves",
        slug: "phoenix-ecto-and-nerves",
        date: ~D[2017-04-05],
        location: pivotal_office,
        description: """
        With the new updates to <strong>Phoenix 1.3</strong> and <strong>Ecto 2.1</strong>, we will take another look at the things we can do with Phoenix and Ecto.

        We will also show you some fun things you can do with <strong>Nerves</strong>, which lets you build embedded software for Raspberry Pis in Elixir.
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
            slide_url: "https://github.com/sydneyelixir/sydneyelixir.github.io/blob/master/meetups/2017-04/whats_new_in_phoenix_1.3-josh_price/whats_new_in_phoenix_1.3-josh_price.md",
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
            slide_url: "http://sydneyelixir.github.io/meetups/2016-12/presentations/serving_generally-garrett_heinlen/servering_generally.pdf",
            presenter: garrett_heinlen
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
            slide_url: "http://sydneyelixir.github.io/meetups/2016-10/intro_to_plugs-josh_price/elixir_plugs.pdf",
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
        ]
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
            slide_url: "https://github.com/sydneyelixir/sydneyelixir.github.io/blob/master/meetups/2016-08/better_apis_with_graphql-josh_price/better_apis_with_graphql-josh_price-dddmelbourne.md",
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
            slide_url: "http://sydneyelixir.github.io/meetups/2016-06/elixirconfeu-empex-recap-josh_price_and_james_sadler/elixirconfeu_empex_recap-josh_price_and_james_sadler.pdf",
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
            slide_url: "http://sydneyelixir.github.io/meetups/2016-06/pg2_in_action-andrew_harvey/pg2_aws.pdf",
            presenter: andrew_harvey
          }
        ]
      },
      %Meetup{
        title: "May Meetup",
        slug: "may-meetup",
        date: ~D[2016-05-04],
        location: boodl_offices,
        description: """
        We'll be at Booodl again this month.
        There's space for short demos of something you're working on or a lightning talk if you'd like to present something.
        """,
        url: "https://www.meetup.com/en-AU/sydney-ex/events/230804264/",
        talks: [
          %Talk{
            title: "The Future of Elixir",
            slug: "the-future-of-elixir",
            description: """
            Discussion of new features in 1.3
            """,
            presenter: josh_price
          },
          %Talk{
            title: "Generative Grammars with VoxPop",
            slug: "generative-grammars-with-voxpop",
            description: """
            Generative Grammars with VoxPop
            """,
            slide_url: "http://sydneyelixir.github.io/meetups/2016-05/generative_grammars-andrew_harvey/voxpop.pdf",
            presenter: andrew_harvey
          },
          %Talk{
            title: "Cloud Deployment and Buildpack Internals",
            slug: "cloud-deployment-and-buildpack-internals",
            description: """
            Cloud Deployment and Buildpack Internals
            """,
            slide_url: "http://sydneyelixir.github.io/meetups/2016-05/cloud_deployment-josh_price/cloud_deployment-josh_price.pdf",
            presenter: josh_price
          }
        ]
      },
      %Meetup{
        title: "April Meetup",
        slug: "april-meetup",
        date: ~D[2016-04-06],
        location: boodl_offices,
        description: """
        We'll be at Booodl again this month.
        We've got some very exciting talks lined up this month.
        """,
        url: "https://www.meetup.com/en-AU/sydney-ex/events/230030565/",
        talks: [
          %Talk{
            title: "Event Sourcing and GenEvent",
            slug: "event-sourcing-and-genevent",
            description: """
            Event Sourcing and GenEvent
            """,
            slide_url: "http://sydneyelixir.github.io/meetups/2016-03/event_sourcing_genevent-brenton_annan/event_sourcing_gen_event_talk.html#1",
            presenter: brenton_annan
          },
          %Talk{
            title: "Phoenix and Elm",
            slug: "phoenix-and-elm",
            description: """
            Phoenix and Elm
            """,
            presenter: martin_stannard
          },
          %Talk{
            title: "RabbitMQ",
            slug: "rabbitmq",
            description: """
            RabbitMQ
            """,
            presenter: dylan_griffith
          }
        ]
      },
      %Meetup{
        title: "March Meetup",
        slug: "march-meetup",
        date: ~D[2016-03-02],
        location: boodl_offices,
        description: """
        We'll be at Booodl again this month, beer and pizza provided (thanks to Booodl).
        There is space for another short talk if you have something to present. Let Andrew or myself know.
        """,
        url: "https://www.meetup.com/en-AU/sydney-ex/events/229081433/",
        talks: [
          %Talk{
            title: "Elixir and ejabberd",
            slug: "elixir-and-ejabberd",
            description: """
            Elixir and ejabberd
            """,
            presenter: mick_heywood
          },
          %Talk{
            title: "Code reading or hacking",
            slug: "code-reading-or-hacking",
            description: """
            Code reading or Hacking
            """,
            presenter: andrew_harvey
          }
        ]
      },
      %Meetup{
        title: "February Meetup",
        slug: "february-meetup",
        date: ~D[2016-02-03],
        location: boodl_offices,
        description: """
        We'll be at Booodl this month, so please double check the directions.
        There will be beer and pizza provided thanks to Booodl!
        """,
        url: "https://www.meetup.com/en-AU/sydney-ex/events/228421606/",
        talks: [
          %Talk{
            title: "Intro to GraphQL",
            slug: "intro-to-graphql",
            description: """
            Intro to GraphQL
            """,
            slide_url: "http://sydneyelixir.github.io/meetups/2016-02/intro_to_graphql-josh_price/intro_to_graphql-josh_price.pdf",
            presenter: josh_price
          },
          %Talk{
            title: "OTP in Action gen_fsm",
            slug: "otp-in-action-gen_fsm",
            description: """
            OTP in Action gen_fsm
            """,
            slide_url: "http://sydneyelixir.github.io/meetups/2016-02/intro_to_genfsm-garrett_heinlen/presentation.pdf",
            presenter: garrett_heinlen
          },
          %Talk{
            title: "OTP in Action gen_server",
            slug: "otp-in-action-gen_server",
            description: """
            OTP in Action gen_server
            """,
            slide_url: "http://sydneyelixir.github.io/meetups/2016-02/intro_to_genserver-martin_stannard/genserver.pdf",
            presenter: martin_stannard
          }
        ]
      },
      %Meetup{
        title: "First Meetup of 2016",
        slug: "first-meetup-of-2016",
        date: ~D[2016-01-13],
        location: the_workbench,
        description: """
        Happy New Year everyone!
        We've got some great talks lined up.
        """,
        url: "https://www.meetup.com/en-AU/sydney-ex/events/227813634/",
        talks: [
          %Talk{
            title: "Intro to Elm",
            slug: "intro-to-elm",
            description: """
            Intro to Elm
            """,
            slide_url: "http://igas.me/talks/2016/elm/",
            presenter: igor_kapkov
          },
          %Talk{
            title: "Intro to Ecto",
            slug: "intro-to-ecto",
            description: """
            Intro to Ecto
            """,
            slide_url: "http://sydneyelixir.github.io/meetups/2016-01/intro_to_ecto-garrett_heinlen/presentation.pdf",
            presenter: garrett_heinlen
          },
          %Talk{
            title: "Building Elixir web apps without Phoenix",
            slug: "building-elixir-web-apps-without-phoenix",
            description: """
            Building Elixir web apps without Phoenix
            """,
            slide_url: "https://codewords.recurse.com/issues/five/building-a-web-framework-from-scratch-in-elixir",
            presenter: dylan_griffith
          }
        ]
      },
      %Meetup{
        title: "Last SydEx meetup for the year",
        slug: "last-sydex-meetup-for-the-year",
        date: ~D[2015-12-02],
        location: the_workbench,
        description: """
        Last Sydney Elixir for the year.
        Plugs are amazing and it's how you build Web applications in Phoenix.
        """,
        url: "https://www.meetup.com/en-AU/sydney-ex/events/227042141/",
        talks: [
          %Talk{
            title: "Elixir Deployment",
            slug: "elixir-deployment",
            description: """
            Toby will give a talk about something cool
            """,
            presenter: toby_hede
          },
          %Talk{
            title: "Plugs are amazing",
            slug: "plugs-are-amazing",
            description: """
            Josh will demo a plug and walk you through some of the concepts so you can build your own.
            """,
            slide_url: "http://sydneyelixir.github.io/meetups/2015-12/presentations/intro_to_plugs-josh_price/elixir_plugs.pdf",
            presenter: josh_price
          }
        ]
      },
      %Meetup{
        title: "November Meetup",
        slug: "november-meetup",
        date: ~D[2015-11-04],
        location: the_workbench,
        description: """
        Sorry about the late notice, this month snuck right up on us!

        Plan is to keep going with the Elixir Etudes which seemed to work really well last time. We'll do some more advanced exercises in a Randori style (working in pairs on the projector). We might do some quick demos of what people have been working on too.
        """,
        url: "https://www.meetup.com/en-AU/sydney-ex/events/226497620/",
        talks: []
      },
      %Meetup{
        title: "October Meetup",
        slug: "october-meetup",
        date: ~D[2015-10-07],
        location: tabcorp,
        description: """
        Come along, we'll have beer and food and hack on and talk about Elixir.
        Doesn't matter what experience level you are, we're mostly quite new to this so join us even if you're just curious.
        """,
        url: "https://www.meetup.com/en-AU/sydney-ex/events/225720675/",
        talks: []
      }
    ]

    for meetup <- meetups do
      Repo.insert!(meetup, conflict_target: :slug, on_conflict: :replace_all)
    end
  end
end

Seeds.insert_meetups
