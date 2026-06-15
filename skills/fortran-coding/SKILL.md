---
name: fortran-coding
description: Use when working with Fortran source files (.f90, .f, .f03, .f08, .for, .fpp, .F90, .F, .F03, .F08, .FOR, .FPP) or when asked questions about Fortran code, subroutines, modules, functions, or variables
version: 1.0.0
---

# Fortran Code Intelligence via fortls

When working with Fortran files, use the built-in LSP tool to get accurate information before answering or editing.

## Available LSP Operations

- **hover** — type info and documentation for a symbol (what does this variable/subroutine do, what type is it)
- **goToDefinition** — find where a subroutine, function, or variable is declared
- **findReferences** — find all uses of a symbol across the project
- **documentSymbol** — list all subroutines, functions, and modules defined in a file
- **workspaceSymbol** — search for a symbol name across the entire project (requires a query string)
- **goToImplementation** — find implementations of an interface

## How to Use

1. Read the file to find the correct line and character position of the symbol you want to query
2. Call the LSP tool with the absolute file path, 1-based line number, and 1-based character offset
3. Use the result to answer questions or inform edits

## Common Patterns

**Before answering "what does X do?"**
→ Use `hover` at the position of X

**Before editing a subroutine signature**
→ Use `findReferences` to find all call sites

**To understand a file's structure**
→ Use `documentSymbol` to get all subroutines and functions

**To find where a module is defined**
→ Use `goToDefinition` at a USE statement

## Notes

- fortls requires a `.fortls` config file or a `compile_commands.json` in the project root for full functionality
- Line and character numbers are 1-based (as shown in editors)
- Always provide absolute file paths to the LSP tool
