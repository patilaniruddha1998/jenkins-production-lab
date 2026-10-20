#!/usr/bin/env bash
set -euo pipefail
HERE="$(cd "$(dirname "$0")" && pwd)"
"$HERE/gen-agent-key.sh"
cd "$HERE/../compose"
grep -q 'change-me' .env && { echo "Edit compose/.env: set JENKINS_ADMIN_PASSWORD, then rerun."; exit 1; }
docker compose up -d --build
echo "Jenkins: http://localhost:8080"
