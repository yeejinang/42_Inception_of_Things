#!/bin/bash
curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="--write-kubeconfig-mode=644" sh -

# Wait until token exists
while [ ! -f /var/lib/rancher/k3s/server/node-token ]; do
  sleep 2
done

# Copy token to shared folder so worker can read it
cp /var/lib/rancher/k3s/server/node-token /vagrant/node-token
echo "Server ready, token saved."