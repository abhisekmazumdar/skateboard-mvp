#!/usr/bin/env bash
# Copy this skill into another repo's .claude/skills/ so cloud runs of Claude
# (Claude Code on the web, GitHub Actions) can use it. Edit the skill here,
# never in the copy.
#
# Usage: scripts/sync-to-project.sh <path-to-project-repo>
set -euo pipefail

src="$(cd "$(dirname "$0")/.." && pwd)/skills/skateboard-planning"
project="${1:?usage: $0 <path-to-project-repo>}"
dest="$project/.claude/skills/skateboard-planning"

mkdir -p "$dest"
rsync -a --delete --exclude .DS_Store "$src/" "$dest/"
echo "Synced skateboard-planning -> $dest"
git -C "$project" status --short -- .claude/skills/skateboard-planning
