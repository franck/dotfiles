#!/bin/bash
set -e

PLUGINS=( "mobz/elasticsearch-head" "royrusso/elasticsearch-HQ" "jprante/elasticsearch-river-jdbc --url http://bit.ly/1jyXrR9" )

install_plugins() {
  for plugin in "${PLUGINS[@]}"
  do
    install_plugin $plugin
  done
}


install_plugin() {
  echo $1
  if [ ! -f $1 ]
  then
    ./bin/plugin -remove $1
    ./bin/plugin --install $1
  else
    echo "$1 dejà installé"
  fi
}

if [ -f bin/plugin ]
then
  echo "Installing ES plugins ..."
  install_plugins
else
  echo "Vous devez être à la racine du dossier elasticsearch"
  exit 1
fi

