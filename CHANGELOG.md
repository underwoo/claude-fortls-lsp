# Changelog

All notable changes to this plugin will be documented here.

## [1.0.1] - 2026-06-15

### Fixed
- Restore `.lsp.json` for LSP server registration — `lspServers` in `marketplace.json` only applies to officially-catalogued plugins; custom marketplace plugins require `.lsp.json` in the plugin directory
- Correct license identifier from `MIT` to `Apache-2.0`
- Move `lspServers` config into `plugin.json` in addition to `marketplace.json`

## [1.0.0] - 2026-06-14

### Added
- Initial release
- `lspServers` configuration for `fortls` covering `.f90`, `.f`, `.f03`, `.f08`, `.for`, `.fpp`
- `fortran-coding` skill that auto-activates when Claude works with Fortran files
- README with installation and team setup instructions
- Example `.fortls` project configuration
