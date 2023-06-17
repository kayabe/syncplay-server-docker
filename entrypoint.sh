#!/bin/sh

args=""

if [ -n $SALT ]; then
  args="$args --salt=$SALT"
  echo Salt set to $SALT
fi

if [ -n "$PORT" ]; then
  args="$args --port=$PORT"
  echo Port set to $PORT
fi

if [ "$ISOLATE" == "TRUE" ]; then
  args="$args --isolate-rooms"
  echo Rooms Isolated
fi

if [ "$DISABLEREADY" == "TRUE" ]; then
  args="$args --disable-ready"
  echo Readiness Indicator Disabled
fi

if [ "$DISABLECHAT" == "TRUE" ]; then
  args="$args --disable-chat"
  echo Chat Disabled
fi

if [ -n "$MAXCHATLENGTH" ]; then
  args="$args --max-chat-message-length=$MAXCHATLENGTH"
  echo Max Chat Message Length set to $MAXCHATLENGTH
fi

if [ -n "$MAXUNAMELENGTH" ]; then
  args="$args --max-username-length=$MAXUNAMELENGTH"
  echo Max Username Length set to $MAXUNAMELENGTH
fi

if [ "$MOTD" == "TRUE" ]; then
  args="$args --motd-file=/config/motd.txt"
  echo MOTD Enabled
fi

if [ -n "$PASSWORD" ]; then
  args="$args --password=$PASSWORD"
  echo Password set to $PASSWORD
fi

if [ "$TLS" == "TRUE" ]; then
  args="$args --tls=/config/certs"
  echo Certs Enabled
fi

if [ "$ROOMS_DB" == "TRUE" ]; then
# Will not work if using --isolate-rooms.
  args="$args --rooms-db-file=/config/rooms.db"
  echo Room Persistence Enabled
fi

if [ "$PERMANENT_ROOMS" == "TRUE" ]; then
  args="$args --permanent-rooms-file=/config/rooms.txt"
  echo Permanent Rooms Enabled
fi


PYTHONUNBUFFERED=1 exec syncplay-server $args $@
