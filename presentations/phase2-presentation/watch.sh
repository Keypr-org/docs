#!/bin/bash
# This script runs the Marp CLI in watch mode to automatically update the presentation when changes are made to the markdown file.
docker run -d --rm --name marp-watch --entrypoint="marp-cli.js" -v $PWD:/home/marp/app/ -p 37717:37717 marpteam/marp-cli:v4.1.1 -w ./presentation.md
sleep 1
open  presentation.html
