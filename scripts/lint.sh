#!/bin/bash

# YAML
yamllint .

# Bash
shellcheck ./*.sh
shellcheck scripts/*.sh

# TODO: Markdown
#markdownlint README.md
#markdownlint docs/*.md
