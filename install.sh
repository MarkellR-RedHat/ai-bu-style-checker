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

echo "Done. Installed the following commands to $COMMANDS_DIR:"
echo "  /style-check - Check content against Red Hat style conventions"
echo "  /style-fix   - Check and automatically fix style issues"
echo ""
echo "Usage in Claude Code:"
echo "  /style-check path/to/file.md"
echo "  /style-check \"paste your text here\""
echo "  /style-fix path/to/file.md"
