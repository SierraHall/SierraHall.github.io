#!/usr/bin/env bash
# Stamps the site's real URL into index.html (canonical + social preview tags).
# Run this once, after you know the GitHub Pages address.
#
#   ./set-url.sh https://YOURNAME.github.io/portfolio
#
# No trailing slash. Safe to re-run — it replaces whatever is there now.
set -euo pipefail

if [ $# -ne 1 ]; then
  echo "usage: ./set-url.sh https://YOURNAME.github.io/portfolio" >&2
  exit 1
fi

URL="${1%/}"
HERE="$(cd "$(dirname "$0")" && pwd)"
FILE="$HERE/index.html"

# first run replaces the placeholder; later runs replace the previous URL
if grep -q '__SITE_URL__' "$FILE"; then
  sed -i.bak "s|__SITE_URL__|$URL|g" "$FILE"
else
  sed -i.bak -E "s|(<meta property=\"og:url\" content=\")[^\"]*|\1$URL|; \
                 s|(<meta property=\"og:image\" content=\")[^\"]*|\1$URL/oia-poster.jpg|; \
                 s|(<link rel=\"canonical\" href=\")[^\"]*|\1$URL|" "$FILE"
fi

rm -f "$FILE.bak"
echo "Set site URL to: $URL"
grep -o 'content="[^"]*github[^"]*"' "$FILE" | head -3 || true
