#!/usr/bin/env bash

set -e

echo "Starting automated test suite..."

# Verify essential directory structure
echo "Verifying project directory structure..."
test -d css || { echo "css directory missing"; exit 1; }
test -d script || { echo "script directory missing"; exit 1; }
test -d html || { echo "html directory missing"; exit 1; }

# Verify core files exist
echo "Verifying core asset files..."
test -f html/index.html || { echo "html/index.html missing"; exit 1; }
test -f css/style.css || { echo "css/style.css missing"; exit 1; }
test -f script/script.js || { echo "script/script.js missing"; exit 1; }
test -f script/ui.js || { echo "script/ui.js missing"; exit 1; }
test -f script/data.js || { echo "script/data.js missing"; exit 1; }

# Verify HTML structure and required elements
echo "Testing index.html contents..."
grep -qi "<!DOCTYPE html>" html/index.html || { echo "Missing DOCTYPE in html/index.html"; exit 1; }
grep -qi "Task Manager" html/index.html || { echo "Missing Task Manager in html/index.html"; exit 1; }

echo "All tests passed successfully."