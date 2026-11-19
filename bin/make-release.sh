#!/usr/bin/env bash
# Usage: bin/make-release.sh <version>   e.g. bin/make-release.sh 1.0.1
set -euo pipefail
cd "$(dirname "$0")/.."

version="${1:-}"
if ! [[ "$version" =~ ^[0-9]+\.[0-9]+\.[0-9]+(-(alpha|beta|rc)\.[0-9]+)?$ ]]; then
  echo "Usage: $0 <MAJOR.MINOR.PATCH>" >&2
  exit 1
fi

if [ -n "$(git status --porcelain)" ]; then
  echo "Working tree is not clean. Commit or stash first." >&2
  exit 1
fi

current=$(sed -nE 's/.*"version": *"([^"]+)".*/\1/p' manifest.json)
if [ "$current" != "$version" ]; then
  sed -i.bak -E "s/(\"version\": *\")[^\"]+\"/\1$version\"/" manifest.json && rm manifest.json.bak
  git add manifest.json
  git commit -m "Release v$version"
fi

git tag "v$version"
git push
git push origin "v$version"
echo "Pushed v$version. The release workflow will publish the GitHub release."
