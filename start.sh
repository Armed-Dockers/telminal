#!/bin/bash

# Replace placeholders in the config.json with actual environment variables
envsubst < /telminal/config.example.json > /telminal/config.json

# Start your application with the updated configuration
telminal