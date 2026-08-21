#!/bin/bash
# This script stops the Marp CLI watch mode container if it is running.
docker kill marp-watch &> /dev/null
