#!/bin/sh

set -euo pipefail

BASE_DIR="$(realpath "$(dirname "$0")/..")"

engines=( v8 sm jsc chakra graaljs hermes libjs engine262 qjs xs )

mkdir -p "$BASE_DIR/results"
for x in "${engines[@]}"
do
  echo "$x"

  curl -L -o "$BASE_DIR/results/$x.zip" "https://nightly.link/CanadaHonk/test262.fyi/workflows/run/main/$x.zip"

  mkdir -p "$BASE_DIR/results/$x"
  unzip -o -d "$BASE_DIR/results/$x" "$BASE_DIR/results/$x.zip"

  rm "$BASE_DIR/results/$x.zip"
done
