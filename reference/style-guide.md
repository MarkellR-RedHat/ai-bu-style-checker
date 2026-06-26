# Red Hat AI BU writing style guide

A practical reference for writing content that follows Red Hat conventions, with additional guidance specific to AI Business Unit content. This guide covers the most common issues. For the full guide, see the official Red Hat Style Guide.

---

## Table of contents

1. [Red Hat voice principles](#red-hat-voice-principles)
2. [Product names](#product-names)
3. [Grammar and style](#grammar-and-style)
4. [Heading conventions](#heading-conventions)
5. [List formatting](#list-formatting)
6. [Code block conventions](#code-block-conventions)
7. [Link text best practices](#link-text-best-practices)
8. [Punctuation](#punctuation)
9. [Words and phrases to fix](#words-and-phrases-to-fix)
10. [Inclusive language guide](#inclusive-language-guide)
11. [Numbers and units](#numbers-and-units)
12. [Abbreviations and acronyms](#abbreviations-and-acronyms)
13. [Technical writing patterns](#technical-writing-patterns)
14. [Common style traps in AI/ML content](#common-style-traps-in-aiml-content)

---

## Red Hat voice principles

Red Hat content should sound like a smart colleague explaining something clearly. Not a marketer. Not a robot. Not a professor trying to impress. Every sentence should earn its place.

### 1. Direct

**Definition:** Say what you mean without hedging, filler, or unnecessary qualifiers.

**Good:** "This feature requires OpenShift 4.14 or later. Earlier versions do not support it."

**Bad:** "It should be noted that this particular feature may potentially require OpenShift 4.14 or later — earlier versions might not necessarily support it in all cases."

**Why it matters:** Hedging wastes the reader's time and erodes trust. If you are not confident enough to state something directly, research it until you are.

### 2. Confident

**Definition:** Write with authority. Present information as fact, not as opinion or speculation.

**Good:** "llm-d reduces inference latency by routing requests to the optimal engine in the pool. In benchmark testing, p99 latency dropped 40% compared to round-robin routing."

**Bad:** "We believe llm-d can probably help reduce inference latency. It seems like it should be able to route requests more efficiently, which we think could potentially lead to better performance — though results may vary."

**Why it matters:** Readers trust documentation that speaks with authority. If you do not know something, find out. If something is uncertain, say so once, clearly, and move on.

### 3. Technically precise

**Definition:** Get details right. Use correct terminology, accurate version numbers, and precise descriptions.

**Good:** "Red Hat OpenShift AI 2.16 supports serving models with vLLM 0.6.x on NVIDIA A100 and H100 GPUs. AMD Instinct MI300X support is available as a Technology Preview."

**Bad:** "OpenShift AI supports serving models on the latest GPUs using popular inference engines."

**Why it matters:** Your audience includes engineers who will test your claims against reality. Vague statements force them to look elsewhere for the specifics they need. Precision builds credibility.

### 4. Accessible

**Definition:** Write for smart readers who may not be domain experts. Define terms on first use and build context before diving into details.

**Good:** "A LoRA adapter is a small, trainable layer added on top of a frozen base model. Instead of retraining the entire model (which can take days and cost thousands of dollars in compute), LoRA trains only these adapter layers. The result is a specialized model that required a fraction of the compute."

**Bad:** "Apply the LoRA adapter to the base model via PEFT and merge weights using the `merge_and_unload()` method."

**Why it matters:** Even expert readers benefit from context. A Kubernetes engineer evaluating your AI product may not know ML terminology. An ML engineer may not know Kubernetes. Meet both of them where they are.

### 5. Honest

**Definition:** Do not oversell. Do not use empty superlatives. Describe what the product does, not how amazing it is.

**Good:** "llm-d is a Kubernetes-native inference gateway. It routes requests across a pool of model-serving engines based on real-time metrics like KV-cache utilization and queue depth."

**Bad:** "llm-d is a revolutionary, best-in-class inference gateway that delivers unprecedented performance and represents a paradigm shift in how enterprises approach AI workloads."

**Why it matters:** Overselling triggers skepticism. Engineers and technical decision-makers trust content that lets the technology speak for itself. If the product is good, the facts are enough.

### 6. Community-minded

**Definition:** Acknowledge open source roots and upstream projects. Give credit where credit is due.

**Good:** "Red Hat OpenShift AI uses vLLM, an open source inference engine, for high-throughput model serving. Red Hat contributes to the vLLM project and packages a supported, tested distribution for enterprise use."

**Bad:** "Red Hat's proprietary AI serving technology powers enterprise inference workloads with our advanced engine."

**Why it matters:** Red Hat exists because of open source. Claiming credit for community work damages trust with the upstream communities that make Red Hat products possible. Always name the upstream project and describe what Red Hat adds on top of it.

### What to avoid

- "Best-in-class," "world-class," "cutting-edge," "next-generation," "revolutionary," "game-changing"
- "Leverage" (as a verb), "utilize," "synergy," "paradigm shift," "unlock value"
- "We're excited to announce" or "We're thrilled" (just announce it)
- "Simply," "just," "easy" (what is simple for you may not be simple for the reader)
- "Designed to" without saying what it actually does (vague filler)
- Stacking multiple adjectives before a noun ("our powerful, flexible, scalable, enterprise-grade solution")

---

## Product names

See `reference/product-names.md` for the full list. Key rules:

1. **First use**: Full official name with abbreviation in parentheses.
2. **After first use**: Short name or abbreviation is fine.
3. **"Red Hat" prefix**: Required on first use for most products.
4. **Capitalization**: Match the official spelling exactly (OpenShift, not Openshift).
5. **No "RH"**: Never abbreviate "Red Hat" to "RH" in external content.
6. **No possessive**: Never write "Red Hat's." Write "the Red Hat" instead. Example: "the Red Hat approach to open source," not "Red Hat's approach to open source."

---

## Grammar and style

### Active voice

Prefer active voice. Passive voice is acceptable when the actor is unknown or unimportant, but do not default to it.

- **Passive**: "The cluster is managed by the operator."
- **Active**: "The operator manages the cluster."
- **Passive**: "The model can be deployed by using the CLI."
- **Active**: "Deploy the model using the CLI."

### Good vs. bad: technical writing

**Bad:** "It should be noted that the configuration file must be updated prior to the deployment being initiated, due to the fact that the system utilizes the settings at startup time in order to facilitate proper initialization."

**Good:** "Update the configuration file before you deploy. The system reads these settings at startup."

**Bad:** "Red Hat's Openshift platform provides a comprehensive, best-in-class container orchestration solution that leverages the power of kubernetes to deliver next-generation application deployment capabilities."

**Good:** "Red Hat OpenShift Container Platform manages containers on Kubernetes. It handles builds, deployments, scaling, and networking so your team can focus on writing code."

### Sentence length

Keep sentences concise. If a sentence runs past 25 words, consider breaking it up. Short sentences are easier to read, translate, and understand.

### Paragraph length

Break up walls of text. A paragraph should cover one idea. If you are writing more than 4-5 sentences in a paragraph, look for a natural break point.

### Good vs. bad: structure

**Bad (wall of text):** "OpenShift supports multiple deployment strategies including rolling updates and blue-green deployments and canary releases and you can configure each one using the deployment configuration object which allows you to specify the strategy type and parameters and hooks and you can also use the web console to monitor the progress of your deployments and roll back if something goes wrong."

**Good (structured):** "OpenShift supports multiple deployment strategies:

- **Rolling updates** replace pods gradually with zero downtime.
- **Blue-green deployments** run two identical environments and switch traffic between them.
- **Canary releases** route a small percentage of traffic to the new version before full rollout.

Configure these strategies in the deployment configuration object. Use the web console to monitor progress and roll back if needed."

---

## Heading conventions

### Use sentence case

Capitalize only the first word and proper nouns. This applies to all headings at every level.

**Good:**
- "Getting started with OpenShift AI"
- "Configure TLS certificates for the inference endpoint"
- "Known issues in version 2.16"

**Bad:**
- "Getting Started With OpenShift AI"
- "Configure TLS Certificates For The Inference Endpoint"
- "Known Issues In Version 2.16"

The only exception is a proper noun that is always capitalized, such as "Kubernetes," "OpenShift," or "NVIDIA."

### Heading hierarchy

Do not skip heading levels. If the previous heading was `##`, the next sub-heading must be `###`, not `####`.

**Good:**

```
## Installing the operator
### Prerequisites
### Procedure
#### Configuring storage
```

**Bad:**

```
## Installing the operator
#### Prerequisites
### Procedure
###### Configuring storage
```

Skipping levels breaks accessibility tools (screen readers rely on heading hierarchy to navigate) and produces inconsistent visual formatting.

### Make headings descriptive and task-oriented

Headings should tell the reader what they will learn or do in the section. Avoid vague, one-word headings.

**Good:**
- "Configuring GPU resource limits for inference pods"
- "Troubleshooting failed model deployments"
- "How the routing algorithm selects an engine"

**Bad:**
- "Configuration"
- "Troubleshooting"
- "Overview"

### Maximum heading length

Keep headings under 80 characters. If a heading is long enough to wrap, it needs editing. A heading is a signpost, not a summary.

### Gerunds vs. imperative in headings

Use gerunds ("Configuring," "Installing," "Deploying") for conceptual or guide-level sections that describe an ongoing activity.

Use imperative ("Configure," "Install," "Deploy") for procedure headings where the reader will follow specific steps.

**Gerund (conceptual):**
- "Configuring network policies for model serving"
- "Understanding the inference routing architecture"

**Imperative (procedural):**
- "Configure network policies for model serving"
- "Install the vLLM serving runtime"

If you are writing a procedure with numbered steps, use imperative. If you are writing an explanatory section that a reader may skim without following steps, use a gerund.

---

## List formatting

### When to use bulleted vs. numbered lists

Use **bulleted lists** when items have no required order. Examples: feature lists, supported platforms, configuration options.

Use **numbered lists** when order matters. Examples: procedural steps, ranked items, sequences of events.

**Good (bulleted, no inherent order):**

The following GPU models are supported:

- NVIDIA A100
- NVIDIA H100
- AMD Instinct MI300X

**Good (numbered, order matters):**

To deploy a model:

1. Create a namespace for your project.
2. Apply the `ServingRuntime` custom resource.
3. Create an `InferenceService` that references the runtime.
4. Verify the endpoint with a test request.

**Bad (numbered, but order does not matter):**

Supported features:

1. Multi-model serving
2. Autoscaling
3. Token-level streaming

Use a bulleted list here because there is no meaningful sequence.

### Parallel construction

Every item in a list must follow the same grammatical pattern. If the first item starts with a verb, all items must start with a verb. If the first item is a noun phrase, all items must be noun phrases.

**Good (all start with verbs):**

Before you begin:

- Install the OpenShift CLI (`oc`).
- Log in to your cluster as a user with `cluster-admin` privileges.
- Verify that the GPU operator is running.

**Bad (mixed construction):**

Before you begin:

- Install the OpenShift CLI (`oc`).
- You should be logged in to your cluster as a user with `cluster-admin` privileges.
- GPU operator running.

### Punctuation in lists

Use **periods** at the end of list items if any item is a complete sentence. If all items are sentence fragments (short noun phrases, for example), omit periods.

**Periods (complete sentences):**

- The operator watches for new `InferenceService` resources in the namespace.
- When it detects one, it creates the necessary pods and services.
- Health checks run every 30 seconds after the pods start.

**No periods (fragments):**

Supported inference engines:

- vLLM
- text-generation-inference (TGI)
- llama.cpp

If a list mixes fragments and sentences, rewrite it so all items are the same type.

### Lead-in sentences

Every list must have an introductory sentence or phrase. Never start a list without context.

**Good:**

The following environment variables configure the serving runtime:

- `MODEL_NAME`: The name of the model to load.
- `TENSOR_PARALLEL_SIZE`: The number of GPUs for tensor parallelism.
- `MAX_MODEL_LEN`: The maximum sequence length in tokens.

**Bad:**

- `MODEL_NAME`: The name of the model to load.
- `TENSOR_PARALLEL_SIZE`: The number of GPUs for tensor parallelism.
- `MAX_MODEL_LEN`: The maximum sequence length in tokens.

(The reader has no idea what these variables are for or where they apply.)

### Nested lists

Avoid nesting lists more than two levels deep. If you need a third level, restructure the content. Deeply nested lists are hard to scan and often indicate that the content should be reorganized into subsections.

**Acceptable (two levels):**

- Serving runtimes
  - vLLM
  - text-generation-inference
- Model formats
  - Safetensors
  - GGUF

**Too deep (three levels):**

- Serving runtimes
  - vLLM
    - GPU support
      - NVIDIA
      - AMD

Restructure content like this into separate sections or a table.

---

## Code block conventions

### Inline code vs. code blocks

Use **inline code** (backticks) for:

- Command names: `oc`, `kubectl`, `podman`
- File paths: `/etc/kubernetes/manifests/`
- Variable names: `MAX_MODEL_LEN`
- Short code references: `kind: InferenceService`
- Configuration values: `replicas: 3`
- Error messages mentioned in prose: `ImagePullBackOff`

Use **code blocks** for:

- Multi-line code or configuration
- Commands the reader should run
- Command output the reader should compare against
- API request and response examples

### Language hints

Always specify the language for syntax highlighting. This helps readers parse the code faster.

**Good:**

````
```yaml
apiVersion: serving.kserve.io/v1beta1
kind: InferenceService
metadata:
  name: llama-3-service
```
````

**Bad:**

````
```
apiVersion: serving.kserve.io/v1beta1
kind: InferenceService
metadata:
  name: llama-3-service
```
````

Common language hints: `yaml`, `json`, `bash`, `python`, `go`, `dockerfile`, `toml`, `ini`, `xml`.

### Command prompts

Use `$` to indicate a regular user prompt. Use `#` to indicate a root prompt. Place the prompt symbol before the command, separated by a space.

**Good:**

```bash
$ oc apply -f serving-runtime.yaml
```

```bash
# systemctl restart crio
```

**Bad:**

```bash
oc apply -f serving-runtime.yaml
```

Without a prompt indicator, the reader cannot tell whether the command requires elevated privileges.

### Placeholder conventions

Use angle brackets with `SCREAMING_SNAKE_CASE` for values the reader must replace. Explain each placeholder either inline or in a list below the code block.

**Good:**

```bash
$ oc login <API_URL> --token=<AUTH_TOKEN>
```

Replace the following values:

- `<API_URL>`: The URL of your OpenShift API server, for example `https://api.mycluster.example.com:6443`.
- `<AUTH_TOKEN>`: Your authentication token. Run `oc whoami -t` to retrieve it.

**Bad:**

```bash
$ oc login https://your-cluster-here --token=your-token-here
```

The reader may not realize which parts need replacing, or may try to type the literal string.

Also avoid these placeholder styles:

- `{API_URL}` (could be confused with bash variable expansion)
- `API_URL` without delimiters (invisible in context)
- `[API_URL]` (could be confused with optional arguments)

### Output vs. input distinction

When showing both a command and its output, make the distinction clear. Use a prompt symbol for the command and leave output lines without one.

**Good:**

```bash
$ oc get pods -n model-serving
NAME                          READY   STATUS    RESTARTS   AGE
llama-3-predictor-0           2/2     Running   0          5m
```

**Bad:**

```
oc get pods -n model-serving
NAME                          READY   STATUS    RESTARTS   AGE
llama-3-predictor-0           2/2     Running   0          5m
```

Without the `$` prompt, the reader cannot tell where the command ends and the output begins.

### Copy-paste readiness

Do not include line numbers, wrapping indicators, or prompt symbols in a way that breaks copy-paste. The reader should be able to select the command text and paste it into a terminal without editing.

**Good:**

```bash
$ oc apply -f - <<EOF
apiVersion: serving.kserve.io/v1beta1
kind: InferenceService
metadata:
  name: llama-3-service
spec:
  predictor:
    model:
      modelFormat:
        name: vLLM
EOF
```

**Bad (line numbers break paste):**

```
1  oc apply -f - <<EOF
2  apiVersion: serving.kserve.io/v1beta1
3  kind: InferenceService
4  metadata:
5    name: llama-3-service
6  EOF
```

---

## Link text best practices

### Never use "click here"

Link text must describe the destination, not the action. "Click here" and "this link" provide no information when read out of context (for example, by a screen reader listing all links on the page).

**Good:** "For installation steps, see [Installing the OpenShift AI operator](https://example.com)."

**Bad:** "For installation steps, [click here](https://example.com)."

**Good:** "The [vLLM documentation](https://docs.vllm.ai/) covers advanced configuration options."

**Bad:** "For advanced configuration, see [this link](https://docs.vllm.ai/)."

### Make link text meaningful out of context

Screen readers let users navigate by jumping from link to link. If every link says "here" or "documentation," the user hears a list of identical words. Link text should make sense without the surrounding sentence.

**Good:**
- [Red Hat OpenShift AI release notes](https://example.com)
- [Configuring GPU sharing with MPS](https://example.com)
- [KServe InferenceService API reference](https://example.com)

**Bad:**
- [link](https://example.com)
- [more information](https://example.com)
- [read more](https://example.com)

### Describe the destination, not the action

Link text should tell the reader where they will end up, not what they should do with their mouse.

**Good:** "See the [OpenShift Container Platform documentation](https://example.com) for cluster administration details."

**Bad:** "See the OpenShift Container Platform documentation [here](https://example.com) for cluster administration details."

### Avoid bare URLs in prose

Do not paste raw URLs into sentences. Always use descriptive link text. Bare URLs are hard to read, hard to pronounce for screen readers, and often meaningless to the reader.

**Good:** "Review the [upstream vLLM benchmarks](https://github.com/vllm-project/vllm/tree/main/benchmarks) before running your own tests."

**Bad:** "Review the upstream vLLM benchmarks at https://github.com/vllm-project/vllm/tree/main/benchmarks before running your own tests."

The one exception is documentation that teaches the reader to use a URL directly, for example: "Open `https://console.redhat.com` in your browser."

### Inline links vs. reference-style links

In Markdown, prefer inline links for most content because they are easier to maintain and review in diffs.

Use reference-style links when:

- A URL is very long and makes the source hard to read.
- The same URL appears multiple times in a document.

**Inline (preferred for most cases):**

```markdown
See the [OpenShift AI documentation](https://docs.openshift.com/ai/) for details.
```

**Reference-style (long or repeated URLs):**

```markdown
See the [OpenShift AI documentation][oai-docs] for details.

[oai-docs]: https://docs.openshift.com/ai/latest/serving/serving-large-models.html
```

---

## Punctuation

### Em dashes

This team does not use em dashes. Replace them with:

- **Commas** for parenthetical information
- **Periods** to break a sentence into two
- **Parentheses** for brief asides
- **"and" or "or"** to connect related ideas

**Bad:** "The model — which was fine-tuned on domain-specific data — outperformed the baseline."

**Good:** "The model, which was fine-tuned on domain-specific data, outperformed the baseline."

**Bad:** "llm-d supports two routing modes — least-load and prefix-aware."

**Good:** "llm-d supports two routing modes: least-load and prefix-aware."

### Serial comma

Use the serial (Oxford) comma. Write "containers, virtual machines, and bare metal," not "containers, virtual machines and bare metal."

### Hyphens

- Hyphenate compound modifiers before a noun: "open-source project," "command-line tool"
- Do not hyphenate after a noun: "the project is open source," "use the command line"
- Do not hyphenate adverbs ending in -ly: "newly created cluster," not "newly-created cluster"

### Colons

Use a colon to introduce a list, a code block, or an explanation. The word before the colon must complete a grammatical sentence.

**Good:** "The following tools are required:"

**Bad:** "The required tools are such as:"

Capitalize the first word after a colon only if it starts a complete sentence.

### Semicolons

Avoid semicolons in technical writing. They slow readers down. Use a period and start a new sentence instead.

### Quotation marks

Use double quotation marks for terms used in a special or ironic sense. Do not use quotation marks for emphasis (use bold instead). Place commas and periods inside quotation marks.

---

## Words and phrases to fix

| Do not write | Write instead |
|---|---|
| utilize | use |
| leverage (verb) | use |
| in order to | to |
| at this point in time | now |
| due to the fact that | because |
| a large number of | many |
| is able to | can |
| in the event that | if |
| prior to | before |
| subsequent to | after |
| facilitate | help, enable |
| implement (when you mean "use") | use |
| functionality | feature, capability |
| it should be noted that | (delete it, just state the note) |
| it is important to note | (delete it, just state the note) |
| as per | according to, following |
| going forward | (delete it, or use "from now on" if needed) |
| at the end of the day | (delete it) |
| reach out to | contact |
| circle back | follow up |
| deep dive | detailed analysis, thorough review |
| low-hanging fruit | quick wins, easy improvements |
| move the needle | improve, increase |
| net-net | in summary, the result |
| take it offline | discuss separately |
| touch base | check in, follow up |
| boil the ocean | attempt too much |
| robust (when vague) | (be specific about what makes it robust) |
| seamless (when vague) | (be specific about the integration) |
| scalable (without details) | (say how it scales and to what limits) |

---

## Inclusive language guide

Red Hat is committed to using inclusive language across all content. This is not about being "politically correct." It is about writing clearly and not alienating parts of your audience with unnecessary metaphors or assumptions.

### Terminology replacements

| Do not use | Use instead | Notes |
|---|---|---|
| whitelist / blacklist | allowlist / blocklist | These replacements are now standard across the industry. |
| master / slave | primary / replica, leader / follower, controller / worker | Choose the pair that best fits the technical context. |
| master branch | main branch | Git changed its default in 2020. Use `main`. |
| sanity check | quick check, validity check, confidence check | |
| dummy value | placeholder value, sample value, example value | |
| cripple, crippled | disable, degrade, impair, limit | |
| grandfathered | legacy, pre-existing, exempt | |
| man-in-the-middle | on-path attack, machine-in-the-middle, interceptor attack | NIST updated this term. |
| native (as in "cloud-native") | Acceptable when used as a technical term. Avoid as a metaphor for "natural" or "innate." | |

### Gender-neutral language

Use "they/them/their" as singular pronouns when referring to a person whose gender is unknown or irrelevant.

**Good:** "When a user logs in, they see their dashboard."

**Bad:** "When a user logs in, he sees his dashboard."

Avoid gendered terms for roles:

| Do not use | Use instead |
|---|---|
| manpower | workforce, staffing, personnel |
| man-hours | person-hours, labor hours |
| chairman | chairperson, chair |
| guys (when addressing a group) | everyone, team, folks |

### Ability-related language

Do not use disability as a metaphor for something broken or inferior.

| Do not use | Use instead |
|---|---|
| blind spot | gap, oversight, unexamined area |
| tone-deaf | unaware, insensitive, out of touch |
| crippling bug | severe bug, critical bug |
| lame | weak, inadequate, unconvincing |
| turn a blind eye | ignore, overlook, disregard |
| falling on deaf ears | being ignored, going unheard |

When writing about accessibility features, use precise language. "Screen reader support" is better than "support for the blind."

### Cultural sensitivity

Avoid idioms and metaphors rooted in specific cultural contexts that may not translate well or may carry unintended weight.

| Do not use | Use instead |
|---|---|
| spirit animal | favorite, go-to, preferred |
| guru | expert, specialist |
| tribe | team, group, community |
| powwow | meeting, discussion |
| first-class citizen | first-class object, fully supported, top-level |

### Age-related terms

Do not use age as a proxy for quality or relevance.

| Do not use | Use instead |
|---|---|
| old (for software) | legacy, previous-generation, earlier version |
| young project | new project, early-stage project |
| mature product | stable product, established product, production-ready product |

### Violence-related metaphors

Avoid violent metaphors in technical writing. They are rarely the clearest way to describe what is happening.

| Do not use | Use instead |
|---|---|
| kill (a process) | stop, terminate, end | `kill` is acceptable in direct reference to the Unix command. |
| nuke (data) | delete, remove, wipe |
| war room | operations center, incident room |
| bullet-proof | reliable, hardened, resilient |
| hit list | priority list, task list |
| target (people) | focus on, prioritize, reach |
| execute (a plan) | carry out, run, implement | `execute` is acceptable when referring to running a binary. |
| bomb, explode | fail, crash, produce errors |

---

## Numbers and units

### Basic rules

- Spell out numbers zero through nine. Use numerals for 10 and above.
- **Exception:** Always use numerals with units: 4 GB, 2 CPUs, 8 nodes, 3 replicas.
- **Exception:** Always use numerals in technical contexts like version numbers, table data, and code references.
- Use commas in numbers over 999: 1,000 and 10,000 and 1,000,000.

### Ranges

In prose, use "to" for ranges, not dashes.

**Good:** "The cluster scales from 3 to 12 nodes based on demand."

**Bad:** "The cluster scales from 3-12 nodes based on demand."

In tables and compact UI text, dashes are acceptable for ranges: "3-12 nodes."

### Percentages

Use the numeral and the `%` symbol in technical content. Spell out "percent" in narrative prose if it reads better.

**Good:** "Latency decreased by 35%."

**Good:** "About forty percent of respondents preferred option A." (narrative context)

**Bad:** "Latency decreased by thirty-five %."

### Version numbers

Always use numerals for version numbers. Do not spell them out.

**Good:** "Red Hat OpenShift AI version 2.16"

**Bad:** "Red Hat OpenShift AI version two point sixteen"

When a version has a code name, include it in parentheses on first mention if it is commonly known, then use either the number or the name consistently.

### File sizes

Use binary units (KiB, MiB, GiB, TiB) when precision matters, such as memory allocation and disk partitioning. Use SI units (KB, MB, GB, TB) for approximate or marketing contexts.

| Context | Write | Meaning |
|---|---|---|
| Memory allocation | 16 GiB | Exactly 17,179,869,184 bytes |
| Approximate file size | 2.5 GB | Approximately 2,500,000,000 bytes |
| Model weights | 70 GB | Approximate total size |
| Disk partition | 100 GiB | Exactly 107,374,182,400 bytes |

Always put a space between the number and the unit: "16 GiB," not "16GiB."

### Time durations

Spell out time units in prose. Use abbreviations in tables, logs, and compact displays.

**Prose:** "The health check runs every 30 seconds."

**Table/compact:** "30s," "5m," "2h"

Do not mix spelled-out and abbreviated forms in the same context.

---

## Abbreviations and acronyms

- Expand on first use: "Red Hat OpenShift Container Platform (OCP)"
- After first expansion, the acronym is fine on its own.
- Do not assume the reader knows what an acronym means.
- Some acronyms are so common they do not need expansion: HTTP, API, URL, CPU, RAM, GPU, DNS, SSH, TLS, IP, TCP, UDP. Use your judgment.
- If an abbreviation is used only once, do not introduce the abbreviation. Just use the full term.
- In headings, use the abbreviation if the term has already been expanded. If the heading is the first occurrence, expand the term in the first sentence of the section rather than in the heading itself.

---

## Technical writing patterns

### Procedures

Write procedures as numbered steps. Each step should contain one action. Do not combine multiple actions into a single step.

**Good:**

1. Log in to the OpenShift web console.
2. Navigate to **Operators** > **Installed Operators**.
3. Select **Red Hat OpenShift AI**.
4. Click the **ServingRuntime** tab.
5. Click **Create ServingRuntime**.

**Bad:**

1. Log in to the OpenShift web console and navigate to **Operators** > **Installed Operators**, then select **Red Hat OpenShift AI**.
2. Click the **ServingRuntime** tab and click **Create ServingRuntime**.

### Prerequisites

List prerequisites before the procedure, not inline. Use a bulleted list with a clear heading.

**Good:**

#### Prerequisites

- You have access to an OpenShift cluster running version 4.14 or later.
- You have `cluster-admin` privileges.
- The Node Feature Discovery Operator is installed.
- The NVIDIA GPU Operator is installed and at least one GPU node is available.

#### Procedure

1. Log in to the OpenShift web console.
2. ...

### Admonitions

Use admonitions sparingly. When everything is important, nothing is important. Follow this hierarchy:

**Tip:** Optional information that makes a task easier or faster. The reader can ignore it without consequence.

> **Tip:** You can use `oc apply -k` to apply multiple resources at once from a kustomization directory.

**Note:** Additional context that is useful but not critical. Clarifies behavior or provides background.

> **Note:** This feature is available only in Red Hat OpenShift AI 2.16 and later.

**Important:** Information the reader must know to avoid mistakes or unexpected behavior. Skipping it leads to a wrong result, not danger.

> **Important:** If you change the `modelFormat` after the initial deployment, you must delete and recreate the `InferenceService`.

**Warning:** Information about actions that could cause data loss, security exposure, or system damage. Use only for genuinely dangerous situations.

> **Warning:** Deleting the namespace removes all model data, including uploaded weights. This action cannot be undone.

Do not use more than two admonitions per page. If you need more, the content probably belongs in the procedure steps or prerequisites.

### API reference conventions

When documenting API endpoints:

- State the HTTP method and path first.
- List required and optional parameters in a table.
- Provide a request example and a response example.
- Document error responses that the user is likely to encounter.

**Example:**

#### Create a model deployment

```
POST /api/v1/deployments
```

**Request body parameters:**

| Parameter | Type | Required | Description |
|---|---|---|---|
| `model_name` | string | Yes | The name of the model to deploy. |
| `runtime` | string | Yes | The serving runtime to use. Valid values: `vllm`, `tgis`. |
| `replicas` | integer | No | The number of replicas. Default: `1`. |

**Example request:**

```bash
$ curl -X POST https://api.example.com/api/v1/deployments \
  -H "Authorization: Bearer <AUTH_TOKEN>" \
  -H "Content-Type: application/json" \
  -d '{
    "model_name": "llama-3-8b",
    "runtime": "vllm",
    "replicas": 2
  }'
```

**Example response:**

```json
{
  "id": "dep-abc123",
  "status": "creating",
  "model_name": "llama-3-8b",
  "runtime": "vllm",
  "replicas": 2
}
```

### Configuration file examples

When documenting configuration files:

- Show the complete, minimal example first.
- Annotate key fields with comments or a table.
- Specify the file name and path if applicable.
- Indicate which fields are required and which are optional.

### Error message documentation

When documenting errors:

- Show the exact error message the user sees.
- Explain what causes the error.
- Provide the fix as a procedure.

**Example:**

**Error:** `ImagePullBackOff: Back-off pulling image "registry.example.com/models/llama-3:latest"`

**Cause:** The cluster cannot pull the model image. This usually means the image pull secret is missing or the registry URL is incorrect.

**Solution:**

1. Verify that the image URL is correct:

   ```bash
   $ oc get inferenceservice <SERVICE_NAME> -o jsonpath='{.spec.predictor.model.storageUri}'
   ```

2. Check that the image pull secret exists in the namespace:

   ```bash
   $ oc get secrets -n <NAMESPACE> | grep pull
   ```

3. If the secret is missing, create it:

   ```bash
   $ oc create secret docker-registry model-registry-secret \
     --docker-server=<REGISTRY_URL> \
     --docker-username=<USERNAME> \
     --docker-password=<PASSWORD> \
     -n <NAMESPACE>
   ```

### Documenting CLI commands

When documenting CLI commands:

- Show the command with its most common flags.
- Explain each flag in a table or description list.
- Provide an example with realistic (but fake) output.

**Example:**

Use `oc get inferenceservice` to list all deployed models in a namespace:

```bash
$ oc get inferenceservice -n <NAMESPACE>
```

**Common flags:**

| Flag | Description |
|---|---|
| `-o wide` | Show additional columns including the URL and ready state. |
| `-o yaml` | Output the full resource definition in YAML format. |
| `--watch` | Stream updates as the resource status changes. |

**Example output:**

```
NAME              URL                                         READY   AGE
llama-3-8b        https://llama-3-8b.example.com              True    2h
mistral-7b        https://mistral-7b.example.com              True    45m
```

---

## Common style traps in AI/ML content

This section covers terminology decisions specific to AI Business Unit content. These rules resolve common inconsistencies and ambiguities.

### Acronym expansion rules for AI terms

Follow the standard first-use expansion rule for AI-specific acronyms:

| Term | First use | Subsequent uses |
|---|---|---|
| artificial intelligence | "artificial intelligence (AI)" | AI |
| machine learning | "machine learning (ML)" | ML |
| large language model | "large language model (LLM)" | LLM |
| graphics processing unit | Do not expand. GPU is universally understood in technical content. | GPU |
| retrieval-augmented generation | "retrieval-augmented generation (RAG)" | RAG |
| key-value cache | "key-value (KV) cache" | KV cache |
| reinforcement learning from human feedback | "reinforcement learning from human feedback (RLHF)" | RLHF |

### Model naming conventions

Use the official casing and spacing for model names. Do not invent your own capitalization.

| Correct | Incorrect |
|---|---|
| Llama 3.1 | LLAMA 3.1, llama 3.1, LLaMA 3.1 |
| Granite | GRANITE, granite |
| Mistral | MISTRAL, mistral |
| GPT-4 | GPT4, Gpt-4, gpt-4 |
| BERT | Bert, bert |
| Whisper | WHISPER, whisper |

When in doubt, check the model card or the upstream project's documentation for the canonical spelling.

### Inference vs. inferencing

Use "inference" as both a noun and a modifier. Avoid "inferencing."

**Good:**
- "Run inference on the model."
- "The inference endpoint is ready."
- "Inference latency is measured in milliseconds."

**Bad:**
- "Run inferencing on the model."
- "The inferencing endpoint is ready."

The word "inferencing" is not standard in either ML research or Red Hat documentation. Use "inference" or rephrase with "running inference" or "performing inference."

### Fine-tune and fine-tuning

"Fine-tune" is hyphenated as a verb. "Fine-tuning" is hyphenated as a gerund or adjective. "Fine-tuned" is hyphenated as a past participle.

**Good:**
- "Fine-tune the base model on your dataset." (verb)
- "Fine-tuning takes approximately 4 hours on 8 A100 GPUs." (gerund)
- "Deploy the fine-tuned model." (past participle)

**Bad:**
- "Finetune the base model." (missing hyphen)
- "Fine tune the base model." (missing hyphen)

### Real-time and real time

Hyphenate "real-time" when it appears before a noun (as a compound modifier). Write "real time" when it follows a verb.

**Good:**
- "The system provides real-time token streaming." (before noun)
- "Tokens are streamed in real time." (after verb)

**Bad:**
- "The system provides realtime token streaming."
- "Tokens are streamed in real-time."

### Benchmark reporting conventions

When reporting benchmark results, always include enough context for the reader to reproduce or fairly compare the results. At a minimum, include:

- **Hardware:** GPU model, count, and memory (for example, "8x NVIDIA A100 80 GB")
- **Batch size:** The batch size used during the test
- **Precision:** The numerical precision (FP16, BF16, FP8, INT8, INT4)
- **Model:** The exact model name and size (for example, "Llama 3.1 70B")
- **Software versions:** Inference engine version, CUDA version, driver version
- **Metric definition:** Define the metric if it is not universally standard

**Good:**

"On 8x NVIDIA H100 80 GB GPUs with vLLM 0.6.3 (CUDA 12.4), Llama 3.1 70B in BF16 precision achieved 14,200 output tokens per second at batch size 256, measured as the total tokens generated across all concurrent requests per wall-clock second."

**Bad:**

"Llama 3.1 achieved 14,200 tokens per second, showing excellent performance."

Without hardware, precision, batch size, and metric definition, this number is meaningless.

### Anthropomorphism to avoid

Do not attribute human thoughts, feelings, or intentions to models or software. Models are statistical systems. They do not think, know, understand, want, believe, or feel.

| Do not write | Write instead |
|---|---|
| The model thinks that... | The model predicts that..., The model outputs... |
| The AI knows how to... | The model is trained to..., The model can... |
| The model understands the context | The model processes the context, The model uses the context |
| The model wants to generate | The model generates, The model is configured to generate |
| The model learned that | The model was trained on data that..., During training, the model weights were updated to... |
| The model believes | The model outputs a high probability for... |
| The model is confused by | The model produces unexpected output for..., The model fails to correctly process... |
| The AI decided to | The system selected..., The routing algorithm chose... |
| The model sees the image | The model processes the image, The model receives the image as input |
| The model remembers | The model retains in its context window..., The KV cache stores... |

This is especially important in Red Hat content because anthropomorphism creates unrealistic expectations about what AI systems can do. Precise language helps users build accurate mental models of the technology.

### Other AI/ML terminology notes

- **Token:** Do not assume the reader knows what a token is. On first use, define it: "a token, the basic unit of text that a language model processes (roughly three-fourths of a word in English)."
- **Parameter count vs. model size:** Distinguish between parameter count (for example, "7 billion parameters") and on-disk model size (for example, "14 GB in FP16 precision"). These are different measurements.
- **Quantization:** When mentioning quantization, state the method and the resulting precision: "AWQ 4-bit quantization," not just "quantized."
- **Serving vs. deployment:** "Serving" means making a model available for inference requests. "Deployment" is a broader term that includes the infrastructure setup. Do not use them interchangeably if the distinction matters in context.
- **Prompt vs. input:** In user-facing content, "prompt" is acceptable. In API documentation, prefer "input" or "request" because the API accepts structured data, not just text prompts.
- **Hallucination:** Use this term carefully. On first use, define it: "a hallucination, an output that is factually incorrect or fabricated but presented with apparent confidence." Some style guides prefer "confabulation" or "fabricated output," but "hallucination" is the most widely recognized term in the field as of 2025.
