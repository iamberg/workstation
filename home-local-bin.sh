#!/bin/bash

addToPath() {
  case ":$PATH:" in
    *":$1:"*) :;; # Already there
    *) PATH="$1:$PATH";; # Add to path
  esac
}

addToPath "$HOME/.local.bin"
