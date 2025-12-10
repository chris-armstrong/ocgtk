# Development Notes for lablgtk4 Port

## MANDATORY: Development Essentials

1. ALWAYS build the project after making changes with `dune build`. Always use its output in full - DO NOT FILTER its output with `head`/`grep`/`tail` because you will miss critical context.
2. ALWAYS run tests with `dune runtest`
3. ALWAYS write scripts and supporting code in OCaml

## Setting up the project

If you are running in a clean container (e.g. Claude Code Web), you will need to follow the instructions in [SETUP.md](./SETUP.md) for instructions.

## Essential: Always Check lablgtk3 First

**CRITICAL RULE**: When working on lablgtk4, ALWAYS check the lablgtk3 implementation first before writing new code.

### Why This Matters:
- lablgtk3 has battle-tested patterns that work correctly
- Saves hours of debugging subtle FFI issues
- Avoids reinventing solutions that already exist
- Provides correct reference for memory management

### How to Check lablgtk3:
```bash
# Find relevant files
find lablgtk3/src -name "*<module>*"

# Check implementation patterns
grep -A 20 "<function_name>" lablgtk3/src/*.c

# Compare approach
diff lablgtk3/src/<file>.c lablgtk4/src/<file>.c
```

## Refactoring Code or Rewriting Documentation

**When moving code or documentation**: ALWAYS use tools to copy the code to a temporary file and write it to the destination file. DO NOT REGENERATE the code yourself - this will save your token usage. ALWAYS remove the old code files and update the `dune` file accordingly.

**When rewriting code or documentaiton**: THINK about what pattern exists in the changes you are making. Use a search and replace tool like `sed` or `awk` instead of rewriting the code yourself. Write a small utility in OCaml for more complex cases, validating it on a small sample before rewiring the whole codebase.

**When writing new code files or documentation files**: ALWAYS ensure the code file is added to the `dune` file and included (either directly or via code generation of a dune `(include ...)` or `(dynamic_include ...)`)

## Running Build Tools

This project uses `dune` to compile code and run tests. NEVER compile code directly with `ocamlc/ocamlc.opt`.

* Use `dune build` to compile the code. IMPORTANT: Always check the return code grep for "error|warning|undefined reference". DO NOT filter its output with `grep`/`head`/`tail` etc. otherwise you will miss critical error context.
* Use `dune test` to run all the unit and integration tests. ALWAYS check the return code to determine success - do not rely on the console output.

## OCaml / C FFI Guidelines

For instructions and best practices for writing and updating OCaml / C FFI, see [FFI Guidelines](./FFI_GUIDELINES.md).

## Testing Strategy

### Test Incrementally
1. Test pointer creation (non-null check)
2. Test void invocation (no parameters)
3. Test with simple parameter (int)
4. Test with complex parameter (string)
5. Test multiple invocations

### Runtime Testing with GTK
For tests requiring GTK initialization:
- Use `GMain.init()` for testing purposes (see [TESTING_WITH_GMAIN.md](TESTING_WITH_GMAIN.md))
- Use `skip()` in Alcotest for tests that need display server or widgets
- CI/CD uses `xvfb-run` to provide virtual display (see [CI_UPDATE_SUMMARY.md](CI_UPDATE_SUMMARY.md))

### Use Test Helpers
Create C test helpers for direct invocation:
```c
CAMLprim value ml_test_invoke_closure_void(value closure_val);
CAMLprim value ml_test_invoke_closure_int(value closure_val, value arg);
```

Expose via test-only module:
```ocaml
module Test : sig
  val invoke_closure_void : g_closure -> unit
  val invoke_closure_int : g_closure -> int -> unit
end
```

## Development Tools

### GIR Code Generator
For generating GTK bindings from GObject Introspection (GIR) files:
- See [lablgtk4/src/tools/README_GIR_GEN.md](lablgtk4/src/tools/README_GIR_GEN.md) for complete usage instructions
- Generates C FFI bindings and OCaml interfaces from Gtk-4.0.gir
- Supports error handling with result types for throwing functions

## Memory Safety

### GC Interaction
- Custom blocks with finalizers need careful initialization tracking
- Don't call g_value_unset on uninitialized GValues
- Check `initialized` flag before cleanup

### Global Roots
```c
/* Register to prevent GC */
caml_register_global_root((value*)&ptr);

/* Always unregister in cleanup */
caml_remove_global_root((value*)&ptr);
```

## Security Guidelines

**IMPORTANT**: All C bindings must follow security best practices documented in:

📘 **[SECURITY_GUIDELINES.md](SECURITY_GUIDELINES.md)** - Comprehensive security guidelines for OCaml C bindings

Key security requirements:
- **Always check allocation results** (malloc, g_new) for NULL
- **Validate integer overflow** before size calculations
- **Use CAMLparam/CAMLlocal** for all functions with OCaml values
- **Protect OCaml values in C** with caml_register_global_root
- **Deep copy GValues** with g_value_init + g_value_copy (never memcpy)
- **Validate buffer bounds** before memcpy/strcpy
- **Check callback exceptions** with caml_callback_exn
- **Validate list structures** when converting to GList/GSList


## When You Get Stuck

1. **Check lablgtk3** - probably already solved
2. **Check security guidelines** - ensure code follows best practices
3. **Add debug output to file** - stderr may not work
4. **Check pointer values** - catch wrapping issues early
5. **Test incrementally** - isolate the failing case
6. **Verify GValue copying** - use g_value_copy, not memcpy

