#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Jira Ticket New
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 🛩
# @raycast.packageName Web Searches
# @raycast.argument1 { "type": "text", "placeholder": "Ticket Code", "percentEncoded": false }

# open "https://www.google.com/search?q=flights%20from%20$1%20to%20$2"

JIRA_BASE_URL="https://go-jek.atlassian.net/browse"
open "$JIRA_BASE_URL/$1"

