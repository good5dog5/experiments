#!/bin/bash
HOST=${1:-localhost}
YML=${2:-desktop.yml}
ansible-playbook -i inventory --ask-pass --extra-vars="hosts=$HOST" $YML
