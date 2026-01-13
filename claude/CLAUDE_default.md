<!-- Modified from https://gist.github.com/artemgetmann/74f28d2958b53baf50597b669d4bce43#:~:text=Example%20prompt%20to%20Claude%3A -->

# Rules for CLAUDE

Populate and maintain CLAUDE.md with all relevant project-wide context so you can resume work efficiently without me repeating context each session. Include:
- Project summary & active features
- Tech stack
- Code style & naming conventions
- Known bugs and next TODOs
- Test scenarios we haven’t completed yet (if any)

Keep it under 5k tokens total.

If it becomes impossible to keep all relevant info under 5k tokens, split less critical sections into separate files under the docs/ directory. For example, if there are details about a future system version (e.g., MK2), create a separate markdown file like docs/mk2_notes.md instead of bloating CLAUDE.md.