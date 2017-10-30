# Elixir Sydney Website

## Getting Started

  * Clone the repo
  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Install Node.js dependencies with `npm install`
  * Start Phoenix endpoint with `mix phoenix.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

## meetup.com Integration

When creating a new meetup we make a call to Meetup.com to find out the next meetup URL.

Edit `.envrc.example` with your meetup.com [API Key](https://secure.meetup.com/meetup_api/key/).

Then rename to `.envrc` and load them with:

    source .envrc

Or, you can use [direnv](https://direnv.net/), to setup local dev environment variables `brew install direnv`.


## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix
