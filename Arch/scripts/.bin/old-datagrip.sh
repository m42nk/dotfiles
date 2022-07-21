#!/bin/env bash

exec datagrip.sh > /dev/null  2>&1 &
disown
