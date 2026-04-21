#!/bin/bash

echo "=== Starting app ==="

# Debug output
echo "MESSAGE=${MESSAGE}"
echo "MY_POD_NAME=${MY_POD_NAME}"
echo "MY_NODE_NAME=${MY_NODE_NAME}"

# Create nginx directory
mkdir -p /var/www/html

# Check template exists
if [ ! -f /app/public/index.html.template ]; then
  echo "ERROR: template not found at /app/public/index.html.template"
  ls -la /app/public/
  exit 1
fi

# Copy template
cp /app/public/index.html.template /var/www/html/index.html
echo "Template copied successfully"

# Replace placeholders with actual env vars
sed -i "s|APP_MESSAGE|${MESSAGE}|g" /var/www/html/index.html
sed -i "s|APP_POD_NAME|${MY_POD_NAME}|g" /var/www/html/index.html
sed -i "s|APP_NODE_NAME|${MY_NODE_NAME}|g" /var/www/html/index.html

echo "Placeholders replaced"
echo "=== Final HTML ==="
cat /var/www/html/index.html

echo "=== Starting nginx ==="
nginx -g 'daemon off;'