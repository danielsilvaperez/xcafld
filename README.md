# xcafld 🚀

[![Python 3.10+](https://img.shields.io/badge/python-3.10+-blue.svg)](https://www.python.org/downloads/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Zero Dependencies](https://img.shields.io/badge/dependencies-zero-brightgreen.svg)]()

`xcafld` (Scaffold) is a lightweight, zero-dependency Python command-line utility for physically generating directory and file structures out of standard text representations (like `tree` output).

It is designed to easily translate Markdown code blocks or standard input streams showing folder hierarchies into actual files on your macOS/Linux system.

## Features

- **Zero Dependencies:** Written purely in Python 3 using the standard library.
- **Robust Parsing:** Supports mixed spaces, tabs, and `tree` line-drawing characters (`├──`, `└──`, `│`).
- **Implicit Directories:** Automatically detects and creates directories even if they lack a trailing slash, so long as they have children nested beneath them.
- **Inline Comments:** Skips full-line `#` comments and strips inline `#` comments, perfect for documenting structures in a `.md` file.

## Installation

You can install `xcafld` globally with this single curl command:

```bash
curl -sL https://raw.githubusercontent.com/danielsilvaperez/xcafld/main/install.sh | bash
```

Alternatively, you can manually clone this repository and copy the script to a directory in your `PATH`.

## Usage

You can supply an explicit input file:

```bash
xcafld sample.md
```

Or you can pipe contents directly to it:

```bash
cat sample.md | xcafld
```

### Example Input (`sample.md`)

```markdown
# This is a sample
screen-sherpa/
├── apps/
│   ├── web/                  # Next.js UI
│   └── agent/                # Node/TS Cloud Run agent service
├── packages/
│   ├── schemas/              # action/state types
│   ├── prompts/              # system prompts
│   └── browser/              # Playwright wrappers
└── README.md
```

Running `xcafld` against the text above will instantly scaffold the `screen-sherpa/` tree locally!

## 🤖 AI Agent Tool Usage (System Prompting)

Want your AI Coding Agent to effortlessly scaffold whole projects at once? Give them `xcafld` as a system tool! By copying the prompt snippet below into your Agent's instructions, they can generate sweeping directory setups in 1 output instead of running 20 distinct `mkdir` and `touch` shell commands.

**Prompt Snippet for your AI:**
> You have access to a CLI tool called `xcafld`. Whenever you need to create a large amount of folders and files at once, do NOT run `mkdir` manually. Instead, write out a standard ASCII tree block and pipe it into `xcafld`.
>
> Example:
> \`\`\`bash
> cat << 'EOF' | xcafld
> my_app/
> ├── src/
> │   └── main.py
> └── README.md
> EOF
> \`\`\`
