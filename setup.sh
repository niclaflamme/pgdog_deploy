#!/usr/bin/env bash
set -euo pipefail

# Require env vars
: "${ADMIN_PASSWORD:?Need ADMIN_PASSWORD}"
: "${SHARD_0_PGHOST:?Need SHARD_0_PGHOST}"
: "${SHARD_0_PGPORT:?Need SHARD_0_PGPORT}"
: "${SHARD_0_PGDATABASE:?Need SHARD_0_PGDATABASE}"
: "${SHARD_0_PGUSER:?Need SHARD_0_PGUSER}"
: "${SHARD_0_PGPASSWORD:?Need SHARD_0_PGPASSWORD}"
: "${SHARD_1_PGHOST:?Need SHARD_1_PGHOST}"
: "${SHARD_1_PGPORT:?Need SHARD_1_PGPORT}"
: "${SHARD_1_PGDATABASE:?Need SHARD_1_PGDATABASE}"
: "${SHARD_1_PGUSER:?Need SHARD_1_PGUSER}"
: "${SHARD_1_PGPASSWORD:?Need SHARD_1_PGPASSWORD}"

# Copy template
cp template.pgdog.toml pgdog.toml

# Cross-platform sed -i
if [[ "$OSTYPE" == "darwin"* ]]; then
  sed_args=(-i "")
else
  sed_args=(-i)
fi

# Perform replacements
sed "${sed_args[@]}" \
  -e "s|\"{{admin_password}}\"|\"$ADMIN_PASSWORD\"|g" \
  -e "s|\"{{shard_0_pghost}}\"|\"$SHARD_0_PGHOST\"|g" \
  -e "s|\"{{shard_0_pgport}}\"|$SHARD_0_PGPORT|g" \
  -e "s|\"{{shard_0_pgdatabase}}\"|\"$SHARD_0_PGDATABASE\"|g" \
  -e "s|\"{{shard_0_pguser}}\"|\"$SHARD_0_PGUSER\"|g" \
  -e "s|\"{{shard_0_pgpassword}}\"|\"$SHARD_0_PGPASSWORD\"|g" \
  -e "s|\"{{shard_1_pghost}}\"|\"$SHARD_1_PGHOST\"|g" \
  -e "s|\"{{shard_1_pgport}}\"|$SHARD_1_PGPORT|g" \
  -e "s|\"{{shard_1_pgdatabase}}\"|\"$SHARD_1_PGDATABASE\"|g" \
  -e "s|\"{{shard_1_pguser}}\"|\"$SHARD_1_PGUSER\"|g" \
  -e "s|\"{{shard_1_pgpassword}}\"|\"$SHARD_1_PGPASSWORD\"|g" \
  pgdog.toml

echo "pgdog.toml created."
