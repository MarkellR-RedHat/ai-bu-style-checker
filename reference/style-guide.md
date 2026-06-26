# Red Hat Writing Style Guide (Condensed)

A practical reference for writing content that follows Red Hat conventions. This guide covers the most common issues. For the full guide, see the official Red Hat Style Guide.

## Voice and Tone

- **Be direct.** Say what you mean. Avoid hedging and filler words.
- **Be confident.** Write with authority. If you are not sure about something, verify it before writing.
- **Be technically accurate.** Get the details right. Your audience notices when you do not.
- **Be accessible.** Write for a smart reader who may not be an expert in your specific area. Define terms on first use.
- **Be honest.** Do not oversell or use marketing buzzwords.

### What to Avoid

- "Best-in-class," "world-class," "cutting-edge," "next-generation"
- "Leverage" (as a verb), "utilize," "synergy," "paradigm shift"
- "We're excited to announce" or "We're thrilled" (just announce it)
- "Simply," "just," "easy" (what is simple for you may not be simple for the reader)

## Product Names

See `reference/product-names.md` for the full list. Key rules:

1. **First use**: Full official name with abbreviation in parentheses.
2. **After first use**: Short name or abbreviation is fine.
3. **"Red Hat" prefix**: Required on first use for most products.
4. **Capitalization**: Match the official spelling exactly (OpenShift, not Openshift).
5. **No "RH"**: Never abbreviate "Red Hat" to "RH" in external content.
6. **No possessive**: Never write "Red Hat's." Write "the Red Hat" instead. Example: "the Red Hat approach to open source," not "Red Hat's approach to open source."

## Grammar and Style

### Active Voice

Prefer active voice. Passive voice is acceptable when the actor is unknown or unimportant, but do not default to it.

- **Passive**: "The cluster is managed by the operator."
- **Active**: "The operator manages the cluster."

### Sentence Length

Keep sentences concise. If a sentence runs past 25 words, consider breaking it up. Short sentences are easier to read, translate, and understand.

### Paragraph Length

Break up walls of text. A paragraph should cover one idea. If you are writing more than 4-5 sentences in a paragraph, look for a natural break point.

### Lists

Use bulleted lists for items without a required order. Use numbered lists for sequential steps. Each list item should follow parallel construction.

## Words and Phrases to Fix

| Do Not Write | Write Instead |
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

## Punctuation

### Em Dashes

This team does not use em dashes. Replace them with:

- **Commas** for parenthetical information
- **Periods** to break a sentence into two
- **Parentheses** for brief asides
- **"and" or "or"** to connect related ideas

### Serial Comma

Use the serial (Oxford) comma. Write "containers, virtual machines, and bare metal," not "containers, virtual machines and bare metal."

### Hyphens

- Hyphenate compound modifiers before a noun: "open-source project," "command-line tool"
- Do not hyphenate after a noun: "the project is open source," "use the command line"
- Do not hyphenate adverbs ending in -ly: "newly created cluster," not "newly-created cluster"

## Formatting

### Code and Commands

- Use monospace (backticks in Markdown) for commands, file paths, variable names, and code.
- Use code blocks for multi-line code or command output.
- Provide copy-paste-ready commands when possible.

### Headings

- Use sentence case for headings: "Getting started with OpenShift," not "Getting Started With OpenShift."
- Make headings descriptive. "Configuring TLS certificates" is better than "Configuration."

### Links

- Use descriptive link text. "See the OpenShift documentation" is better than "click here."
- Avoid "click here," "this link," or bare URLs in text.

## Inclusive Language

Follow Red Hat inclusive language guidelines:

- Use "allowlist/blocklist" instead of "whitelist/blacklist"
- Use "primary/replica" or "leader/follower" instead of "master/slave"
- Use "placeholder" or "dummy" instead of other terms for sample data
- Use gender-neutral language: "they" as a singular pronoun is acceptable

## Numbers

- Spell out numbers zero through nine. Use numerals for 10 and above.
- Exception: Always use numerals with units (4 GB, 2 CPUs, 8 nodes).
- Use commas in numbers over 999: 1,000 and 10,000.

## Abbreviations and Acronyms

- Expand on first use: "Red Hat OpenShift Container Platform (OCP)"
- After first expansion, the acronym is fine on its own
- Do not assume the reader knows what an acronym means
- Some acronyms are so common they do not need expansion (HTTP, API, URL, CPU, RAM). Use your judgment.
