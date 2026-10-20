#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
mkdir -p agents/keys
[ -f agents/keys/agent_key ] || ssh-keygen -t ed25519 -N "" -f agents/keys/agent_key -C jenkins-agent >/dev/null
cd compose; [ -f .env ] || cp .env.example .env
grep -v '^JENKINS_AGENT_SSH_PUBKEY=' .env > .env.tmp || true
echo "JENKINS_AGENT_SSH_PUBKEY=$(cat ../agents/keys/agent_key.pub)" >> .env.tmp && mv .env.tmp .env
echo "Agent key ready."
