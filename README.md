# ai-bu-style-checker

Claude Code commands that check (and fix) content against Red Hat writing conventions and product naming standards.

## Why This Exists

Getting product names wrong is embarrassing. Writing "Openshift" instead of "OpenShift" or forgetting to expand "RHEL" on first use are small mistakes that undermine credibility. This tool catches those mistakes before your content goes public.

It also checks for tone, style, and common writing issues based on Red Hat conventions.

## What It Checks

- **Product name errors**: Catches misspellings, incorrect capitalization, and missing full names on first use (OpenShift, not Openshift; full name before abbreviation)
- **Red Hat style rules**: No possessive "Red Hat's", no "RH" abbreviation, correct capitalization
- **Tone**: Flags marketing buzzwords and salesy language
- **Writing quality**: Flags "utilize," passive voice overuse, unnecessarily complex sentences, and wordy phrases
- **Em dash usage**: Flags em dashes and suggests alternatives
- **Jargon**: Flags technical terms and acronyms used without definition on first use

## Installation

Clone this repo and run the install script:

```bash
git clone https://github.com/MarkellR-RedHat/ai-bu-style-checker.git
cd ai-bu-style-checker
bash install.sh
```

This copies the command files to `~/.claude/commands/` so they are available as slash commands in Claude Code.

## Usage

### Check content (report issues)

```
/style-check path/to/your-document.md
```

```
/style-check "Red Hat's Openshift platform utilizes cutting-edge technology"
```

This outputs a list of issues with locations and suggested fixes. It does not modify anything.

### Fix content (apply corrections)

```
/style-fix path/to/your-document.md
```

This applies fixes directly to the file and shows you a summary of every change.

```
/style-fix "Red Hat's Openshift platform utilizes cutting-edge technology"
```

For pasted text, it shows the corrected version along with a change summary.

## Reference Files

The `reference/` directory contains guides you can consult directly:

- **`reference/product-names.md`**: Complete list of Red Hat product names, acceptable short names, and common mistakes.
- **`reference/style-guide.md`**: Condensed Red Hat writing style guide covering voice, tone, grammar, punctuation, and formatting.

## Example

Input:
```
RHEL is Red Hat's best-in-class operating system. It leverages cutting-edge 
technology to deliver world-class performance. Openshift AI — which is built 
on Kubernetes — utilizes advanced ML capabilities in order to provide 
next-generation inference serving.
```

The style checker would flag:
- "RHEL" needs expansion on first use: "Red Hat Enterprise Linux (RHEL)"
- "Red Hat's" should be "the Red Hat"
- "best-in-class" is a marketing buzzword
- "leverages" should be "uses"
- "cutting-edge" and "world-class" are marketing buzzwords
- "Openshift AI" should be "Red Hat OpenShift AI"
- Em dashes should be replaced with commas or separate sentences
- "utilizes" should be "uses"
- "in order to" should be "to"
- "next-generation" is a marketing buzzword

## Contributing

Open an issue or pull request if you spot a missing product name, a rule that needs updating, or a common mistake that should be covered.

## License

Apache-2.0
