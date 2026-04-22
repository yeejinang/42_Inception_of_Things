#!/bin/bash

echo "=== Starting app ==="

# Debug output
echo "MESSAGE=${MESSAGE}"
echo "MY_POD_NAME=${MY_POD_NAME}"
echo "MY_NODE_NAME=${MY_NODE_NAME}"

# Create nginx directory
mkdir -p /var/www/html

# Replace placeholders with actual env vars
sed -i "s|APP_MESSAGE|${MESSAGE}|g" /var/www/html/index.html
sed -i "s|APP_POD_NAME|${MY_POD_NAME}|g" /var/www/html/index.html
sed -i "s|APP_NODE_NAME|${MY_NODE_NAME}|g" /var/www/html/index.html

echo "=== Starting nginx ==="
nginx -g 'daemon off;'