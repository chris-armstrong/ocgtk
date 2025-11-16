# Phase 3 Valgrind Testing - Implementation Plan

**Created**: November 16, 2025
**Status**: 📋 **Recommended for Implementation**
**Priority**: MEDIUM (not blocking Phase 4, but important for quality)

---

## Current State

### ✅ Existing Memory Testing (Good Foundation)

**Test files present:**

1. **test_closure_stress.ml** (2.2KB)
   - Creates 1000+ closures
   - Tests rapid allocation/deallocation
   - Tests closure invocation with parameters
   - Verifies no crashes under stress

2. **test_closure_with_gc.ml** (2.2KB)
   - Tests closure behavior with explicit GC
   - Forces `Gc.minor()` between allocations
   - Verifies GC-safe implementation
   - Tests with different GC timing patterns

**What these tests verify:**
- ✅ No crashes from GC interaction
- ✅ Closures remain valid after GC
- ✅ Global root management works
- ✅ Parameter marshalling correct

**What these tests DON'T catch:**
- ❌ Memory leaks (memory not freed)
- ❌ Use-after-free bugs
- ❌ Invalid reads/writes
- ❌ Uninitialized memory access
- ❌ Double frees

### ❌ Missing: Valgrind Integration

**Port-phase3.md requirement** (line 1836):
> - [ ] No memory leaks (valgrind clean)

**Current status:**
- ✅ Valgrind installed in CI environment
- ❌ No CI step to run valgrind
- ❌ No valgrind test scripts
- ❌ No memory leak baselines established

---

## Why Valgrind Matters for Phase 3

### Critical Areas to Validate

**1. Event Controller Callbacks** (Phase 3.3)
- Controllers register OCaml callbacks with GTK
- Callbacks captured in global roots
- Need to verify:
  - Global roots properly removed on controller destruction
  - No leaks when attaching/detaching controllers
  - Signal handler cleanup complete

**2. GClosure Management** (Phase 3.4)
- GObj.controller_ops creates GClosures
- Each closure wraps OCaml callback
- Need to verify:
  - GClosure ref counting correct
  - OCaml callback global roots cleaned up
  - No leaks in closure marshalling

**3. GTK Object Lifecycle**
- GMain.init() initializes GTK
- Event controllers created/destroyed
- Need to verify:
  - GTK objects properly finalized
  - No leaks in GTK initialization
  - Display/surface cleanup correct

**4. String/Array Conversions**
- CSS class lists
- Widget names
- State flags
- Need to verify:
  - String allocations freed
  - Array conversions don't leak
  - Temporary buffers cleaned up

---

## Implementation Plan

### Step 1: Create Valgrind Test Script (15 minutes)

**File**: `lablgtk4/run_valgrind_tests.sh`

```bash
#!/bin/bash
# Run tests under valgrind to check for memory leaks

set -e

VALGRIND_OPTS="
    --leak-check=full
    --show-leak-kinds=all
    --track-origins=yes
    --verbose
    --error-exitcode=1
    --suppressions=valgrind.supp
"

# OCaml has some known "leaks" that aren't real leaks
# We'll create a suppressions file for those

echo "=== Running tests under valgrind ==="
echo ""

# Test 1: Closure stress test (most likely to leak)
echo "Test 1: Closure stress test..."
xvfb-run -a valgrind $VALGRIND_OPTS \
    ./_build/default/tests/test_closure_stress.exe || {
    echo "❌ FAILED: Memory leaks detected in closure stress test"
    exit 1
}
echo "✅ PASSED: No leaks in closure stress test"
echo ""

# Test 2: Closure with GC (tests cleanup under GC pressure)
echo "Test 2: Closure with GC..."
xvfb-run -a valgrind $VALGRIND_OPTS \
    ./_build/default/tests/test_closure_with_gc.exe || {
    echo "❌ FAILED: Memory leaks detected in closure GC test"
    exit 1
}
echo "✅ PASSED: No leaks in closure GC test"
echo ""

# Test 3: Event controller runtime (tests controller lifecycle)
echo "Test 3: Event controller runtime..."
xvfb-run -a valgrind $VALGRIND_OPTS \
    ./_build/default/tests/test_event_controller_runtime.exe || {
    echo "❌ FAILED: Memory leaks detected in event controller test"
    exit 1
}
echo "✅ PASSED: No leaks in event controller test"
echo ""

# Test 4: GObj wrapper (tests high-level wrapper lifecycle)
echo "Test 4: GObj wrapper..."
xvfb-run -a valgrind $VALGRIND_OPTS \
    ./_build/default/tests/test_gobj.exe || {
    echo "❌ FAILED: Memory leaks detected in GObj test"
    exit 1
}
echo "✅ PASSED: No leaks in GObj test"
echo ""

# Test 5: Integration tests (comprehensive)
echo "Test 5: Integration tests..."
xvfb-run -a valgrind $VALGRIND_OPTS \
    ./_build/default/tests/test_integration.exe || {
    echo "❌ FAILED: Memory leaks detected in integration test"
    exit 1
}
echo "✅ PASSED: No leaks in integration test"
echo ""

echo "=== All valgrind tests passed! ==="
echo "No memory leaks detected."
```

**Make executable:**
```bash
chmod +x lablgtk4/run_valgrind_tests.sh
```

### Step 2: Create Valgrind Suppressions File (30 minutes)

**File**: `lablgtk4/valgrind.supp`

OCaml runtime has some "still reachable" memory that's not actually leaked. We suppress these known issues:

```
{
   OCaml_runtime_init
   Memcheck:Leak
   match-leak-kinds: reachable
   fun:malloc
   ...
   fun:caml_init_*
}

{
   OCaml_page_table
   Memcheck:Leak
   match-leak-kinds: reachable
   fun:malloc
   ...
   fun:caml_page_table_*
}

{
   GTK_type_system_init
   Memcheck:Leak
   match-leak-kinds: reachable
   fun:malloc
   ...
   fun:g_type_register_*
}

{
   GTK_display_init
   Memcheck:Leak
   match-leak-kinds: reachable
   fun:malloc
   ...
   fun:gdk_display_*
}

{
   Pango_font_map
   Memcheck:Leak
   match-leak-kinds: reachable
   fun:malloc
   ...
   fun:pango_cairo_font_map_*
}
```

**Note**: We'll need to refine this after running valgrind and seeing actual output.

### Step 3: Add Valgrind to CI (20 minutes)

**Update**: `.github/workflows/ci.yml`

Add new step after regular tests:

```yaml
      - name: Run all tests
        working-directory: lablgtk4
        run: |
          # Use xvfb-run to provide virtual display for GTK runtime tests
          opam exec -- xvfb-run -a ./run_tests.sh

      # NEW: Valgrind memory leak testing
      - name: Install valgrind
        run: |
          sudo apt-get install -y valgrind

      - name: Run valgrind memory leak tests
        working-directory: lablgtk4
        run: |
          # Run subset of tests under valgrind (slower)
          opam exec -- ./run_valgrind_tests.sh
        continue-on-error: true  # Don't fail CI initially, just warn
```

**Note**: Set `continue-on-error: true` initially to see results without blocking CI.

### Step 4: Document Valgrind Testing (15 minutes)

**Update**: `lablgtk4/TESTING_WITH_GMAIN.md`

Add section:

```markdown
## Memory Leak Testing with Valgrind

### Running Valgrind Locally

```bash
cd lablgtk4
dune build
./run_valgrind_tests.sh
```

### Understanding Valgrind Output

**Definite leaks**: Memory allocated but never freed
- **Action Required**: Fix immediately

**Indirect leaks**: Memory referenced only by leaked pointers
- **Action Required**: Fix the definite leak

**Possibly lost**: Pointers to middle of allocated blocks
- **Review**: May be false positive, investigate

**Still reachable**: Memory not freed but still pointed to at exit
- **Usually OK**: OCaml runtime keeps some globals

### Common Leak Patterns to Watch For

1. **Global root not removed**:
   ```c
   value *root = ml_global_root_new(callback);
   // ... use root ...
   // BUG: Never called ml_global_root_destroy(root)
   ```

2. **GObject not unreffed**:
   ```c
   GtkEventController *ctrl = gtk_event_controller_key_new();
   // ... use ctrl ...
   // BUG: Never called g_object_unref(ctrl)
   ```

3. **String not freed**:
   ```c
   char *str = g_strdup(String_val(ocaml_str));
   // ... use str ...
   // BUG: Never called g_free(str)
   ```
```

---

## Expected Results

### Likely Findings (Initial Run)

Based on the code review, we'll likely find:

**Clean (No Leaks Expected):**
- ✅ GClosure implementation (already has proper cleanup)
- ✅ Event controller creation/destruction
- ✅ Basic widget operations

**Potential Issues to Investigate:**

1. **GTK Initialization** (`GMain.init()`)
   - GTK keeps some global state
   - May show as "still reachable"
   - Need suppressions for these

2. **Display/Surface Objects**
   - If not properly cleaned up
   - May leak in test teardown

3. **String Conversions**
   - CSS class lists
   - Widget names
   - Check all `String_val()` usages

### Success Criteria

**Valgrind tests pass when:**
- Zero "definitely lost" bytes
- Zero "indirectly lost" bytes
- All "possibly lost" investigated and either fixed or suppressed
- "Still reachable" only from known OCaml/GTK globals (suppressed)

---

## Timeline Estimate

| Task | Time | Who |
|------|------|-----|
| Create run_valgrind_tests.sh | 15 min | Developer |
| Create initial valgrind.supp | 30 min | Developer |
| Run first valgrind pass | 15 min | Developer |
| Investigate and fix leaks | 2-4 hrs | Developer |
| Refine suppressions | 30 min | Developer |
| Add to CI | 20 min | Developer |
| Update documentation | 15 min | Developer |
| **Total** | **4-6 hours** | |

**Can be parallelized**: One person can work on this while another starts Phase 4.

---

## Integration Strategy

### Option 1: Before Phase 4 (Recommended for Quality)

**Pros:**
- Ensures clean baseline before adding containers
- Easier to isolate leaks in Phase 3 code
- Validates current implementation

**Cons:**
- Delays Phase 4 start by ~1 day

**Timeline Impact**: +1 day before Phase 4

### Option 2: During Phase 4 (Recommended for Speed)

**Pros:**
- Doesn't delay Phase 4
- Can be done in parallel
- Catches Phase 4 leaks early too

**Cons:**
- Harder to isolate Phase 3 vs Phase 4 leaks
- May find issues after Phase 4 code written

**Timeline Impact**: No delay, but ongoing validation

### Option 3: After Phase 4 (Not Recommended)

**Pros:**
- Maximum parallelism

**Cons:**
- Leaks may accumulate
- Harder to debug when found late
- May require rework

**Timeline Impact**: Risk of technical debt

---

## Recommendation

### Preferred Approach: Option 2 (During Phase 4)

**Rationale:**
1. Phase 3 is 95% complete and appears solid
2. Existing GC stress tests provide confidence
3. Can validate incrementally during Phase 4
4. Doesn't block Phase 4 start

**Implementation:**
1. **Week 1 of Phase 4**: Set up valgrind testing (4-6 hours)
2. **Week 2 of Phase 4**: Run first valgrind pass, fix any issues
3. **Week 3 of Phase 4**: Add to CI with suppressions
4. **Ongoing**: Run valgrind on Phase 4 code as written

### Quick Start (Immediate Action)

**30-minute setup** to get started today:

```bash
cd lablgtk4

# 1. Create basic test script (5 min)
cat > run_valgrind_quick.sh << 'EOF'
#!/bin/bash
set -e
echo "Quick valgrind check on closure test..."
xvfb-run -a valgrind \
    --leak-check=full \
    --error-exitcode=1 \
    ./_build/default/tests/test_closure_stress.exe
echo "✅ No leaks detected!"
EOF
chmod +x run_valgrind_quick.sh

# 2. Run it (15 min)
dune build tests/test_closure_stress.exe
./run_valgrind_quick.sh

# 3. Review results (10 min)
# If clean: Great! Continue to Phase 4
# If leaks: Investigate and fix before Phase 4
```

---

## Alternative: Lightweight Memory Monitoring

If full valgrind is too slow, consider:

### AddressSanitizer (ASan)

**Faster than valgrind**, catches:
- Use-after-free
- Heap buffer overflow
- Stack buffer overflow
- Use-after-return

**Enable with:**
```bash
# In dune file
(env
 (dev
  (flags (:standard -g))
  (c_flags (:standard -fsanitize=address))
  (link_flags (:standard -fsanitize=address))))
```

**Pros:**
- Much faster than valgrind (2-4x slowdown vs 10-20x)
- Catches more bug types
- Better error messages

**Cons:**
- Requires recompilation
- May conflict with OCaml runtime

---

## Summary

**Current Status:**
- ✅ Good foundation with GC stress tests
- ❌ No valgrind integration yet

**Recommendation:**
- ✅ Set up valgrind during Phase 4 (Option 2)
- ✅ Takes 4-6 hours total
- ✅ Doesn't block Phase 4 start
- ✅ Provides ongoing validation

**Immediate Action:**
- Run 30-minute quick check with valgrind
- If clean: proceed to Phase 4 with confidence
- If issues: fix before Phase 4 (estimated 2-4 hrs)

**Priority**: MEDIUM
- Not blocking for Phase 4
- Important for production quality
- Should be done before Phase 5

---

## Resources

**Valgrind Documentation:**
- https://valgrind.org/docs/manual/mc-manual.html
- https://valgrind.org/docs/manual/manual-core.html#manual-core.suppress

**OCaml Valgrind Best Practices:**
- OCaml runtime has legitimate "still reachable" memory
- Focus on "definitely lost" and "indirectly lost"
- Use suppressions for known false positives

**GTK Valgrind Notes:**
- GTK type system keeps global caches
- Display/Screen objects may persist
- Font caches are often "still reachable"

---

**Ready to implement when you are!**

Valgrind testing will provide confidence that Phase 3's memory management is solid before building Phase 4 on top of it.
