---
name: fortls-lsp
description: Use when working with Fortran source files (.f90, .f, .f03, .f08, .for, .fpp, .F90, .F, .F03, .F08, .FOR, .FPP) or when asked questions about Fortran code, subroutines, modules, functions, or variables
version: 1.0.0
---

# Fortran Code Intelligence via fortls

This skill has already been loaded automatically. Do not attempt to invoke it again by name — proceed directly with the LSP tool as described below.

Before calling the LSP tool for the first time in a session, load its schema with ToolSearch to ensure the correct parameters are used:

```
ToolSearch: select:LSP
```

Skipping this step causes InputValidationError because the tool's parameter schema is not yet known.

**Do not use grep, Bash, or Read to explore Fortran code structure.** Always use the LSP tool instead — it has direct knowledge of types, signatures, and cross-file relationships that text search cannot provide.

## Required Behavior

- **Identifying what a symbol does** → LSP `hover` (not grep or Read)
- **Finding where something is defined** → LSP `goToDefinition` (not grep)
- **Finding all call sites** → LSP `findReferences` (not grep)
- **Listing a file's subroutines and functions** → LSP `documentSymbol` (not grep or Read)
- **Searching for a symbol by name** → LSP `workspaceSymbol` with a query string (not grep)

Only fall back to Read or grep when the LSP tool returns an error or the file type is not Fortran.

## How to Use the LSP Tool

1. Use `documentSymbol` on the file first to find the line number of the target symbol
2. Call the appropriate LSP operation with the absolute file path, 1-based line, and 1-based character offset
3. Use the result to answer questions or inform edits — do not re-read the file to verify what LSP already returned

**`filePath` must always point to a file, never a directory** — even for workspace-wide operations like `workspaceSymbol`. The file acts as an anchor to identify which LSP server instance to query. For `workspaceSymbol`, pass any Fortran source file from the project as the anchor.

## Notes

- Line and character numbers are 1-based
- Always use absolute file paths
- fortls resolves cross-file symbols best when the project has a `.fortls` config file in its root
