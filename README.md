# xcafld

`xcafld` (Scaffold) is a lightweight, zero-dependency Python command-line utility for physically generating directory and file structures out of standard text representations (like `tree` output).

It is designed to easily translate Markdown code blocks or standard input streams showing folder hierarchies into actual files on your macOS/Linux system.

## Features

- **Zero Dependencies:** Written purely in Python 3 using the standard library.
- **Robust Parsing:** Supports mixed spaces, tabs, and `tree` line-drawing characters (`├──`, `└──`, `│`).
- **Implicit Directories:** Automatically detects and creates directories even if they lack a trailing slash, so long as they have children nested beneath them.
- **Inline Comments:** Skips full-line `#` comments and strips inline `#` comments, perfect for documenting structures in a `.md` file.

## Installation

Make sure you have Python 3 installed. You can place `xcafld` anywhere in your system `PATH` (e.g. `/usr/local/bin`).

```bash
# Clone the repository
git clone https://github.com/yourusername/xcafld.git
cd xcafld

# Ensure the script is executable
chmod +x xcafld

# (Optional) Link it globally
ln -s $(pwd)/xcafld /usr/local/bin/xcafld
```

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
