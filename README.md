# fortls-lsp

Fortran language server plugin for Claude Code. Provides hover documentation,
go-to-definition, find references, and symbol search for Fortran source files
using [fortls](https://fortls.readthedocs.io/).

## Supported Extensions

`.f90`, `.f`, `.f03`, `.f08`, `.for`, `.fpp` and their uppercase preprocessed
variants `.F90`, `.F`, `.F03`, `.F08`, `.FOR`, `.FPP`

## Prerequisites

Install fortls on each machine:

```bash
# macOS via Homebrew
brew install fortls

# via pip (any platform)
pip install fortls

# via pipx (recommended for CLI tools)
pipx install fortls
```

Verify: `fortls --version`

## Installation

Clone directly into Claude Code's built-in plugin directory:

```bash
git clone https://github.com/underwoo/claude-fortls-lsp.git ~/.claude/skills/fortls-lsp
```

Then restart Claude Code, or run `/reload-plugins` in an existing session.
The plugin auto-loads from `~/.claude/skills/` — no `claude plugin enable` needed.

To update later:

```bash
git -C ~/.claude/skills/fortls-lsp pull
```

Then run `/reload-plugins` or restart.

## Verification

After enabling, restart Claude Code, then open a Fortran source file and ask
Claude a question about a symbol (e.g. "what does this subroutine do?"). Claude
should use the LSP `hover` operation automatically. You can also ask Claude to
run `documentSymbol` on the file to list all subroutines and functions.

## Project Configuration

For best results, add a `.fortls` config file to your **Fortran project root**
(not this plugin directory). `fortls` reads it automatically on startup.

```json
{
  "source_dirs": ["src", "."],
  "include_dirs": [],
  "exclude_dirs": ["build", "CMakeFiles", ".git"],
  "lowercase_intrinsics": false,
  "max_line_length": -1,
  "max_comment_line_length": -1,
  "use_signature_help": true,
  "variable_hover": true,
  "hover_signature": true,
  "hover_language": "fortran",
  "sort_keywords": true,
  "incremental_sync": true,
  "nthreads": 4
}
```

Adjust `source_dirs` to match your project layout — this is the most important
setting for cross-file symbol resolution. See the [fortls configuration
reference](https://fortls.readthedocs.io/en/latest/options.html) for all
options.

## What Claude Can Do With This Plugin

Once enabled, Claude can automatically:
- Explain what a subroutine or function does (hover)
- Find where a symbol is defined (go-to-definition)
- List all call sites for a subroutine (find references)
- Show all subroutines and modules in a file (document symbols)
- Search for a symbol across the project (workspace symbols)

## More Information

- [fortls on PyPI](https://pypi.org/project/fortls/)
- [fortls documentation](https://fortls.readthedocs.io/)
- [GitHub repository](https://github.com/fortls/fortls)
