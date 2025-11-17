# LablGTK4 Binding Generation Workflow

This document explains how widget bindings are generated and maintained in lablgtk4.

## Overview

LablGTK4 uses automated code generation to create widget bindings from GTK's GObject Introspection (GIR) files. The workflow is:

1. **Developer generates bindings** using `gir_gen` tool
2. **Generated files are committed** to the repository
3. **CI/CD builds use committed files** (no generation during builds)

This approach ensures:
- Faster builds (no generation step)
- Reproducible builds (no dependency on GIR files in CI)
- Version control for generated code (can review changes)

## The Problem with Manual Bindings (Phase 5.3 Lesson)

In the initial Phase 5.3 implementation, text widget bindings were **hand-written** instead of generated:

```bash
# ❌ WRONG: Manually created these files
lablgtk4/src/gtkTextView.mli
lablgtk4/src/gtkTextBuffer.mli
lablgtk4/src/ml_gtk_text_widgets.c
```

**Why this is wrong:**
- Defeats the purpose of automated code generation (Phase 5.0/5.2)
- Creates maintenance burden (manual updates when GTK changes)
- Inconsistent with the rest of the codebase
- Error-prone (typos, missing functions, etc.)

**Why it happened:**
- Build environment wasn't set up (no opam/dune available)
- CI/CD was failing and needed immediate fix

**The correct approach:**
Use `gir_gen` to generate bindings, then commit them.

## Prerequisites

Before generating bindings, ensure your environment is set up:

```bash
# See ../SETUP.md for full instructions
eval $(opam env)

# Verify tools are available
dune --version
which gir_gen
```

If not set up, follow: **[../SETUP.md](../SETUP.md)**

## Quick Start: Regenerate All Bindings

```bash
cd lablgtk4

# Regenerate widget bindings (Phase 5)
./regenerate_bindings.sh

# Or regenerate everything (controllers + widgets)
./regenerate_bindings.sh --all
```

## Manual Generation Steps

### 1. Build the Generator

```bash
cd lablgtk4
dune build src/tools/gir_gen.exe
```

### 2. Generate Widget Bindings

```bash
# Generate widget bindings using filter
./_build/default/src/tools/gir_gen.exe \
  -mode widgets \
  -filter src/tools/widget_filter.conf \
  /usr/share/gir-1.0/Gtk-4.0.gir \
  src/

# This generates:
# - src/ml_event_controllers_gen.c (C FFI bindings)
# - src/gtkButton.mli, gtkTextView.mli, etc. (OCaml interfaces)
```

### 3. Generate Event Controller Bindings (if needed)

```bash
# Generate event controller bindings
./_build/default/src/tools/gir_gen.exe \
  -mode controllers \
  /usr/share/gir-1.0/Gtk-4.0.gir \
  src/

# This updates:
# - src/ml_event_controllers_gen.c
# - src/eventController*.mli
```

### 4. Review Changes

```bash
# Check what changed
git diff src/*.mli src/*.c

# Review the diff carefully
git diff src/gtkTextView.mli
```

### 5. Rebuild and Test

```bash
# Rebuild with new bindings
dune build

# Run tests to verify
./run_tests.sh
```

### 6. Commit Generated Files

```bash
# Add generated files
git add src/gtk*.mli src/ml_event_controllers_gen.c

# Commit with descriptive message
git commit -m "Regenerate widget bindings from Gtk-4.0.gir

Updated bindings for:
- Text widgets (TextView, TextBuffer, TextTag, etc.)
- Button widgets (Button, CheckButton, ToggleButton)
- Entry widgets (Entry, SearchEntry, PasswordEntry, SpinButton)

Generated using gir_gen from GTK $(pkg-config --modversion gtk4)"
```

## Widget Filter Configuration

The `widget_filter.conf` file controls which widgets are generated:

```bash
# Edit the filter
vim src/tools/widget_filter.conf

# Add widgets to generate
echo "GtkLabel" >> src/tools/widget_filter.conf
echo "GtkImage" >> src/tools/widget_filter.conf

# Regenerate
./regenerate_bindings.sh
```

## Adding a New Widget Category

When adding a new widget (e.g., Phase 5.4 Range Widgets):

1. **Update filter**: Add widget names to `widget_filter.conf`
   ```
   # 5.4 Range Widgets
   Scale
   Range
   ProgressBar
   LevelBar
   Adjustment
   ```

2. **Generate bindings**: Run `./regenerate_bindings.sh`

3. **Update dune**: Add new modules to `src/dune`
   ```lisp
   (modules ... gtkScale gtkRange gtkProgressBar ...)
   ```

4. **Create high-level wrapper**: Write `GRange.mli/ml` (hand-written)

5. **Write tests**: Create `tests/test_range.ml`

6. **Commit everything**: Generated bindings + hand-written wrappers + tests

## What Files Are Generated vs Hand-Written?

### Generated (by gir_gen)
- ✅ `src/gtk*.mli` - Low-level OCaml interfaces
- ✅ `src/ml_event_controllers_gen.c` - C FFI bindings
- ✅ Property getters/setters
- ✅ Method bindings
- ✅ Constructor bindings

### Hand-Written (by developers)
- ✅ `src/gText.mli/ml` - High-level wrapper classes
- ✅ `src/gButton.mli/ml` - High-level wrapper classes
- ✅ `src/gtkTextIter.mli/ml` - Special cases (stack-allocated types)
- ✅ `src/ml_gtk_text.c` - Manual FFI for special cases
- ✅ `tests/test_*.ml` - Test suites

## Special Cases: When NOT to Use gir_gen

Some types require manual implementation:

1. **Stack-Allocated Structures**
   - `GtkTextIter` - Uses `copy_memblock_indirected`
   - Requires manual C wrapper in `ml_gtk_text.c`

2. **Complex Callbacks**
   - Custom signal handlers with complex marshalling
   - May need manual wrappers

3. **Deprecated or Removed APIs**
   - GTK3 → GTK4 migrations
   - Manual compatibility shims

## Verification Checklist

After regenerating bindings:

- [ ] All generated `.mli` files compile
- [ ] C bindings compile without warnings
- [ ] Tests pass: `./run_tests.sh`
- [ ] High-level wrappers still work
- [ ] No regressions in existing code
- [ ] Generated code reviewed (spot check)
- [ ] Commit message describes what changed

## Troubleshooting

### "GIR file not found"

```bash
# Install GTK4 development packages
sudo apt-get install libgtk-4-dev

# Or set custom path
export GTK_GIR_FILE=/path/to/Gtk-4.0.gir
```

### "gir_gen fails to parse"

```bash
# Check GTK version
pkg-config --modversion gtk4

# Ensure compatible version (>= 4.0)
```

### "Generated bindings don't compile"

```bash
# Check type mappings in gir_gen.ml
# May need to add new type conversions

# See: src/tools/gir_gen.ml - type_mappings section
```

### "Tests fail after regeneration"

```bash
# Check if API changed
git diff src/gtk*.mli

# Update high-level wrappers if needed
vim src/gText.ml

# Update tests if needed
vim tests/test_text.ml
```

## Best Practices

1. **Always use the generator** - Don't hand-write bindings (learned from Phase 5.3)
2. **Review generated code** - Spot check for correctness
3. **Test before committing** - Run full test suite
4. **Commit atomically** - Generated files in one commit, hand-written in another
5. **Document changes** - Note what widgets/methods were added

## References

- [gir_gen Tool Documentation](src/tools/README_GIR_GEN.md)
- [Phase 5.2 Generator Guide](src/tools/README_PHASE5_2_GENERATORS.md)
- [SETUP.md](../SETUP.md) - Environment setup
- [PHASE5_3_PLAN.md](../PHASE5_3_PLAN.md) - Text widgets implementation

---

**Last Updated**: 2025-11-17
**Lesson Learned**: Always use code generation tools, even when environment setup is difficult. The manual approach in Phase 5.3 was expedient but wrong.
