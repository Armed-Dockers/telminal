#!/bin/bash

# Replace placeholders in the config.example.json with actual environment variables
envsubst < /telminal/config.example.json > /usr/local/lib/python3.9/site-packages/telminal/config.json

# Start your application with the updated configuration
telminal