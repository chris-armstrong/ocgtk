# Infrastructure

Shared testing infrastructure used across all test suites.

## Files

- **helpers.ml** - Common test utilities, GIR file creation, assertion helpers
- **c_parser.ml** - Lightweight C code parser for validating generated C stubs
- **c_ast.ml** - C AST types and inspection functions
- **c_validation.ml** - High-level C code validation helpers

## Purpose

This directory contains the foundational testing infrastructure that other test suites depend on. No actual test cases are defined here - only utilities, parsers, and validation helpers.
