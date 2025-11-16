# Memory Leak Testing with Valgrind

This document describes how to use Valgrind to test for memory leaks in LablGTK4.

## Why Valgrind Testing?

Memory leaks in GUI applications can:
- Cause applications to slow down over time
- Lead to crashes after extended use
- Waste system resources

LablGTK4 involves complex C FFI bindings with:
- Manual memory management
- GObject reference counting
- OCaml global roots
- GTK widget ownership

Valgrind helps detect:
- Memory leaks (allocated but never freed)
- Use-after-free bugs
- Invalid memory access
- Uninitialized memory use

---

## Quick Start

### Install Valgrind

```bash
# Ubuntu/Debian
sudo apt-get install valgrind

# Fedora
sudo dnf install valgrind

# macOS (requires Homebrew)
brew install valgrind
```

### Run Tests

```bash
# Run all Phase 3 tests with valgrind
cd lablgtk4
./run_valgrind_tests.sh

# Run specific test
./run_valgrind_tests.sh test_event_controller

# Run multiple tests
./run_valgrind_tests.sh test_widget test_snapshot
```

### Check Results

```bash
# Logs are saved in valgrind_logs/
ls valgrind_logs/

# View detailed log
cat valgrind_logs/test_event_controller.log

# Search for leaks
grep "definitely lost" valgrind_logs/*.log
```

---

## Understanding Output

### Clean Test (No Leaks)

```
Testing: test_event_controller
  Log: valgrind_logs/test_event_controller.log
  ✓ PASS - No memory leaks detected
```

### Failed Test (Leaks Detected)

```
Testing: test_widget
  Log: valgrind_logs/test_widget.log
  ✗ FAIL - Memory leaks detected

  Leak summary:
    definitely lost: 1,024 bytes in 16 blocks
    indirectly lost: 512 bytes in 8 blocks
```

---

## Interpreting Valgrind Reports

### Leak Categories

| Category | Meaning | Action Required |
|----------|---------|-----------------|
| **definitely lost** | Memory allocated but never freed | **FIX IMMEDIATELY** |
| **indirectly lost** | Pointers to leaked memory | Often fixed by fixing "definitely lost" |
| **possibly lost** | Pointers might be lost (ambiguous) | Investigate if recurring |
| **still reachable** | Memory referenced at exit | Usually intentional (caches, globals) |

### Example Leak Report

```
==12345== 1,024 bytes in 16 blocks are definitely lost in loss record 123 of 456
==12345==    at 0x4C2FB0F: malloc (vg_replace_malloc.c:299)
==12345==    by 0x12345678: ml_gtk_event_controller_key_connect_key_pressed (ml_event_controller.c:215)
==12345==    by 0x87654321: caml_c_call (in /usr/lib/ocaml/libasmrun.so)
==12345==    by 0x11223344: camlTest_event_controller__entry (test_event_controller.ml:25)
```

**Reading this:**
1. Line 1: 1,024 bytes leaked across 16 allocations
2. Line 2: Allocated by `malloc`
3. Line 3: From our C function `ml_gtk_event_controller_key_connect_key_pressed`
4. Line 4: Called from OCaml runtime
5. Line 5: Triggered by OCaml code at `test_event_controller.ml:25`

---

## Suppressions File

The `valgrind.supp` file suppresses known "leaks" from GTK/GLib that are:
- Intentional caches (font cache, type system)
- Display connections (cleaned up by OS)
- Singleton objects (cleaned up at exit)

### When to Update Suppressions

**DO update** when:
- GTK/GLib reports benign leaks
- System library reports false positives
- X11/Wayland backend reports display leaks

**DON'T suppress** when:
- Your C code leaks memory
- OCaml global roots aren't freed
- Widget references aren't released

### Adding a Suppression

If you see a false positive leak from GTK:

```bash
# Run with suppression generation
valgrind --gen-suppressions=all \
  --suppressions=valgrind.supp \
  ./_build/default/tests/test_widget.exe 2>&1 | less

# Look for blocks like:
# {
#    <insert_a_suppression_name_here>
#    Memcheck:Leak
#    match-leak-kinds: definite
#    fun:malloc
#    fun:gtk_something_init
# }

# Copy to valgrind.supp with descriptive name
```

---

## Advanced Usage

### Custom Valgrind Options

```bash
# More verbose output
VALGRIND_OPTS="--leak-check=full --show-leak-kinds=all --verbose" \
  ./run_valgrind_tests.sh

# Track origins of uninitialized values
VALGRIND_OPTS="--track-origins=yes" \
  ./run_valgrind_tests.sh

# Generate suppressions for new false positives
VALGRIND_OPTS="--gen-suppressions=all" \
  ./run_valgrind_tests.sh
```

### Run Single Test Manually

```bash
# Build first
dune build tests/test_event_controller.exe

# Run with valgrind
valgrind --leak-check=full \
  --suppressions=valgrind.supp \
  --log-file=valgrind.log \
  ./_build/default/tests/test_event_controller.exe

# Check log
cat valgrind.log
```

---

## CI Integration

### Add to GitHub Actions

```yaml
# .github/workflows/ci.yml
- name: Run Valgrind Tests
  run: |
    sudo apt-get install -y valgrind
    cd lablgtk4
    ./run_valgrind_tests.sh
```

### Pre-commit Hook

```bash
# .git/hooks/pre-commit
#!/bin/bash
cd lablgtk4
./run_valgrind_tests.sh
if [ $? -ne 0 ]; then
    echo "Valgrind tests failed - commit aborted"
    exit 1
fi
```

---

## Common Issues and Solutions

### Issue: Too Many False Positives

**Problem**: Hundreds of leaks reported from GTK/GLib

**Solution**: Ensure `valgrind.supp` is being used:
```bash
valgrind --suppressions=valgrind.supp ...
```

---

### Issue: "Still Reachable" Leaks

**Problem**: Valgrind reports many "still reachable" blocks

**Explanation**: These are typically:
- GType system registrations
- Font caches
- Display connections

These are **intentional** and cleaned up by the OS on process exit.

**Action**: Only worry about "definitely lost" and "indirectly lost".

---

### Issue: OCaml Runtime Leaks

**Problem**: Leaks from `caml_*` functions

**Possible Causes**:
1. Forgot to use `CAMLparam`/`CAMLreturn` in C functions
2. Allocated OCaml values not properly registered
3. Missing `CAMLlocal` declarations

**Solution**: Review C code for proper FFI usage (see `FFI_GUIDELINES.md`).

---

### Issue: GObject Reference Leaks

**Problem**: GObject widgets leak after test

**Possible Causes**:
1. Forgot to call `g_object_unref`
2. Event controller added but widget never destroyed
3. Signal handlers hold extra references

**Solution**:
```c
/* Always ref count when storing GObjects */
GtkWidget *widget = gtk_button_new();
// Do NOT manually unref - GTK manages this

/* For controllers, widget takes ownership */
GtkEventController *ctrl = gtk_event_controller_key_new();
gtk_widget_add_controller(widget, ctrl);
// Widget owns ctrl now - don't unref
```

---

## Best Practices

### 1. Run Valgrind Regularly

- ✅ After implementing new C bindings
- ✅ Before committing FFI changes
- ✅ In CI for every pull request

### 2. Fix Leaks Immediately

Don't accumulate technical debt:
- Small leaks become large leaks
- One leak can mask others
- Harder to debug later

### 3. Test with Realistic Scenarios

```ocaml
(* Test repeated operations *)
for i = 1 to 1000 do
  let controller = EventControllerKey.new_ () in
  let _sig_id = EventControllerKey.connect_key_pressed controller ~callback:... in
  widget#add_controller controller
done;
(* Should not leak on each iteration *)
```

### 4. Document Known Issues

If a leak is unavoidable:
```c
/* KNOWN LEAK: GTK4 keeps display connection alive for app lifetime.
 * This is expected and cleaned up by OS on process exit.
 * Suppressed in valgrind.supp */
GdkDisplay *display = gdk_display_get_default();
```

---

## Debugging Tips

### 1. Isolate the Leak

```ocaml
(* Minimal reproduction *)
let test_leak () =
  (* Create the object *)
  let controller = EventControllerKey.new_ () in

  (* Use it *)
  let _sig_id = EventControllerKey.connect_key_pressed controller
    ~callback:(fun ~keyval ~keycode ~state -> false) in

  (* Does it leak here? *)
  Gc.full_major ();  (* Force GC *)
  ()

let () = test_leak ()
```

### 2. Use Valgrind Options

```bash
# Show full stack traces
valgrind --leak-check=full --num-callers=40 ...

# Track individual allocation sites
valgrind --leak-check=full --show-leak-kinds=all --track-origins=yes ...
```

### 3. Check OCaml Side

```ocaml
(* Before test *)
let before = Gc.quick_stat () in

(* Run test *)
test_function ();

(* After test *)
Gc.full_major ();
let after = Gc.quick_stat () in

Printf.printf "Heap growth: %d words\n"
  (after.Gc.live_words - before.Gc.live_words);
```

---

## See Also

- `FFI_GUIDELINES.md` - Best practices for C bindings
- `SECURITY_GUIDELINES.md` - Security considerations
- [Valgrind Quick Start](https://valgrind.org/docs/manual/quick-start.html)
- [GObject Memory Management](https://docs.gtk.org/gobject/concepts.html#reference-counts-and-memory-management)
