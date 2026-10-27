#!/usr/bin/env bash
# Link this repo's skills and personal CLAUDE.md into ~/.claude, and turn off auto memory.
# Safe to rerun: it never overwrites a file it did not create.
set -euo pipefail

REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CLAUDE_DIR="$HOME/.claude"
mkdir -p "$CLAUDE_DIR/skills"

# Skills: one symlink per skills/<name>/.
for dir in "$REPO"/skills/*/; do
  name="$(basename "$dir")"
  src="${dir%/}"
  dest="$CLAUDE_DIR/skills/$name"
  if [ -L "$dest" ] && [ "$(readlink "$dest")" = "$src" ]; then
    echo "ok       skill $name"
  elif [ -e "$dest" ] || [ -L "$dest" ]; then
    echo "SKIPPED  skill $name: $dest already exists and is not this repo's. Rename one of them."
  else
    ln -s "$src" "$dest"
    echo "linked   skill $name"
  fi
done

# Personal CLAUDE.md: link it only when there is none.
src="$REPO/personal/CLAUDE.md"
dest="$CLAUDE_DIR/CLAUDE.md"
if [ -L "$dest" ] && [ "$(readlink "$dest")" = "$src" ]; then
  echo "ok       CLAUDE.md"
elif [ -e "$dest" ] || [ -L "$dest" ]; then
  cat <<EOF
SKIPPED  CLAUDE.md: you already have $dest, and this script never overwrites it.
         To merge, start Claude in this repo and ask:
           "Merge $dest into personal/CLAUDE.md, keeping everything of mine
            that still changes your behavior. Show me the result before writing."
         Then move yours aside and rerun this script:
           mv $dest $dest.bak && ./install.sh
EOF
else
  ln -s "$src" "$dest"
  echo "linked   CLAUDE.md"
fi

# Auto memory off: knowledge goes in committed files instead (see README).
settings="$CLAUDE_DIR/settings.json"
if [ ! -e "$settings" ]; then
  echo '{"autoMemoryEnabled": false}' > "$settings"
  echo "created  settings.json with autoMemoryEnabled: false"
elif command -v python3 >/dev/null; then
  python3 - "$settings" <<'EOF'
import json, os, shutil, sys
path = sys.argv[1]
with open(path) as f:
    settings = json.load(f)
if settings.get("autoMemoryEnabled") is False:
    print("ok       autoMemoryEnabled: false")
else:
    shutil.copy2(path, path + ".bak")
    settings["autoMemoryEnabled"] = False
    tmp = path + ".tmp"
    with open(tmp, "w") as f:
        json.dump(settings, f, indent=2)
        f.write("\n")
    os.replace(tmp, path)
    print(f"set      autoMemoryEnabled: false (backup at {path}.bak)")
EOF
else
  echo "TODO     add \"autoMemoryEnabled\": false to $settings (python3 not found)"
fi
