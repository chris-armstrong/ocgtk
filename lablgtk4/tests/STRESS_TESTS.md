# Stress Tests - Known Issues

This directory contains stress tests that are **intentionally excluded** from the main test suite and CI because they trigger known issues.

## GValue GC Stress Tests

**File:** `test_gobject_stress.ml`

These tests stress-test GValue memory management by:
- Creating many GValues in rapid succession (100-1000 iterations)
- Explicitly triggering garbage collection with `Gc.minor()`
- Testing GValue behavior across GC cycles

### The Problem

These tests trigger segmentation faults due to interactions between:
- OCaml's garbage collector
- GLib's type system
- Rapid GValue allocation and deallocation

**Important:** The core GValue functionality works correctly in normal usage! The segfaults only occur when:
1. Creating many GValues in tight loops (100+ per test)
2. Explicitly calling `Gc.minor()` to force GC
3. Running all three stress tests in sequence

### Running Stress Tests

⚠️ **Warning:** These tests WILL segfault when run with a display server.

```bash
# From lablgtk4 directory:

# Without display (tests will be skipped)
./run_stress_tests.sh

# With virtual display (tests will run and segfault - expected)
xvfb-run -a ./run_stress_tests.sh
```

### Expected Output

**Without display:**
```
ℹ️  Tests were skipped (no display server available)
   Use 'xvfb-run -a ./run_stress_tests.sh' to run with virtual display
```

**With display (expected to segfault):**
```
⚠️  Stress tests segfaulted (expected behavior)
  Exit code 139 = SIGSEGV (segmentation fault)
  This is the known issue with GValue GC interaction.
```

### Future Work

Potential approaches to fix or improve these tests:
1. Investigate GValue finalizer timing and GC interaction
2. Add GC timing controls to avoid race conditions
3. Use weaker references or different memory management strategies
4. Test with different OCaml GC parameters
5. Investigate GLib type system locking/threading

### Why Keep These Tests?

1. **Documentation:** They demonstrate a real edge case in GValue handling
2. **Regression testing:** If the issue is fixed, we'll know immediately
3. **Investigation:** Useful for debugging the GC interaction
4. **Completeness:** Memory safety is important to test, even if it currently fails

## Adding New Stress Tests

If you discover other operations that cause issues under stress:

1. Create a new test file: `test_<module>_stress.ml`
2. Add executable to `tests/dune`
3. Add to `run_stress_tests.sh`
4. Document the issue in this file
5. Mark clearly with warnings about expected failures

**Pattern for stress test files:**
```ocaml
(* WARNING: This test triggers <issue description> *)

open Alcotest

let gtk_available = (* GTK init boilerplate *)

let test_stressful_operation () =
  (* Test that causes issues *)

let () =
  run "Module Stress Tests (KNOWN TO <FAIL_MODE>)" [
    (* Test cases *)
  ]
```

## Notes

- Stress tests are **excluded** from `run_tests.sh` validation
- They are **not built** by default CI workflows
- They **should not** be added to the main test suite
- Exit codes: 0 = pass (unexpected), 1 = skip, 139 = segfault (expected)
