# ai-bu-style-checker

Claude Code slash commands that enforce Red Hat writing conventions with surgical precision. Eight commands covering style checking, auto-fixing, scoring, tone analysis, batch processing, diff checking, version comparison, and project-specific exception management.

## Why this exists

Getting product names wrong is embarrassing. Writing "Openshift" instead of "OpenShift" or forgetting to expand "RHEL" on first use undermines credibility. This tool catches those mistakes before your content goes public.

But it goes further than product names. It checks tone, flags marketing buzzwords, catches wordy phrases, identifies em dashes, and scores your content against a transparent rubric. Every finding includes the exact text to change and the exact replacement. No vague suggestions.

## What it catches

| Category | Severity | Examples |
|----------|----------|----------|
| Product name errors | ERROR | "Openshift" instead of "OpenShift," missing "Red Hat" prefix on first use, unexpanded abbreviations |
| Red Hat style rules | ERROR | Possessive "Red Hat's," "RH" abbreviation, wrong partner names ("Nvidia" instead of "NVIDIA") |
| Marketing buzzwords | WARNING | "best-in-class," "leverage," "cutting-edge," "We're excited to announce" |
| Wordy phrases | WARNING | "utilize," "in order to," "due to the fact that," "is able to" |
| Em dash usage | WARNING | Flags all em dashes and suggests specific alternatives |
| Passive voice | WARNING | "The cluster is managed by the operator" instead of "The operator manages the cluster" |
| Long sentences | INFO | Sentences over 30 words with suggested split points |
| Structure issues | INFO | Walls of text, missing headings, content that should be a list |
| Inclusive language | INFO | "whitelist/blacklist," "master/slave," gendered language |

## Installation

```bash
git clone https://github.com/MarkellR-RedHat/ai-bu-style-checker.git
cd ai-bu-style-checker
bash install.sh
```

This copies 8 command files and 2 reference files to `~/.claude/commands/` so they are available as slash commands in Claude Code.

## Commands

### Core commands

#### `/style-check <file|text>` - Find issues

Reports every style issue with severity, location, and exact fix text. Does not modify anything.

```
/style-check path/to/document.md
/style-check "Red Hat's Openshift platform utilizes cutting-edge technology"
```

Output is grouped by severity (ERROR first, then WARNING, then INFO). Each finding includes the exact text to change and the exact replacement.

#### `/style-fix <file|text>` - Auto-fix issues

Applies all corrections directly. For file paths, edits the file in place. For pasted text, outputs the corrected version.

```
/style-fix path/to/document.md
```

Every fix is logged with before/after text so you can review what changed.

#### `/style-score <file|text>` - Score compliance

Produces a score out of 100 with a breakdown across five weighted categories:

- Product Names (30%)
- Tone and Voice (25%)
- Writing Quality (25%)
- Structure and Formatting (10%)
- Punctuation and Style Rules (10%)

```
/style-score path/to/document.md
```

The rubric is transparent: you can see exactly how many points each issue costs and what to fix first for the biggest score improvement.

#### `/tone-check <file|text>` - Analyze tone

Rates content on a 5-point scale from "engineering blog" (target) to "press release" (avoid).

```
/tone-check path/to/document.md
```

Reports buzzword density, claim specificity ratio, passive voice percentage, and flags the specific passages that pull the tone toward marketing.

### Workflow commands

#### `/style-batch <path|glob>` - Check a directory

Checks every file in a directory and produces a dashboard with aggregate statistics, a worst-offenders ranking, and per-file reports.

```
/style-batch docs/
/style-batch content/**/*.md
```

Shows total issues by severity, most common issues across the project, and which files need the most attention.

#### `/style-diff <branch>` - Check your changes only

Checks only the lines you changed in a git diff. Pre-existing issues in unchanged lines are not flagged. This is the pre-PR check.

```
/style-diff main
/style-diff origin/main
/style-diff HEAD~3
/style-diff --staged
```

Understands first-use context: if "Red Hat Enterprise Linux (RHEL)" already exists in the file and you add "RHEL" later, that is not flagged.

#### `/style-compare <old> <new>` - Compare versions

Shows which issues were fixed, which were introduced, and the score delta between two versions of a document.

```
/style-compare old-draft.md new-draft.md
/style-compare HEAD~1 path/to/file.md
/style-compare path/to/file.md            # compares git HEAD to working copy
```

Outputs a visual score bar and a detailed breakdown of what improved and what regressed.

#### `/style-learn <exception>` - Record exceptions

When the checker flags something that is intentionally correct for your project, record an exception so future checks skip it.

```
/style-learn "Konflux is a real product name, don't flag it"
/style-learn "GPU doesn't need expansion for our ML engineering audience"
/style-learn "'leverage' is correct here, it means financial leverage"
/style-learn list        # show all current exceptions
/style-learn remove GPU  # remove an exception
```

Exceptions are stored in `.style-exceptions.yml` in your project root. Commit this file so your team shares the same exceptions.

Non-negotiable rules (product name capitalization, no possessive "Red Hat's," no "RH" abbreviation) cannot be overridden.

## Reference files

The `reference/` directory contains two comprehensive guides:

- **`reference/product-names.md`**: 250+ product names covering Red Hat products, NVIDIA/Intel/AMD/AWS/Azure/GCP/IBM partner products, open source AI/ML tools (vLLM, PyTorch, Hugging Face, Ray, KServe), and the full Kubernetes ecosystem. Each entry includes the official name, acceptable abbreviations, and common mistakes.

- **`reference/style-guide.md`**: Complete Red Hat writing style guide with voice principles (with good/bad examples for each), heading conventions, list formatting rules, code block conventions, link text best practices, inclusive language guide, technical writing patterns, and AI/ML-specific style traps.

## Before and after

Here is a realistic document with 20+ style issues, followed by what the checker catches.

### Before (the document with issues)

```
We're thrilled to announce that Red Hat's Openshift AI platform now leverages 
cutting-edge Nvidia GPU technology to deliver best-in-class inference serving 
capabilities! This next-generation solution utilizes llm-d — our revolutionary 
new serving framework — to facilitate seamless model deployment at scale.

RHEL provides the robust foundation, while kubernetes handles orchestration. 
AAP facilitates automation of the entire ML pipeline. Our comprehensive 
platform is able to deploy models from InstructLAB and the Granite family 
on podman or OCP clusters in order to provide world-class AI inference 
performance due to the fact that the architecture was engineered for 
enterprise-grade scalability.

Teams can leverage ARO or ROSA to run their workloads in the cloud. The 
platform's advanced functionality enables organizations to unlock the full 
value of their AI investments. Simply install the operator and configure 
the serving runtime — it's easy to get started with Red Hat Openstack for 
your AI infrastructure needs.

For more information click here to read the docs. Prior to deploying, it 
should be noted that GPU drivers must be installed subsequent to the OS 
installation. At this point in time a large number of models are supported 
including Llama, mistral, and Mixtral architectures. The master node 
coordinates workload scheduling across the whitelist of approved GPU nodes.
```

### What `/style-check` catches

**ERRORS (13):**

```
[ERROR] Product Name
  Location: "Red Hat's Openshift AI"
  Problem:  Possessive "Red Hat's" and "Openshift" (lowercase s)
  Fix:      "The Red Hat OpenShift AI"

[ERROR] Product Name
  Location: "Nvidia GPU"
  Problem:  "Nvidia" should be "NVIDIA"
  Fix:      "NVIDIA GPU"

[ERROR] Product Name
  Location: "RHEL provides"
  Problem:  "RHEL" used without expansion on first use
  Fix:      "Red Hat Enterprise Linux (RHEL) provides"

[ERROR] Product Name
  Location: "kubernetes handles"
  Problem:  "kubernetes" should be capitalized in prose
  Fix:      "Kubernetes handles"

[ERROR] Product Name
  Location: "AAP facilitates"
  Problem:  "AAP" used without expansion on first use
  Fix:      "Red Hat Ansible Automation Platform (AAP) facilitates"

[ERROR] Product Name
  Location: "InstructLAB"
  Problem:  Wrong capitalization
  Fix:      "InstructLab"

[ERROR] Product Name
  Location: "podman or OCP"
  Problem:  "podman" should be capitalized in prose; "OCP" not expanded on first use
  Fix:      "Podman or Red Hat OpenShift Container Platform (OCP)"

[ERROR] Product Name
  Location: "ARO or ROSA"
  Problem:  Neither expanded on first use
  Fix:      "Azure Red Hat OpenShift (ARO) or Red Hat OpenShift Service on AWS (ROSA)"

[ERROR] Product Name
  Location: "Red Hat Openstack"
  Problem:  "Openstack" should be "OpenStack Platform"
  Fix:      "Red Hat OpenStack Platform"

[ERROR] Product Name
  Location: "the platform's"
  Problem:  Possessive form (if referring to Red Hat platform)
  Fix:      Rephrase to avoid possessive

[ERROR] Product Name
  Location: "mistral"
  Problem:  "mistral" should be "Mistral" in prose
  Fix:      "Mistral"
```

**WARNINGS (16):**

```
[WARNING] Tone: "We're thrilled to announce" - just announce it
[WARNING] Tone: "cutting-edge" is a marketing buzzword
[WARNING] Tone: "best-in-class" is a marketing buzzword
[WARNING] Tone: "next-generation" is a marketing buzzword
[WARNING] Tone: "revolutionary" is a marketing buzzword
[WARNING] Tone: "seamless" is a buzzword without supporting evidence
[WARNING] Tone: "comprehensive" is vague filler
[WARNING] Tone: "world-class" is a marketing buzzword
[WARNING] Tone: "enterprise-grade" without specifics
[WARNING] Tone: "unlock the full value" is marketing language
[WARNING] Wordy: "leverages" -> "uses"
[WARNING] Wordy: "utilizes" -> "uses"
[WARNING] Wordy: "facilitate" -> "help" or "enable"
[WARNING] Wordy: "is able to" -> "can"
[WARNING] Wordy: "in order to" -> "to"
[WARNING] Wordy: "due to the fact that" -> "because"
[WARNING] Wordy: "prior to" -> "before"
[WARNING] Wordy: "it should be noted that" -> delete, just state it
[WARNING] Wordy: "at this point in time" -> "now"
[WARNING] Wordy: "a large number of" -> "many"
[WARNING] Wordy: "functionality" -> "features" or "capabilities"
[WARNING] Wordy: "subsequent to" -> "after"
[WARNING] Wordy: "Simply install" trivializes complexity
[WARNING] Em Dash: 2 em dashes found, replace with commas or periods
[WARNING] Link: "click here" - use descriptive link text
```

**INFO (2):**

```
[INFO] Inclusive Language: "master node" -> "control plane node"
[INFO] Inclusive Language: "whitelist" -> "allowlist"
```

**SUMMARY: 13 errors, 16+ warnings, 2 info. Verdict: Needs significant rework.**

### After `/style-fix`

```
Red Hat OpenShift AI now uses NVIDIA GPU technology for inference serving 
with llm-d, a Kubernetes-native serving framework that handles model 
deployment at scale.

Red Hat Enterprise Linux (RHEL) provides the foundation, while Kubernetes 
handles orchestration. Red Hat Ansible Automation Platform (AAP) automates 
the ML pipeline. The platform can deploy models from InstructLab and the 
Granite family on Podman or Red Hat OpenShift Container Platform (OCP) 
clusters to provide AI inference performance, because the architecture 
supports horizontal scaling across multiple GPU nodes.

Teams can use Azure Red Hat OpenShift (ARO) or Red Hat OpenShift Service 
on AWS (ROSA) to run workloads in the cloud. The platform enables 
organizations to put their AI investments into production. Install the 
operator and configure the serving runtime. The process takes about 15 
minutes. For on-premises infrastructure, see the Red Hat OpenStack 
Platform documentation.

For more information, see the deployment documentation. Before deploying, 
install GPU drivers after the OS installation. Many models are currently 
supported, including Llama, Mistral, and Mixtral architectures. The 
control plane node coordinates workload scheduling across the allowlist 
of approved GPU nodes.
```

**Score: 24/100 (before) to 91/100 (after).**

## Typical workflow

1. **Write your draft.** Do not worry about style while writing.
2. **Run `/style-score`** to see where you stand.
3. **Run `/style-fix`** to auto-correct most issues.
4. **Run `/style-check`** to review any remaining findings that need human judgment.
5. **Before opening a PR**, run `/style-diff main` to catch any issues in your changes.
6. **If the checker flags something intentional**, run `/style-learn` to record the exception.

## Contributing

Open an issue or pull request if you spot a missing product name, a rule that needs updating, or a common mistake that should be covered.

## License

Apache-2.0
