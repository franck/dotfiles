#!/usr/bin/env fish

if count $argv > /dev/null
  git $argv
else
  git status
end 
