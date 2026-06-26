#!/bin/bash
# install.sh - Install ai-bu-style-checker to ~/.claude/commands/
#
# Copies 8 slash commands and 2 reference files so they are available
# in any Claude Code session.

set -euo pipefail

COMMANDS_DIR="$HOME/.claude/commands"
REFERENCE_DIR="$HOME/.claude/commands/reference"
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

# Colors (disabled if output is not a terminal)
if [ -t 1 ]; then
  GREEN='\033[0;32m'
  YELLOW='\033[0;33m'
  BOLD='\033[1m'
  RESET='\033[0m'
else
  GREEN=''
  YELLOW=''
  BOLD=''
  RESET=''
fi

echo ""
echo -e "${BOLD}ai-bu-style-checker${RESET}"
echo "Installing Red Hat style commands for Claude Code..."
echo ""

# Verify source files exist
if [ ! -d "$SCRIPT_DIR/commands" ] || [ ! -d "$SCRIPT_DIR/reference" ]; then
  echo "Error: commands/ and reference/ directories not found in $SCRIPT_DIR"
  echo "Make sure you are running install.sh from the project root."
  exit 1
fi

# Create target directories
mkdir -p "$COMMANDS_DIR"
mkdir -p "$REFERENCE_DIR"

# Copy command files
COMMANDS=(
  "style-check"
  "style-fix"
  "style-score"
  "style-batch"
  "style-diff"
  "style-learn"
  "style-compare"
  "tone-check"
)

INSTALLED=0
for cmd in "${COMMANDS[@]}"; do
  SOURCE="$SCRIPT_DIR/commands/$cmd.md"
  if [ -f "$SOURCE" ]; then
    cp "$SOURCE" "$COMMANDS_DIR/$cmd.md"
    INSTALLED=$((INSTALLED + 1))
  else
    echo -e "${YELLOW}Warning: $SOURCE not found, skipping${RESET}"
  fi
done

# Copy reference files
REFS=0
for ref in "product-names.md" "style-guide.md"; do
  SOURCE="$SCRIPT_DIR/reference/$ref"
  if [ -f "$SOURCE" ]; then
    cp "$SOURCE" "$REFERENCE_DIR/$ref"
    REFS=$((REFS + 1))
  else
    echo -e "${YELLOW}Warning: $SOURCE not found, skipping${RESET}"
  fi
done

echo -e "${GREEN}Installed $INSTALLED commands to $COMMANDS_DIR${RESET}"
echo -e "${GREEN}Installed $REFS reference files to $REFERENCE_DIR${RESET}"
echo ""
echo -e "${BOLD}Commands now available in Claude Code:${RESET}"
echo ""
echo "  Core:"
echo "    /style-check <file|text>    Find issues without changing anything"
echo "    /style-fix <file|text>      Apply fixes automatically"
echo "    /style-score <file|text>    Score your draft (0-100)"
echo "    /tone-check <file|text>     Check your voice against Red Hat style"
echo ""
echo "  Workflow:"
echo "    /style-batch <path|glob>    Check a whole directory"
echo "    /style-diff <branch>        Check only your changes (pre-PR check)"
echo "    /style-compare <old> <new>  Compare two versions"
echo "    /style-learn <exception>    Record a project-specific exception"
echo ""
echo "  Reference files:"
echo "    reference/product-names.md  250+ product names with correct capitalization"
echo "    reference/style-guide.md    Full Red Hat writing style guide"
echo ""
echo -e "${BOLD}Quick start:${RESET}"
echo "  /style-check path/to/your-doc.md"
echo "  /style-score path/to/your-doc.md"
echo "  /style-diff main"
echo ""
