#!/bin/bash

for i in {1..3}; do
  echo "Destroying aeternuum-$i..."
  fleetctl destroy aeternuum-http@$i.service
  echo "...aeternuum-$i destroyed."
done
