#!/bin/bash

# Raycast Script Command Template
#
# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Jira Ticket
# @raycast.mode inline
#
# Optional parameters:
# @raycast.icon https://cdn.worldvectorlogo.com/logos/jira-1.svg

# @raycast.packageName Web Searches
# @raycast.argument1 { "type": "text", "placeholder": "Code" }

JIRA_BASE_URL="https://go-jek.atlassian.net/browse"
# open "https://www.google.com/search?q=flights%20from%20$1%20to%20$2"

open "$JIRA_BASE_URL/$1"
