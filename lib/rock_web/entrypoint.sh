#!/bin/sh

while ! pg_isready -q -h $ROCK_HOST -p $ROCK_PORT -U $ROCK_USER
do
  echo "$(date) - waiting for database to start"
  sleep 2
done

mix ecto.create
mix ecto.migrate

exec mix phx.server
