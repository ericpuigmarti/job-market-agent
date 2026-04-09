#!/usr/bin/env bash
# Usage: ./send-digest.sh <html-file> [subject]
# Sends a job agent digest email via Resend.

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ENV_FILE="$SCRIPT_DIR/.env"

if [[ ! -f "$ENV_FILE" ]]; then
  echo "Error: .env file not found at $ENV_FILE" >&2
  exit 1
fi

# Load env vars
set -a; source "$ENV_FILE"; set +a

HTML_FILE="${1:-}"
SUBJECT="${2:-Job Agent Weekly Digest}"

if [[ -z "$HTML_FILE" || ! -f "$HTML_FILE" ]]; then
  echo "Usage: $0 <html-file> [subject]" >&2
  exit 1
fi

HTML_BODY=$(cat "$HTML_FILE")

# Escape for JSON
JSON_BODY=$(jq -n \
  --arg from "$DIGEST_FROM" \
  --arg to "$DIGEST_TO" \
  --arg subject "$SUBJECT" \
  --arg html "$HTML_BODY" \
  '{from: $from, to: [$to], subject: $subject, html: $html}')

echo "Sending to $DIGEST_TO..."

RESPONSE=$(curl -s -w "\n%{http_code}" \
  -X POST https://api.resend.com/emails \
  -H "Authorization: Bearer $RESEND_API_KEY" \
  -H "Content-Type: application/json" \
  -d "$JSON_BODY")

HTTP_CODE=$(echo "$RESPONSE" | tail -n1)
BODY=$(echo "$RESPONSE" | sed '$d')

if [[ "$HTTP_CODE" == "200" || "$HTTP_CODE" == "201" ]]; then
  echo "Sent successfully. ID: $(echo "$BODY" | jq -r '.id')"
else
  echo "Error $HTTP_CODE: $BODY" >&2
  exit 1
fi
