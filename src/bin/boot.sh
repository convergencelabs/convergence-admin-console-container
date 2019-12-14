#!/bin/sh

require_env_var() {
  if [ "$1" == "" ]; then
    echo "Error: '$2' was not set."
    echo "Aborting."
    exit 1
  else
    echo "   $2: $1"
  fi
}

echo "Convergence Admin Console"
echo "Checking required environment variables..."
echo ""

require_env_var $CONVERGENCE_CONSOLE_BASE_URL "CONVERGENCE_CONSOLE_BASE_URL"
require_env_var $CONVERGENCE_SERVER_REST_API "CONVERGENCE_SERVER_REST_API"
require_env_var $CONVERGENCE_SERVER_REALTIME_API "CONVERGENCE_SERVER_REALTIME_API"

echo ""
echo "All required environment variables are set.  Processing config file."
echo ""

/usr/local/bin/confd -backend env --onetime

echo ""
echo "Starting the Convergence Admin Console"

exec nginx -g "daemon off;"