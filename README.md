# ai-bu-style-checker

Claude Code commands that check (and fix) content against Red Hat writing conventions and product naming standards. Includes style scoring and tone analysis.

## Why This Exists

Getting product names wrong is embarrassing. Writing "Openshift" instead of "OpenShift" or forgetting to expand "RHEL" on first use are small mistakes that undermine credibility. This tool catches those mistakes before your content goes public.

It also checks for tone, style, and common writing issues based on Red Hat conventions. Every finding is tagged with a severity level (ERROR, WARNING, INFO) so you know what to fix first.

## What It Checks

- **Product name errors** (ERROR): Catches misspellings, incorrect capitalization, and missing full names on first use for Red Hat products, partner names (NVIDIA, Kubernetes), and community projects (InstructLab, Podman)
- **Red Hat style rules** (ERROR): No possessive "Red Hat's", no "RH" abbreviation, correct capitalization
- **Tone** (WARNING): Flags marketing buzzwords, salesy language, and "We're excited to announce" phrasing
- **Writing quality** (WARNING): Flags "utilize," passive voice overuse, unnecessarily complex sentences, and wordy phrases
- **Em dash usage** (WARNING): Flags em dashes and suggests alternatives
- **Jargon** (INFO): Flags technical terms and acronyms used without definition on first use
- **Structure** (INFO): Flags long sentences, walls of text, and stacked adjectives

## Installation

Clone this repo and run the install script:

```bash
git clone https://github.com/MarkellR-RedHat/ai-bu-style-checker.git
cd ai-bu-style-checker
bash install.sh
```

This copies the command files to `~/.claude/commands/` so they are available as slash commands in Claude Code.

## Usage

### Check content (report issues with severity levels)

```
/style-check path/to/your-document.md
```

```
/style-check "Red Hat's Openshift platform utilizes cutting-edge technology"
```

This outputs a list of issues grouped by severity (ERROR, WARNING, INFO) with locations and suggested fixes. It does not modify anything.

### Fix content (apply corrections)

```
/style-fix path/to/your-document.md
```

This applies fixes directly to the file and shows you a summary of every change with its severity level.

```
/style-fix "Red Hat's Openshift platform utilizes cutting-edge technology"
```

For pasted text, it shows the corrected version along with a change summary.

### Score content (compliance rating)

```
/style-score path/to/your-document.md
```

Produces a compliance score out of 100 with a breakdown across five categories: product names, tone and voice, writing quality, structure, and punctuation. Tells you the highest-impact changes to improve the score.

### Analyze tone (engineering voice check)

```
/tone-check path/to/your-document.md
```

Rates content on a 5-point scale from "engineering blog" (target) to "press release" (avoid). Reports buzzword density, specificity of claims, passive voice ratio, and flags the passages that pull the tone in the wrong direction.

## Reference Files

The `reference/` directory contains guides you can consult directly:

- **`reference/product-names.md`**: Complete list of Red Hat product names, partner product names, acceptable short names, and common mistakes.
- **`reference/style-guide.md`**: Condensed Red Hat writing style guide with good vs. bad examples covering voice, tone, grammar, punctuation, and formatting.

## Example

Input:
```
RHEL is Red Hat's best-in-class operating system. It leverages cutting-edge 
technology to deliver world-class performance. Openshift AI — which is built 
on kubernetes — utilizes advanced ML capabilities in order to provide 
next-generation inference serving. We're thrilled to announce that AAP now 
facilitates seamless integration with Nvidia GPUs, and podman is able to 
run InstructLAB workloads due to the fact that the container runtime 
supports GPU passthrough.
```

The style checker would flag:

**ERRORS:**
- "RHEL" needs expansion on first use: "Red Hat Enterprise Linux (RHEL)"
- "Red Hat's" should be "the Red Hat" (no possessive form)
- "Openshift AI" should be "Red Hat OpenShift AI"
- "kubernetes" should be "Kubernetes" (capitalize in prose)
- "AAP" needs expansion on first use: "Red Hat Ansible Automation Platform (AAP)"
- "Nvidia" should be "NVIDIA"
- "podman" at sentence start should be "Podman"
- "InstructLAB" should be "InstructLab"

**WARNINGS:**
- "best-in-class" is a marketing buzzword
- "leverages" should be "uses"
- "cutting-edge" and "world-class" are marketing buzzwords
- Em dashes should be replaced with commas or separate sentences
- "utilizes" should be "uses"
- "in order to" should be "to"
- "next-generation" is a marketing buzzword
- "We're thrilled to announce" - just announce it
- "facilitates" should be "helps" or "enables"
- "seamless" is a buzzword without supporting evidence
- "is able to" should be "can"
- "due to the fact that" should be "because"

**INFO:**
- The long first paragraph could be split for readability

## Contributing

Open an issue or pull request if you spot a missing product name, a rule that needs updating, or a common mistake that should be covered.

## License

Apache-2.0
