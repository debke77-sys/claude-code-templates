#!/bin/bash
cd "$(dirname "$0")"
PORT=8420

if command -v python3 &>/dev/null; then
  PYTHON=python3
elif command -v python &>/dev/null; then
  PYTHON=python
else
  echo "Python is niet gevonden op dit systeem."
  echo "macOS heeft meestal Python 3 ingebouwd. Is dat niet zo, installeer het via https://www.python.org/downloads/"
  read -p "Druk op Enter om af te sluiten..."
  exit 1
fi

"$PYTHON" -m http.server "$PORT" &
SERVER_PID=$!
trap "kill $SERVER_PID 2>/dev/null" EXIT

sleep 1
open "http://localhost:$PORT/index.html"

echo "De Zorgplanner draait nu op http://localhost:$PORT"
echo "Laat dit venster openstaan zolang je de app gebruikt."
echo "Sluit dit venster (of druk op Ctrl+C) om de app weer te stoppen."
wait $SERVER_PID
