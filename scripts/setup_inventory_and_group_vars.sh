#!/usr/bin/env bash

set -e

GROUP_VARS_FILE="group_vars/$(hostname)"

if [ ! -f "$GROUP_VARS_FILE" ]; then
  mkdir -p "$GROUP_VARS_FILE"
  echo -e "---\n# You can copy and modify variables over from ../all/*.yml" > "$GROUP_VARS_FILE/all.yml"
fi

PRIVATE_INVENTORY_FILE=".inventory"

if [ ! -f "$PRIVATE_INVENTORY_FILE" ]; then
  echo -e "[$(hostname)]\n127.0.0.1" > $PRIVATE_INVENTORY_FILE
fi
