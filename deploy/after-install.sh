#!/bin/bash
set -e

# Find out from CodeDeploy what environment we are in by parsing the APPLICATION_NAME
ENVIRONMENT=`echo "$APPLICATION_NAME" | cut -d '-' -f 1`
# Put the environment in the log
echo "Customizing environment: $ENVIRONMENT"

# Setup variables depending on what environment
case $ENVIRONMENT in
    blue)
        S3=monica-blue
        export MIX_ENV=blue
    ;;
    red)
        S3=monica-red
        export MIX_ENV=red
    ;;
    production)
        S3=monica-production
        export MIX_ENV=prod
    ;;
    *)
        echo "Error: undefined environment: $ENVIRONMENT"
        exit 1
    ;;
esac

SOURCE_DIR=/opt/elixir-sydney/codedeploy/deploy

# Move into the app directory
cd /opt/elixir-sydney/codedeploy

# Pull in secrets from S3 Bucket
aws --region=us-east-1 s3 cp s3://$S3/$ENVIRONMENT.secret.exs /opt/elixir-sydney/codedeploy/config/$MIX_ENV.secret.exs

# Copy over the upstart script and set MIX_ENV correctly
sed "s/MIX_ENV_VALUE/$MIX_ENV/"  /opt/elixir-sydney/codedeploy/deploy/monica-app-upstart.conf >/etc/init/monica-app.conf

export HOME=/root
mix local.hex --force
yes | head -n 1000 | mix deps.get
yes | head -n 1000 | mix deps.compile
yes | head -n 1000 | mix compile
yes | head -n 1000 | mix ecto.migrate
yes | head -n 1000 | mix phoenix_codedeploy.insert_seeds
mix phoenix.digest -o _build/prod/lib/phoenix_codedeploy/priv/static/ web/static
