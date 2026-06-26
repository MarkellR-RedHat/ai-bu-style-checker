# ai-bu-style-checker

**You wrote "Openshift" in a blog post 10,000 people will read. The style checker catches it before they do.**

## The problem

You know the rules. "OpenShift" has a capital S. First mention needs the full product name. You cannot write "Red Hat's." But you are juggling a deadline, three reviews, and a draft that is already late. You forget. Everyone forgets. Then you get the email.

## Quick start

```bash
git clone https://github.com/MarkellR-RedHat/ai-bu-style-checker.git
cd ai-bu-style-checker
bash install.sh
```

Then in any Claude Code session:

```
/style-check path/to/your-doc.md
```

That's it. You get a prioritized list of every product name, capitalization, and style issue, with exact replacement text for each one.

## Before and after

Here is a realistic draft with 30+ issues, followed by what the checker produces.

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

## Commands

| Command | What it does |
|---------|-------------|
| `/style-check <file\|text>` | Find every style issue. Reports errors, suggestions, and optional fixes with exact replacement text. |
| `/style-fix <file\|text>` | Apply all corrections. Edits the file in place and produces a clean diff. |
| `/style-score <file\|text>` | Score your draft 0-100 across five categories. Shows what to fix first. |
| `/tone-check <file\|text>` | Rate your voice on a 5-point scale from engineering blog (good) to press release (bad). |
| `/style-batch <path\|glob>` | Check every file in a directory. Dashboard with aggregate stats and worst offenders. |
| `/style-diff <branch>` | Check only lines you changed. Pre-PR gate that ignores pre-existing issues. |
| `/style-compare <old> <new>` | Compare two versions. Shows fixed issues, new issues, and score delta. |
| `/style-learn <exception>` | Record a project-specific exception so future checks skip it. |

## Typical workflow

1. **Write your draft.** Do not worry about style while writing.
2. **Run `/style-score`** to see where you stand.
3. **Run `/style-fix`** to auto-correct most issues.
4. **Run `/style-check`** to review any remaining findings that need human judgment.
5. **Before opening a PR**, run `/style-diff main` to catch issues in your changes only.
6. **If the checker flags something intentional**, run `/style-learn` to record the exception.

### The shortcut that saves the most time

Run `/style-fix` first, then `/style-score`. Not the other way around. Most teams start with scoring, see a 45, get discouraged, and start manually editing. If you let `/style-fix` handle the mechanical corrections first (product names, wordy phrases, em dashes), you typically jump from the 40s to the 70s in under a minute. Then you only need to manually rewrite the 3-5 findings that require human judgment to clear 90.

## Reference files

The `reference/` directory contains two guides that power the checker:

- **`reference/product-names.md`**: 250+ product names with correct capitalization, acceptable abbreviations, and common mistakes. Covers Red Hat products, NVIDIA/Intel/AMD/AWS/Azure/GCP/IBM partner products, open source AI/ML tools, and the Kubernetes ecosystem.

- **`reference/style-guide.md`**: Red Hat writing style rules covering voice, headings, lists, code blocks, link text, inclusive language, technical patterns, and AI/ML terminology.

## Works well with

Style checking is one step in the writing workflow. These other tools in the AI BU suite handle the rest:

- **`/review-as-persona`** gets a technical accuracy review from a specific persona (SRE, PM, customer). Run it after style-fix to catch factual issues that style rules do not cover.
- **`/message-polisher`** tightens Slack messages, emails, and short-form content where a full style check is overkill.
- **`/cfp-generator`** builds conference proposals. Run `/style-check` on the abstract before submitting.
- **`/slide-outliner`** structures talks. Run `/tone-check` on your speaker notes to make sure they sound like an engineer, not a press release.

See the full suite at [github.com/MarkellR-RedHat](https://github.com/MarkellR-RedHat).

## Contributing

Open an issue or pull request if you spot a missing product name, a rule that needs updating, or a common mistake that should be covered.

## License

Apache-2.0
