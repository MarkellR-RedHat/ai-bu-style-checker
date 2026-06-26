#!/bin/bash
# install.sh - Install ai-bu-style-checker commands to ~/.claude/commands/

set -e

COMMANDS_DIR="$HOME/.claude/commands"
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "Installing ai-bu-style-checker commands..."

# Create the commands directory if it does not exist
mkdir -p "$COMMANDS_DIR"

# Copy command files
cp "$SCRIPT_DIR/commands/style-check.md" "$COMMANDS_DIR/style-check.md"
cp "$SCRIPT_DIR/commands/style-fix.md" "$COMMANDS_DIR/style-fix.md"
cp "$SCRIPT_DIR/commands/style-score.md" "$COMMANDS_DIR/style-score.md"
cp "$SCRIPT_DIR/commands/tone-check.md" "$COMMANDS_DIR/tone-check.md"

echo "Done. Installed the following commands to $COMMANDS_DIR:"
echo "  /style-check - Check content against Red Hat style conventions (with severity levels)"
echo "  /style-fix   - Check and automatically fix style issues"
echo "  /style-score - Score content for style compliance (0-100)"
echo "  /tone-check  - Analyze tone on a spectrum from engineering blog to press release"
echo ""
echo "Usage in Claude Code:"
echo "  /style-check path/to/file.md"
echo "  /style-check \"paste your text here\""
echo "  /style-fix path/to/file.md"
echo "  /style-score path/to/file.md"
echo "  /tone-check path/to/file.md"
