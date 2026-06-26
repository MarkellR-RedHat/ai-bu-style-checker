#!/bin/bash
# install.sh - Install ai-bu-style-checker commands and reference files to ~/.claude/

set -e

COMMANDS_DIR="$HOME/.claude/commands"
REFERENCE_DIR="$HOME/.claude/commands/reference"
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "Installing ai-bu-style-checker..."
echo ""

# Create directories
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

for cmd in "${COMMANDS[@]}"; do
  cp "$SCRIPT_DIR/commands/$cmd.md" "$COMMANDS_DIR/$cmd.md"
done

# Copy reference files
cp "$SCRIPT_DIR/reference/product-names.md" "$REFERENCE_DIR/product-names.md"
cp "$SCRIPT_DIR/reference/style-guide.md" "$REFERENCE_DIR/style-guide.md"

echo "Installed ${#COMMANDS[@]} commands to $COMMANDS_DIR"
echo "Installed reference files to $REFERENCE_DIR"
echo ""
echo "Commands available in Claude Code:"
echo ""
echo "  Core:"
echo "    /style-check <file|text>    Check content for style issues (report only)"
echo "    /style-fix <file|text>      Check and auto-fix style issues"
echo "    /style-score <file|text>    Score content for compliance (0-100)"
echo "    /tone-check <file|text>     Analyze tone on the engineering-to-marketing spectrum"
echo ""
echo "  Workflow:"
echo "    /style-batch <path|glob>    Check an entire directory of files"
echo "    /style-diff <branch>        Check only changed lines in a git diff"
echo "    /style-compare <old> <new>  Compare two versions and show the score delta"
echo "    /style-learn <exception>    Record a project-specific style exception"
echo ""
echo "  Reference files:"
echo "    reference/product-names.md  250+ product names with correct capitalization"
echo "    reference/style-guide.md    Full Red Hat writing style guide"
echo ""
echo "Quick start:"
echo "  /style-check path/to/your-doc.md"
echo "  /style-score path/to/your-doc.md"
echo "  /style-diff main"
