# LablGTK Documentation Index

This document provides a comprehensive index of all documentation in the LablGTK repository.

## Quick Links

- **Getting Started**: [Repository README](README.md) → [LablGTK4 README](lablgtk4/README.md)
- **Development Setup**: [SETUP.md](SETUP.md)
- **Migration Plan**: [port.md](port.md)
- **Development Guidelines**: [CLAUDE.md](CLAUDE.md)

## Core Documentation

### Project Overview

| Document | Description |
|----------|-------------|
| [README.md](README.md) | Main repository overview, status, and quick start guides |
| [SETUP.md](SETUP.md) | Development environment setup instructions |
| [port.md](port.md) | Overall GTK 3 → GTK 4 migration plan and strategy |

### Development Guidelines

| Document | Description |
|----------|-------------|
| [CLAUDE.md](CLAUDE.md) | Development notes and essential patterns for AI assistants |
| [FFI_GUIDELINES.md](FFI_GUIDELINES.md) | OCaml/C FFI best practices and patterns |
| [SECURITY_GUIDELINES.md](SECURITY_GUIDELINES.md) | Security best practices for OCaml C bindings |

## Migration Phase Documentation

### Phase Plans (Chronological)

| Phase | Document | Status | Description |
|-------|----------|--------|-------------|
| Phase 1 | [port-phase1.md](port-phase1.md) | ✅ Complete | Foundation & Infrastructure |
| Phase 2 | [port-phase2.md](port-phase2.md) | ✅ Complete | Core Layer Migration (GLib, GObject, Gdk, Pango) |
| Phase 3 | [port-phase3.md](port-phase3.md) | ✅ Complete | Base Widget Infrastructure (event controllers, snapshot rendering) |
| Phase 4 | [port-phase4.md](port-phase4.md) | 📋 Ready to Start | Container & Layout System (no GtkContainer/GtkBin) |
| Phase 5 | [port-phase5.md](port-phase5.md) | 📋 Ready to Start | High-Level Widgets (buttons, entries, text, trees, menus) |
| Phase 3-7 | [port-phase3-7.md](port-phase3-7.md) | 📋 Overview | High-level overview of Phases 3-7 (superseded by detailed plans) |

### Phase 3 Detailed Documentation

Phase 3 introduces code generation infrastructure for event controllers and widgets.

| Document | Description |
|----------|-------------|
| [PHASE3_0_IMPLEMENTATION.md](PHASE3_0_IMPLEMENTATION.md) | Phase 3.0: Code generation infrastructure setup |
| [PHASE3_CODEGEN_PROPOSAL.md](PHASE3_CODEGEN_PROPOSAL.md) | Manual code generation approach (archived) |
| [PHASE3_CODEGEN_PROPOSAL_GI.md](PHASE3_CODEGEN_PROPOSAL_GI.md) | GIR-based code generation approach (recommended) |
| [PHASE3_OCaml_GENERATOR.md](PHASE3_OCaml_GENERATOR.md) | OCaml-based GIR code generator implementation |

## Code Generation Tools

### Tool Documentation

| Document | Description |
|----------|-------------|
| [lablgtk4/src/tools/README_GIR_GEN.md](lablgtk4/src/tools/README_GIR_GEN.md) | GIR code generator usage and design |
| [lablgtk4/XMLM_MIGRATION_SUMMARY.md](lablgtk4/XMLM_MIGRATION_SUMMARY.md) | Migration from regex to xmlm XML parser |

### Available Tools

Located in `lablgtk4/src/tools/`:

| Tool | Purpose | Language | Documentation |
|------|---------|----------|---------------|
| `varcc` | Generate variant types from .var files | OCaml (camlp5) | Inline comments |
| `propcc` | Generate property/signal bindings from .props files | OCaml (camlp5) | Inline comments |
| `gir_gen` | Generate event controller bindings from GIR files | OCaml | [README_GIR_GEN.md](lablgtk4/src/tools/README_GIR_GEN.md) |

## Technical Deep Dives

### Specialized Topics

| Document | Description |
|----------|-------------|
| [GCLOSURE_CLEANUP_ANALYSIS.md](GCLOSURE_CLEANUP_ANALYSIS.md) | GClosure memory management analysis |

### Testing Documentation

| Document | Description |
|----------|-------------|
| [TESTING_WITH_GMAIN.md](TESTING_WITH_GMAIN.md) | Guide for using GMain.init() in runtime tests |
| [CI_UPDATE_SUMMARY.md](CI_UPDATE_SUMMARY.md) | CI/CD pipeline updates for runtime GTK testing |

## Module-Specific Documentation

### LablGTK4

| Document | Description |
|----------|-------------|
| [lablgtk4/README.md](lablgtk4/README.md) | LablGTK4 overview and build instructions |
| [lablgtk4/examples/README.md](lablgtk4/examples/README.md) | Example programs and usage patterns |
| [lablgtk4/tests/README.md](lablgtk4/tests/README.md) | Test suite documentation |

### LablGTK3

| Document | Description |
|----------|-------------|
| [lablgtk3/README.md](lablgtk3/README.md) | LablGTK3 (GTK 3 bindings) documentation |

## Documentation by Topic

### For New Contributors

1. Start with [README.md](README.md) for repository overview
2. Read [SETUP.md](SETUP.md) to set up development environment
3. Review [CLAUDE.md](CLAUDE.md) for development patterns
4. Check [FFI_GUIDELINES.md](FFI_GUIDELINES.md) before writing FFI code
5. Review [SECURITY_GUIDELINES.md](SECURITY_GUIDELINES.md) for security best practices

### For Migration Understanding

1. Start with [port.md](port.md) for overall strategy
2. Read phase documents in order: [phase1](port-phase1.md) → [phase2](port-phase2.md) → [phase3](port-phase3.md)
3. For Phase 3 specifics, see [PHASE3_CODEGEN_PROPOSAL_GI.md](PHASE3_CODEGEN_PROPOSAL_GI.md)

### For Code Generation

1. Read [PHASE3_CODEGEN_PROPOSAL_GI.md](PHASE3_CODEGEN_PROPOSAL_GI.md) for overall approach
2. See [lablgtk4/src/tools/README_GIR_GEN.md](lablgtk4/src/tools/README_GIR_GEN.md) for tool usage
3. Review [PHASE3_OCaml_GENERATOR.md](PHASE3_OCaml_GENERATOR.md) for implementation details
4. Check [lablgtk4/XMLM_MIGRATION_SUMMARY.md](lablgtk4/XMLM_MIGRATION_SUMMARY.md) for parser architecture

### For FFI Development

1. Read [FFI_GUIDELINES.md](FFI_GUIDELINES.md) for patterns and best practices
2. Review [SECURITY_GUIDELINES.md](SECURITY_GUIDELINES.md) for security requirements
3. Check existing code in `lablgtk4/src/` for examples
4. Refer to [CLAUDE.md](CLAUDE.md) for quick reference patterns

### For Testing

1. Start with [lablgtk4/tests/README.md](lablgtk4/tests/README.md) for test suite overview
2. Read [TESTING_WITH_GMAIN.md](TESTING_WITH_GMAIN.md) for runtime testing with GTK initialization
3. See [CI_UPDATE_SUMMARY.md](CI_UPDATE_SUMMARY.md) for CI/CD test execution details

## External Resources

### GTK Documentation

- [GTK 4 Documentation](https://docs.gtk.org/gtk4/)
- [GTK 3 → 4 Migration Guide](https://docs.gtk.org/gtk4/migrating-3to4.html)
- [GObject Introspection](https://gi.readthedocs.io/)

### OCaml Resources

- [OCaml Manual - Interfacing C with OCaml](https://ocaml.org/manual/intfc.html)
- [OCaml FFI Tutorial](https://ocaml.org/docs/calling-c-libraries)

## Document Maintenance

### Recently Updated

- **2025-11-16**: Created port-phase5.md with comprehensive Phase 5 plan (High-Level Widgets)
- **2025-11-16**: Added TESTING_WITH_GMAIN.md and CI_UPDATE_SUMMARY.md for Phase 3.3/3.4 testing
- **2024-11-15**: Added XMLM_MIGRATION_SUMMARY.md documenting xmlm parser migration
- **2024-11-15**: Updated with Phase 3.0 code generation infrastructure completion
- **2024-11-15**: Created DOCUMENTATION_INDEX.md

### Document Status

| Status | Meaning |
|--------|---------|
| ✅ Complete | Documentation is current and accurate |
| 🚧 In Progress | Documentation is being actively updated |
| 📋 Planned | Documentation planned but not yet created |
| 📦 Archived | Historical documentation, superseded by newer docs |

---

**Last Updated**: 2025-11-16
**Maintained By**: LablGTK Development Team
