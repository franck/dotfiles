#!/usr/bin/env bash

g() {
  if [[ "$#" > 0 ]]; then
    git $@
  else
    git status
  fi
}
