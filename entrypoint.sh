#!/bin/bash
set -e

# Check if Hailo is installed
if ! dpkg -s hailort >/dev/null 2>&1; then
  echo "📦 Installing Hailo runtime via apt (requires live system)..."
  export DEBIAN_FRONTEND=noninteractive
  apt-get update
  apt-get install -y hailo-all
else
  echo "✅ Hailo runtime already installed"
fi

# Pass control to CMD
exec "$@"
