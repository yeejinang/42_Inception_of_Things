#!/bin/bash

# Wait for token file to appear
while [ ! -f /vagrant/node-token ]; do
  echo "Waiting for server token..."
  sleep 3
done

TOKEN=$(cat /vagrant/node-token)

curl -sfL https://get.k3s.io | \
  K3S_URL=https://192.168.56.110:6443 \
  K3S_TOKEN=$TOKEN \
  sh -

echo "Worker joined the cluster!"