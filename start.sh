#!/bin/bash

for i in {1..3}; do
  echo "Deploying aeternuum-$i..."
  fleetctl start aeternuum-http@$i.service
  echo "...aeternuum-$i deployed."
done
