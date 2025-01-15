#!/usr/bin/env bash

set -euo pipefail

direnv allow
git init && git add . && git commit -m "Initial commit, generated with cookiecutter"

if [ "{{ cookiecutter.use_selene }}" == "True" ]; then
  just selene
fi

if [ "{{ cookiecutter.use_luals }}" == "True" ]; then
  just luals
fi
