# ai-bu-style-checker

You just wrote "Openshift" instead of "OpenShift" in a blog post that 10,000 people will read. The style checker catches that before they do.

## The problem

You know the rules. "OpenShift" has a capital S. First use needs the full name. You cannot write "Red Hat's." But you are juggling a deadline, three reviews, and a draft that is already late. You forget. Everybody forgets. And then you get the email.

This tool is a copy editor that has memorized every product name, every style rule, and every capitalization quirk in the Red Hat universe. It checks your content in seconds and tells you exactly what to fix, with the exact replacement text. No vague suggestions. No judgment. Just the fixes.

## What it catches

Here is a realistic draft with 30+ issues, followed by what the checker finds.

### Before (a draft with issues)

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

### What `/style-check` finds

**Fix before publishing (13 errors):**

```
[ERROR] "Red Hat's Openshift AI"
  Two problems: possessive "Red Hat's" and "Openshift" (lowercase s).
  Fix: "The Red Hat OpenShift AI"

[ERROR] "Nvidia GPU"
  "Nvidia" should be all caps.
  Fix: "NVIDIA GPU"

[ERROR] "RHEL provides"
  "RHEL" used without expansion on first use.
  Fix: "Red Hat Enterprise Linux (RHEL) provides"

[ERROR] "kubernetes handles"
  "kubernetes" must be capitalized in prose.
  Fix: "Kubernetes handles"

[ERROR] "AAP facilitates"
  "AAP" used without expansion on first use.
  Fix: "Red Hat Ansible Automation Platform (AAP) automates"

[ERROR] "InstructLAB"
  Wrong capitalization.
  Fix: "InstructLab"

[ERROR] "podman or OCP"
  "podman" must be capitalized in prose. "OCP" not expanded on first use.
  Fix: "Podman or Red Hat OpenShift Container Platform (OCP)"

[ERROR] "ARO or ROSA"
  Neither expanded on first use.
  Fix: "Azure Red Hat OpenShift (ARO) or Red Hat OpenShift Service on AWS (ROSA)"

[ERROR] "Red Hat Openstack"
  "Openstack" should be "OpenStack Platform."
  Fix: "Red Hat OpenStack Platform"

[ERROR] "the platform's"
  Possessive form of a Red Hat entity. Rephrase to avoid possessive.
  Fix: "The platform"

[ERROR] "mistral"
  Must be capitalized in prose.
  Fix: "Mistral"
```

**Would improve the piece (19 suggestions):**

```
[SUGGEST] "We're thrilled to announce" - just announce it
[SUGGEST] "cutting-edge" - marketing buzzword, remove or replace with specifics
[SUGGEST] "best-in-class" - marketing buzzword, state what makes it good
[SUGGEST] "next-generation" - marketing buzzword, describe what is new
[SUGGEST] "revolutionary" - marketing buzzword, let the facts speak
[SUGGEST] "seamless" - vague without evidence
[SUGGEST] "comprehensive" - vague filler
[SUGGEST] "world-class" - marketing buzzword
[SUGGEST] "enterprise-grade" - vague without specifics
[SUGGEST] "unlock the full value" - marketing language
[SUGGEST] "leverages" -> "uses"
[SUGGEST] "utilizes" -> "uses"
[SUGGEST] "facilitate" -> "automates" or "enables"
[SUGGEST] "is able to" -> "can"
[SUGGEST] "in order to" -> "to"
[SUGGEST] "due to the fact that" -> "because"
[SUGGEST] "prior to" -> "before"
[SUGGEST] "it should be noted that" -> just state it
[SUGGEST] "at this point in time" -> "now"
[SUGGEST] "a large number of" -> "many"
[SUGGEST] "functionality" -> "features" or "capabilities"
[SUGGEST] "subsequent to" -> "after"
[SUGGEST] "Simply install" - trivializes complexity
[SUGGEST] 2 em dashes found, replace with commas or periods
[SUGGEST] "click here" - use descriptive link text
```

**Style preference (2 optional):**

```
[OPTIONAL] "master node" -> "control plane node" (inclusive language)
[OPTIONAL] "whitelist" -> "allowlist" (inclusive language)
```

**Summary: 13 items to fix, 25 suggestions, 2 optional. The product names are the priority.**

### After `/style-fix`

```
Red Hat OpenShift AI now uses NVIDIA GPU technology for inference serving
with llm-d, a Kubernetes-native serving framework that handles model
deployment at scale.

Red Hat Enterprise Linux (RHEL) provides the foundation, while Kubernetes
handles orchestration. Red Hat Ansible Automation Platform (AAP) automates
the ML pipeline. The platform can deploy models from InstructLab and the
Granite family on Podman or Red Hat OpenShift Container Platform (OCP)
clusters. The architecture supports horizontal scaling across multiple
GPU nodes.

Teams can use Azure Red Hat OpenShift (ARO) or Red Hat OpenShift Service
on AWS (ROSA) to run workloads in the cloud. Install the operator and
configure the serving runtime. The process takes about 15 minutes. For
on-premises infrastructure, see the Red Hat OpenStack Platform
documentation.

Before deploying, install GPU drivers after the OS installation. Many
models are supported, including Llama, Mistral, and Mixtral architectures.
The control plane node coordinates workload scheduling across the
allowlist of approved GPU nodes.
```

**Score: 24/100 (before) to 91/100 (after).**

## Installation

```bash
git clone https://github.com/MarkellR-RedHat/ai-bu-style-checker.git
cd ai-bu-style-checker
bash install.sh
```

This copies 8 command files and 2 reference files to `~/.claude/commands/` so they are available as slash commands in Claude Code.

## Commands

### Core commands

#### `/style-check <file|text>` - Find issues without changing anything

Reports every style issue grouped by priority: fix before publishing, would improve the piece, and style preference. Each finding includes the exact text to change and the exact replacement.

```
/style-check path/to/document.md
/style-check "Red Hat's Openshift platform utilizes cutting-edge technology"
```

#### `/style-fix <file|text>` - Apply fixes automatically

Applies all corrections directly. For file paths, edits the file in place. For pasted text, outputs the corrected version. Produces a clean diff you can review in 30 seconds.

```
/style-fix path/to/document.md
```

#### `/style-score <file|text>` - Score your draft

Scores content out of 100 across five weighted categories. Tells you exactly where you stand, what to fix first, and what you are already doing well.

```
/style-score path/to/document.md
```

#### `/tone-check <file|text>` - Check your voice

Rates content on a 5-point scale from engineering blog (target) to press release (avoid). Red Hat engineers talk like engineers. If a sentence could appear in any company's blog, it's not Red Hat enough.

```
/tone-check path/to/document.md
```

### Workflow commands

#### `/style-batch <path|glob>` - Check a whole directory

Checks every file and produces a dashboard with aggregate statistics, a prioritized list of worst offenders, and per-file reports.

```
/style-batch docs/
/style-batch content/**/*.md
```

#### `/style-diff <branch>` - Check only your changes

Checks only the lines you changed in a git diff. Pre-existing issues are not your problem. This is the pre-PR check.

```
/style-diff main
/style-diff origin/main
/style-diff HEAD~3
/style-diff --staged
```

#### `/style-compare <old> <new>` - Compare versions

Shows which issues were fixed, which were introduced, and the score delta between two versions.

```
/style-compare old-draft.md new-draft.md
/style-compare HEAD~1 path/to/file.md
/style-compare path/to/file.md
```

#### `/style-learn <exception>` - Record exceptions

When the checker flags something that is intentionally correct for your project, record an exception so future checks skip it.

```
/style-learn "Konflux is a real product name, don't flag it"
/style-learn "GPU doesn't need expansion for our ML engineering audience"
/style-learn list
/style-learn remove GPU
```

Exceptions are stored in `.style-exceptions.yml` in your project root. Non-negotiable rules (product name capitalization, no possessive "Red Hat's," no "RH" abbreviation) cannot be overridden.

## Typical workflow

1. **Write your draft.** Do not worry about style while writing.
2. **Run `/style-score`** to see where you stand.
3. **Run `/style-fix`** to auto-correct most issues.
4. **Run `/style-check`** to review any remaining findings that need human judgment.
5. **Before opening a PR**, run `/style-diff main` to catch issues in your changes.
6. **If the checker flags something intentional**, run `/style-learn` to record the exception.

## Reference files

The `reference/` directory contains two comprehensive guides that power the checker:

- **`reference/product-names.md`**: 250+ product names covering Red Hat products, NVIDIA/Intel/AMD/AWS/Azure/GCP/IBM partner products, open source AI/ML tools (vLLM, PyTorch, Hugging Face, Ray, KServe), and the full Kubernetes ecosystem. Each entry includes the official name, acceptable abbreviations, and common mistakes.

- **`reference/style-guide.md`**: Complete Red Hat writing style guide with voice principles, heading conventions, list formatting, code block conventions, link text best practices, inclusive language guide, technical writing patterns, and AI/ML-specific terminology.

## Contributing

Open an issue or pull request if you spot a missing product name, a rule that needs updating, or a common mistake that should be covered.

## License

Apache-2.0
