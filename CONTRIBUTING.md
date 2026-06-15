# Contributing

## Adding Support for New File Extensions

Edit `extensionToLanguage` in `.claude-plugin/plugin.json` and add an entry for the new extension. The value should be the LSP language identifier (`"fortran"` for all Fortran dialects).

## Improving the Skill

`skills/fortran-coding/SKILL.md` controls how Claude uses the LSP tool when working with Fortran. Edit the guidance there if you want Claude to emphasize different operations or add project-specific context.

## Tuning fortls Arguments

The `args` field in `plugin.json` is passed directly to `fortls`. Useful flags:

| Flag | Effect |
|------|--------|
| `--stdio` | Required — uses stdin/stdout transport (do not remove) |
| `--debug_filepath <path>` | Log debug output to a file |
| `--nthreads <n>` | Number of worker threads (default 4) |
| `--notify_init` | Send a notification when the server finishes initializing |

See `fortls --help` or the [fortls docs](https://fortls.readthedocs.io/en/latest/options.html) for the full list.

## Testing Changes

After editing `plugin.json`, restart Claude Code and run `/mcp` to verify the updated configuration loaded. The skill takes effect immediately in a new session.

## Versioning

Bump the `version` field in `plugin.json` and add an entry to `CHANGELOG.md` for any change that affects behavior.
