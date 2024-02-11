#!/bin/bash

# @raycast.schemaVersion 1
# @raycast.title Search Confluence
# @raycast.mode silent

# Optional parameters:
# @raycast.icon https://go-jek.atlassian.net/favicon.ico
# @raycast.packageName Search Confluence with Query
# @raycast.argument1 { "type": "text", "placeholder": "Query", "percentEncoded": false }

BASE_URL="https://go-jek.atlassian.net/wiki/search?text="
open "${BASE_URL}${1}"

