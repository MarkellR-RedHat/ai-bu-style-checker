#!/bin/bash
# install.sh - Install ai-bu-style-checker commands into Claude Code
#
# Copies 8 slash commands and 2 reference files to ~/.claude/commands/
# so they are available in any Claude Code session.

set -euo pipefail

COMMANDS_DIR="$HOME/.claude/commands"
REFERENCE_DIR="$HOME/.claude/commands/reference"
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

# Colors (disabled if output is not a terminal)
if [ -t 1 ]; then
  GREEN='\033[0;32m'
  RED='\033[0;31m'
  DIM='\033[2m'
  BOLD='\033[1m'
  RESET='\033[0m'
else
  GREEN=''
  RED=''
  DIM=''
  BOLD=''
  RESET=''
fi

echo ""
echo -e "${BOLD}ai-bu-style-checker${RESET}"
echo -e "${DIM}Red Hat style commands for Claude Code${RESET}"
echo ""

# Verify source directories exist
if [ ! -d "$SCRIPT_DIR/commands" ]; then
  echo -e "${RED}Error: commands/ directory not found in $SCRIPT_DIR${RESET}"
  echo "Run this script from the project root: bash install.sh"
  exit 1
fi

if [ ! -d "$SCRIPT_DIR/reference" ]; then
  echo -e "${RED}Error: reference/ directory not found in $SCRIPT_DIR${RESET}"
  echo "Run this script from the project root: bash install.sh"
  exit 1
fi

# Create target directories
mkdir -p "$COMMANDS_DIR"
mkdir -p "$REFERENCE_DIR"

# Install command files
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
FAILED=0
echo "Installing commands..."
for cmd in "${COMMANDS[@]}"; do
  SOURCE="$SCRIPT_DIR/commands/$cmd.md"
  if [ -f "$SOURCE" ]; then
    cp "$SOURCE" "$COMMANDS_DIR/$cmd.md"
    echo -e "  ${GREEN}+${RESET} /$cmd"
    INSTALLED=$((INSTALLED + 1))
  else
    echo -e "  ${RED}!${RESET} /$cmd  (source file not found, skipping)"
    FAILED=$((FAILED + 1))
  fi
done

# Install reference files
REFS=0
echo ""
echo "Installing reference files..."
for ref in "product-names.md" "style-guide.md"; do
  SOURCE="$SCRIPT_DIR/reference/$ref"
  if [ -f "$SOURCE" ]; then
    cp "$SOURCE" "$REFERENCE_DIR/$ref"
    echo -e "  ${GREEN}+${RESET} reference/$ref"
    REFS=$((REFS + 1))
  else
    echo -e "  ${RED}!${RESET} reference/$ref  (source file not found, skipping)"
    FAILED=$((FAILED + 1))
  fi
done

# Summary
echo ""
if [ "$FAILED" -gt 0 ]; then
  echo -e "${RED}Installed $INSTALLED commands and $REFS reference files ($FAILED files skipped).${RESET}"
  echo "Check that all source files exist in commands/ and reference/."
  exit 1
else
  echo -e "${GREEN}Installed $INSTALLED commands and $REFS reference files.${RESET}"
fi

echo -e "${DIM}Location: $COMMANDS_DIR${RESET}"
echo ""
echo -e "${BOLD}Try it out:${RESET}"
echo ""
echo "  /style-check path/to/your-doc.md"
echo ""
