#!/bin/bash

# Use environment variables with defaults if not provided
USER_ID=${PUID:-1001}
GROUP_ID=${PGID:-1001}

echo "USER_ID [$PUID]"
echo "GROUP_ID [$PGID]"

# Change actual user UID
echo "Executing: usermod -u $PUID actual"
usermod -u $PUID actual

# Change actual group GID
echo "Executing: groupmod -g $PGID actual"
groupmod -g $PGID actual

# Set app directory ownership
echo "Executing: chown -R actual:actual /app"
chown -R actual:actual /app

# Create data directory if it does not exist
echo "Executing: mkdir -p /data"
mkdir -p /data

# Set data directory ownership
echo "Executing: chown -R actual:actual /data"
chown -R actual:actual /data

# Switch to the new user and execute the service
echo "STARTING /usr/bin/pid1 -u actual -g actual \"$@\""
/usr/bin/pid1 -u actual -g actual "$@"
