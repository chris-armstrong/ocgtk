# Valgrind Testing Guide for Array Handling

## Manual Testing Process

### 1. Generate Real Bindings

```bash
# Generate bindings for classes with array methods
mkdir -p /tmp/valgrind_test
cat > /tmp/valgrind_test/filter.txt << EOF
AboutDialog
EOF

dune exec src/tools/gir_gen/main.exe -- \
    -f /tmp/valgrind_test/filter.txt \
    /usr/share/gir-1.0/Gtk-4.0.gir \
    /tmp/valgrind_test
```

### 2. Create Test Compilation Setup

```bash
# Copy support files
cp src/common/wrappers.h /tmp/valgrind_test/
cp src/gtk/core/converters.h /tmp/valgrind_test/

# Create a minimal dune file
cat > /tmp/valgrind_test/dune << 'EOF'
(library
 (name test_arrays)
 (modules about_dialog)
 (libraries gtk4)
 (foreign_stubs
  (language c)
  (names ml_about_dialog_gen)
  (flags (:standard -I%{lib:stdlib:} -I. (:include c_flags.sexp)))))

(rule
 (targets c_flags.sexp)
 (action
  (with-stdout-to %{targets}
   (run pkg-config --cflags gtk4))))
EOF
```

### 3. Write OCaml Test Program

```ocaml
(* test_array_methods.ml *)

(* Test zero-terminated string array input *)
let test_set_authors () =
  let dialog = About_dialog.create () in
  let authors = [| "Alice"; "Bob"; "Charlie" |] in
  About_dialog.set_authors dialog authors;
  (* If there's a leak, valgrind will catch it *)
  ()

(* Test zero-terminated string array return *)
let test_get_artists () =
  let dialog = About_dialog.create () in
  (* Set some artists first *)
  About_dialog.set_artists dialog [| "Artist 1"; "Artist 2" |];
  (* Get them back *)
  let artists = About_dialog.get_artists dialog in
  Printf.printf "Got %d artists\n" (Array.length artists);
  Array.iter (fun a -> Printf.printf "  - %s\n" a) artists;
  (* If we don't free the returned array properly, valgrind catches it *)
  ()

(* Test multiple calls to ensure cleanup works *)
let test_repeated_calls () =
  let dialog = About_dialog.create () in
  for i = 1 to 100 do
    About_dialog.set_authors dialog [| Printf.sprintf "Author %d" i |];
    let _ = About_dialog.get_artists dialog in
    ()
  done;
  (* 100 iterations amplifies any leaks *)
  ()

let () =
  Gtk.init ();
  test_set_authors ();
  test_get_artists ();
  test_repeated_calls ();
  print_endline "Tests completed"
```

### 4. Compile Test Program

```bash
cd /tmp/valgrind_test

# Build the library
dune build

# Compile test program
ocamlfind ocamlopt -package gtk4 -linkpkg \
    -I _build/default \
    test_arrays.cmxa \
    test_array_methods.ml \
    -o test_array_methods
```

### 5. Run Under Valgrind

```bash
# Basic leak check
valgrind --leak-check=full \
         --show-leak-kinds=all \
         --track-origins=yes \
         --verbose \
         ./test_array_methods

# With suppressions for known OCaml/GTK issues
valgrind --leak-check=full \
         --suppressions=/usr/share/glib-2.0/valgrind/glib.supp \
         --suppressions=ocaml.supp \
         ./test_array_methods
```

### 6. Interpret Results

**Clean output (no leaks):**
```
==12345== HEAP SUMMARY:
==12345==     in use at exit: 0 bytes in 0 blocks
==12345==   total heap usage: 1,234 allocs, 1,234 frees
==12345==
==12345== All heap blocks were freed -- no leaks are possible
```

**Memory leak detected:**
```
==12345== 80 bytes in 1 blocks are definitely lost in loss record 10 of 20
==12345==    at 0x4C2FB0F: malloc (in /usr/lib/valgrind/...)
==12345==    by 0x5A2B3C4: g_malloc (gmem.c:94)
==12345==    by 0x4E8F123: ml_gtk_about_dialog_set_authors (ml_about_dialog_gen.c:45)
==12345==    by 0x4E7A234: camlTest_array_methods__test_set_authors_123
```
This would indicate the array wasn't freed properly.

**Double free:**
```
==12345== Invalid free() / delete / delete[] / realloc()
==12345==    at 0x4C30D3B: free (in /usr/lib/valgrind/...)
==12345==    by 0x5A2B456: g_free (gmem.c:252)
==12345==    by 0x4E8F234: ml_gtk_about_dialog_set_authors (ml_about_dialog_gen.c:52)
```
This would indicate we freed memory GTK still owns (TransferFull mishandled).

## Automated Testing

### Approach 1: Integration Test Script

```bash
#!/bin/bash
# test_arrays_valgrind.sh

set -e

# Setup
TEST_DIR=$(mktemp -d)
cd "$TEST_DIR"

# Generate bindings
echo "AboutDialog" > filter.txt
ocgtk-gen -f filter.txt /usr/share/gir-1.0/Gtk-4.0.gir .

# Create test program (embed OCaml code)
cat > test.ml << 'OCAML'
let () =
  Gtk.init ();
  let dialog = About_dialog.create () in
  for i = 1 to 10 do
    About_dialog.set_authors dialog [| "Test Author" |];
    ignore (About_dialog.get_artists dialog)
  done
OCAML

# Build
dune build
ocamlfind ocamlopt -package gtk4 -linkpkg test.ml -o test

# Run with valgrind
valgrind --error-exitcode=1 \
         --leak-check=full \
         --errors-for-leak-kinds=definite \
         ./test

EXIT_CODE=$?

# Cleanup
cd /
rm -rf "$TEST_DIR"

if [ $EXIT_CODE -eq 0 ]; then
    echo "✅ No memory leaks detected"
    exit 0
else
    echo "❌ Memory leaks detected"
    exit 1
fi
```

### Approach 2: Dune Integration

Add to your test suite:

```scheme
; In src/tools/test_gir_gen/valgrind/dune

(executable
 (name array_runtime_test)
 (modules array_runtime_test)
 (libraries gtk4))

(rule
 (alias runtest)
 (deps array_runtime_test.exe)
 (action
  (run valgrind
       --error-exitcode=1
       --leak-check=full
       --errors-for-leak-kinds=definite
       ./array_runtime_test.exe)))
```

Then create `array_runtime_test.ml`:

```ocaml
(* src/tools/test_gir_gen/valgrind/array_runtime_test.ml *)

let test_string_arrays () =
  Gtk.init ();
  let dialog = Gtk.AboutDialog.create () in

  (* Test input arrays *)
  Gtk.AboutDialog.set_authors dialog [| "Author 1"; "Author 2" |];
  Gtk.AboutDialog.set_artists dialog [| "Artist 1" |];

  (* Test output arrays *)
  let authors = Gtk.AboutDialog.get_authors dialog in
  let artists = Gtk.AboutDialog.get_artists dialog in

  assert (Array.length authors = 2);
  assert (Array.length artists = 1);

  (* Stress test *)
  for _ = 1 to 100 do
    Gtk.AboutDialog.set_authors dialog [| "Test" |];
    ignore (Gtk.AboutDialog.get_authors dialog)
  done

let () =
  test_string_arrays ();
  print_endline "All tests passed"
```

Run with:
```bash
dune runtest --force
```

### Approach 3: CI/CD Integration

Add to `.github/workflows/test.yml`:

```yaml
name: Tests

on: [push, pull_request]

jobs:
  valgrind:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2

      - name: Install dependencies
        run: |
          sudo apt-get update
          sudo apt-get install -y valgrind libgtk-4-dev ocaml opam
          opam init -y
          opam install -y dune gtk4

      - name: Build
        run: dune build

      - name: Generate test bindings
        run: |
          dune exec src/tools/gir_gen/main.exe -- \
            -c AboutDialog \
            /usr/share/gir-1.0/Gtk-4.0.gir \
            _test_bindings

      - name: Run valgrind tests
        run: |
          cd _test_bindings
          ./test_arrays_valgrind.sh

      - name: Upload valgrind logs
        if: failure()
        uses: actions/upload-artifact@v2
        with:
          name: valgrind-logs
          path: _test_bindings/*.valgrind
```

## Common Issues and Solutions

### Issue: OCaml runtime shows "leaks"
**Solution:** Use suppressions file:

```
# ocaml.supp
{
   OCaml_runtime_allocations
   Memcheck:Leak
   ...
   fun:caml_*
}
```

### Issue: GTK shows leaks
**Solution:** Use GTK suppressions:
```bash
--suppressions=/usr/share/glib-2.0/valgrind/glib.supp
```

### Issue: Can't reproduce in CI
**Solution:**
- Use same GTK version as development
- Install debug symbols: `libgtk-4-dev-dbg`
- Use `--gen-suppressions=all` to generate suppressions

## Expected Test Coverage

For array handling, valgrind tests should verify:

1. ✅ **Input string arrays (TransferNone)** - freed after call
2. ✅ **Output string arrays (TransferNone)** - not freed (GTK owns)
3. ✅ **Output string arrays (TransferFull)** - each string freed + container
4. ✅ **Input int arrays** - freed after call
5. ✅ **Out-parameter arrays** - proper cleanup based on transfer
6. ✅ **Repeated calls** - no accumulating leaks

## Summary

**Can it be automated?** Yes, with:
- Bash scripts for quick verification
- Dune rules for CI integration
- GitHub Actions for pull request checks

**Is it worth automating?**
- For development: Manual testing sufficient
- For production: Automated CI checks recommended
- For releases: Required before each release

The current unit tests verify *code generation correctness*.
Valgrind tests would verify *runtime memory safety*.
Both are valuable but serve different purposes.
