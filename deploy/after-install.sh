#!/bin/bash
set -e

export MIX_ENV=prod

SOURCE_DIR=/opt/elixir-sydney/codedeploy/deploy

# Move into the app directory
cd /opt/elixir-sydney/codedeploy

# Pull in secrets from S3 Bucket
aws --region=ap-southeast-2 s3 cp s3://sydney-elixir-config/prod.secret.exs /opt/elixir-sydney/codedeploy/config/prod.secret.exs

cp /opt/elixir-sydney/codedeploy/deploy/elixir-sydney-app-upstart.conf /etc/init/elixir-sydney-app.conf

export HOME=/root
mix local.hex --force
yes | head -n 1000 | mix deps.get
yes | head -n 1000 | mix deps.compile
yes | head -n 1000 | mix compile
yes | head -n 1000 | mix ecto.migrate
yes | head -n 1000 | mix phoenix_codedeploy.insert_seeds
mix phoenix.digest -o _build/prod/lib/phoenix_codedeploy/priv/static/ web/static
