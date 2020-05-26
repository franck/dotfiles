#!/usr/bin/env bash

set -e

readonly MIGRATION_VERSION=$1

main(){
	echo "Migrating down $MIGRATION_VERSION"
  rails db:migrate:down VERSION=$MIGRATION_VERSION
  rails db:migrate:down VERSION=$MIGRATION_VERSION RAILS_ENV=test
}

main
