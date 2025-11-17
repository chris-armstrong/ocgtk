# Phase 5.3: Text Widgets Implementation Plan

**Status**: 📋 Ready to Start
**Estimated Time**: 0.5-1 week
**Dependencies**: Phase 5.0 (GIR generator), Phase 5.2 (generators complete), nullable parameter support

---

## Overview

Phase 5.3 implements comprehensive text editing support for GTK4 through automated code generation for the GtkTextView family of widgets. This is one of the most complex widget categories due to:

1. **Iterator types** (GtkTextIter) - Stack-allocated structures requiring special FFI handling
2. **Buffer manipulation** - Complex text operations with marks and tags
3. **Rich text support** - Tags for fonts, colors, and formatting
4. **Signal coordination** - Multiple signals across TextView, TextBuffer, and TextTag

**Key Difference from GTK3**: Most APIs remain similar, but some properties and signals have changed.

---

## Objectives

1. ✅ Generate C FFI bindings for all text widgets using enhanced gir_gen
2. ✅ Handle special cases (TextIter stack allocation, nullable parameters)
3. ✅ Create high-level GText wrapper module
4. ✅ Implement comprehensive tests for text editing scenarios
5. ✅ Document usage patterns and migration notes

---

## Widget Classes to Generate

### Core Text Widgets

| Widget | Purpose | Complexity | GIR Available |
|--------|---------|------------|---------------|
| GtkTextView | Main text display/edit widget | Medium | ✅ Yes |
| GtkTextBuffer | Text storage and manipulation | High | ✅ Yes |
| GtkTextTag | Text formatting attributes | Low | ✅ Yes |
| GtkTextTagTable | Tag storage and lookup | Low | ✅ Yes |
| GtkTextIter | Text position iterator | **Very High** | ⚠️ Partial |
| GtkTextMark | Named text position | Medium | ✅ Yes |

### Complexity Notes

- **GtkTextIter**: Stack-allocated structure (not heap-allocated like other GTK objects)
  - Requires custom wrapper type in OCaml
  - Cannot use standard GtkWidget_val macros
  - May need manual FFI bindings instead of generation

- **Nullable Parameters**: Many text methods accept nullable TextIter, TextMark, or TextTag
  - Requires nullable parameter support (✅ implemented in current task)

---

## Implementation Steps

### Step 1: Configure Widget Filter (30 minutes)

**File**: `lablgtk4/src/tools/widget_filter.conf`

Add text widgets to generation filter:

```conf
# Phase 5.3: Text Widgets
GtkTextView
GtkTextBuffer
GtkTextTag
GtkTextTagTable
GtkTextMark

# Note: GtkTextIter will need manual handling
# It's a stack-allocated struct, not a GObject
```

### Step 2: Generate Bindings with gir_gen (1 hour)

**Commands**:

```bash
cd lablgtk4

# Generate text widget bindings
dune exec src/tools/gir_gen.exe -- \
  -mode widgets \
  -filter src/tools/widget_filter.conf \
  /usr/share/gir-1.0/Gtk-4.0.gir \
  src/

# This generates:
# - src/ml_event_controllers_gen.c (C FFI bindings)
# - src/gtk_text_view.mli
# - src/gtk_text_buffer.mli
# - src/gtk_text_tag.mli
# - src/gtk_text_tag_table.mli
# - src/gtk_text_mark.mli
```

**Expected Output**:
- 5 .mli files generated
- C bindings for constructors, methods, properties
- Nullable parameter support for optional TextMark/TextTag arguments

**Known Issues**:
- GtkTextIter may not generate correctly (stack-allocated struct)
- Some advanced text buffer methods may need manual additions

### Step 3: Handle GtkTextIter Special Case (2-3 hours)

**Problem**: GtkTextIter is a stack-allocated structure, not a GObject pointer.

**Solution Options**:

#### Option A: Manual Wrapper (Recommended for Phase 5.3)

Create manual OCaml wrapper for TextIter:

**File**: `lablgtk4/src/gtkTextIter.ml`

```ocaml
(* Manual wrapper for stack-allocated GtkTextIter *)
type t = {
  buffer : GtkTextBuffer.t;
  mutable offset : int;
  (* Internal opaque data - managed by C side *)
}

(* C stubs will handle conversion between OCaml record and GtkTextIter* *)
```

**File**: `lablgtk4/src/ml_gtk_text.c`

```c
/* Custom TextIter handling */

typedef struct {
  value buffer;      /* GtkTextBuffer */
  GtkTextIter iter;  /* Actual stack-allocated iterator */
} ml_text_iter_wrapper;

#define TextIter_val(v) ((ml_text_iter_wrapper*)Data_custom_val(v))

CAMLprim value ml_gtk_text_iter_create(value buffer) {
  CAMLparam1(buffer);
  CAMLlocal1(result);

  ml_text_iter_wrapper *wrapper = malloc(sizeof(ml_text_iter_wrapper));
  wrapper->buffer = buffer;
  gtk_text_buffer_get_start_iter(GtkWidget_val(buffer), &wrapper->iter);

  result = caml_alloc_custom(&text_iter_ops, sizeof(ml_text_iter_wrapper*), 0, 1);
  Data_custom_val(result) = wrapper;

  caml_register_global_root(&wrapper->buffer);
  CAMLreturn(result);
}

/* ... more TextIter operations ... */
```

#### Option B: Enhance gir_gen (Future Phase)

Add special handling for stack-allocated types in gir_gen.ml:

- Detect `<record>` types vs `<class>` types in GIR
- Generate custom block allocation for stack types
- Generate copy/free operations

**For Phase 5.3**: Use Option A (manual wrapper). Option B can be deferred to Phase 6.

### Step 4: Generate .ml Implementation Files (30 minutes)

**Commands**:

```bash
cd lablgtk4

# Generate .ml files from .mli interfaces
dune exec src/tools/ml_impl_gen.exe -- \
  src/gtk_text_view.mli -o src/gtk_text_view.ml

dune exec src/tools/ml_impl_gen.exe -- \
  src/gtk_text_buffer.mli -o src/gtk_text_buffer.ml

dune exec src/tools/ml_impl_gen.exe -- \
  src/gtk_text_tag.mli -o src/gtk_text_tag.ml

dune exec src/tools/ml_impl_gen.exe -- \
  src/gtk_text_tag_table.mli -o src/gtk_text_tag_table.ml

dune exec src/tools/ml_impl_gen.exe -- \
  src/gtk_text_mark.mli -o src/gtk_text_mark.ml
```

### Step 5: Create High-Level GText Wrapper (3-4 hours)

**File**: `lablgtk4/src/gText.ml`, `lablgtk4/src/gText.mli`

**Purpose**: Provide OCaml-friendly class-based API on top of generated bindings.

**Key Features**:
- Object-oriented wrappers for TextView, TextBuffer, TextTag
- Convenient constructors and methods
- Signal connection helpers
- Integration with existing lablgtk patterns

**Example Structure**:

```ocaml
(** High-level text editing wrappers *)

(** {2 Text Buffer} *)

class buffer_skel (buffer : GtkTextBuffer.t) = object
  method as_buffer = buffer

  method text = GtkTextBuffer.get_text buffer
  method set_text text = GtkTextBuffer.set_text buffer text

  method insert ~iter text =
    (* Handle TextIter conversion *)
    GtkTextBuffer.insert buffer iter text

  method delete ~start ~stop =
    GtkTextBuffer.delete buffer start stop

  method create_mark ?name ~iter ~left_gravity =
    GtkTextBuffer.create_mark buffer name iter left_gravity

  method apply_tag tag ~start ~stop =
    GtkTextBuffer.apply_tag buffer tag start stop
end

class buffer obj = object
  inherit buffer_skel (GtkTextBuffer.coerce obj)
end

let buffer ?text () =
  let buf = GtkTextBuffer.new_ () in
  (match text with
   | Some t -> GtkTextBuffer.set_text buf t
   | None -> ());
  new buffer buf

(** {2 Text View} *)

class view_skel (view : GtkTextView.t) = object
  inherit GObj.widget_impl (Gtk.Widget.coerce view)

  method buffer =
    new buffer (GtkTextView.get_buffer view)

  method set_buffer (buf : buffer) =
    GtkTextView.set_buffer view buf#as_buffer

  method set_editable editable =
    GtkTextView.set_editable view editable

  method editable =
    GtkTextView.get_editable view

  method set_cursor_visible visible =
    GtkTextView.set_cursor_visible view visible

  method set_wrap_mode mode =
    GtkTextView.set_wrap_mode view mode

  method set_left_margin margin =
    GtkTextView.set_left_margin view margin

  method set_right_margin margin =
    GtkTextView.set_right_margin view margin
end

class view obj = object
  inherit view_skel (Gtk.Widget.coerce obj)
end

let view ?buffer ?editable ?cursor_visible ?wrap_mode ?packing ?show () =
  let tv = GtkTextView.new_ () in
  let widget = new view tv in

  (match buffer with Some b -> widget#set_buffer b | None -> ());
  (match editable with Some e -> widget#set_editable e | None -> ());
  (match cursor_visible with Some v -> widget#set_cursor_visible v | None -> ());
  (match wrap_mode with Some m -> widget#set_wrap_mode m | None -> ());
  (match packing with Some f -> f (widget :> GObj.widget) | None -> ());
  if show = Some true then widget#show;
  widget

(** {2 Text Tags} *)

class tag_skel (tag : GtkTextTag.t) = object
  method as_tag = tag

  method set_property name value =
    (* Property setting via g_object_set *)
    GtkTextTag.set_property tag name value
end

class tag obj = object
  inherit tag_skel obj
end

let tag ?name ?properties () =
  let t = match name with
    | Some n -> GtkTextTag.new_with_name n
    | None -> GtkTextTag.new_ ()
  in
  (* Apply properties *)
  (match properties with
   | Some props -> List.iter (fun (k, v) -> GtkTextTag.set_property t k v) props
   | None -> ());
  new tag t

(** {2 Convenience Functions} *)

let tag_table () =
  new tag_table_wrapper (GtkTextTagTable.new_ ())
```

**Migration from lablgtk3**:

Check lablgtk3 for reference:
```bash
grep -A 50 "class buffer" lablgtk3/src/gText.ml
grep -A 50 "class view" lablgtk3/src/gText.ml
```

### Step 6: Update Build Configuration (30 minutes)

**File**: `lablgtk4/src/dune`

Add generated modules and C files:

```lisp
(library
 (name lablgtk4)
 (public_name lablgtk4)
 (wrapped false)
 (c_names
   wrappers
   ml_glib ml_gobject ml_gdk ml_gdkpixbuf
   ml_gdk_clipboard ml_pango ml_gtk
   ml_event_controllers_gen  ; Generated C file
   ml_gtk_text)              ; Manual TextIter handling
 (c_library_flags :standard -lgtk-4 -lgobject-2.0 -lglib-2.0)
 (modules
   ; Existing modules
   gpointer glib gobject gdk gdkPixbuf pango gtk

   ; Generated text modules
   gtkTextView gtkTextBuffer gtkTextTag gtkTextTagTable gtkTextMark
   gtkTextIter  ; Manual wrapper

   ; High-level wrapper
   gText))
```

### Step 7: Testing (2-3 hours)

**File**: `lablgtk4/tests/test_text.ml`

**Test Categories**:

1. **TextBuffer Tests**:
   - Create buffer, set/get text
   - Insert text at position
   - Delete text ranges
   - Create and use marks
   - Apply tags to ranges

2. **TextView Tests**:
   - Create view with buffer
   - Set editable, cursor_visible
   - Set wrap mode
   - Set margins

3. **TextTag Tests**:
   - Create tags with properties
   - Apply tags to buffer ranges
   - Tag lookup in tag table

4. **TextIter Tests** (if manual wrapper implemented):
   - Create iterators
   - Move forward/backward
   - Get line/offset
   - Compare iterators

**Example Test**:

```ocaml
open Alcotest

let require_gtk f () =
  try
    let _ = GMain.init () in
    f ()
  with GMain.Error _ -> skip ()

let test_text_buffer_basic () =
  let buf = GText.buffer ~text:"Hello, World!" () in
  check string "buffer text" "Hello, World!" buf#text;

  buf#set_text "Updated text";
  check string "buffer updated" "Updated text" buf#text

let test_text_view_creation () =
  let buf = GText.buffer ~text:"Test" () in
  let view = GText.view ~buffer:buf ~editable:true () in
  check bool "view editable" true view#editable;
  check string "view buffer text" "Test" view#buffer#text

let test_text_tag_application () =
  let buf = GText.buffer ~text:"Bold text here" () in
  let tag = GText.tag ~name:"bold" ~properties:[("weight", `INT 700)] () in

  (* Apply tag to "Bold" *)
  let start_iter = (* create iter at offset 0 *) in
  let end_iter = (* create iter at offset 4 *) in
  buf#apply_tag tag start_iter end_iter;

  (* Verify tag is in table *)
  check bool "tag in table" true
    (GtkTextTagTable.lookup buf#tag_table "bold" <> None)

let () =
  run "Text Widget Tests" [
    "buffer", [
      test_case "buffer_basic" `Quick (require_gtk test_text_buffer_basic);
    ];
    "view", [
      test_case "view_creation" `Quick (require_gtk test_text_view_creation);
    ];
    "tags", [
      test_case "tag_application" `Quick (require_gtk test_text_tag_application);
    ];
  ]
```

**Run Tests**:

```bash
cd lablgtk4
dune runtest
```

### Step 8: Documentation (1 hour)

**File**: `lablgtk4/docs/TEXT_WIDGETS.md`

Document:
- Basic text buffer usage
- TextView configuration
- Tag application
- TextIter handling (manual wrapper caveats)
- Migration notes from GTK3

**File**: Update `PHASE5_SUMMARY.md`

Add Phase 5.3 completion notes.

---

## Technical Challenges & Solutions

### Challenge 1: GtkTextIter Stack Allocation

**Problem**: GtkTextIter is not a GObject - it's a stack-allocated structure.

**Solution**:
- Create custom OCaml wrapper with finalizer
- Use custom block with copy semantics
- Reference: lablgtk3's `ml_gobject.c` for similar patterns

**Code Pattern**:
```c
struct ml_gtk_text_iter {
  value buffer;  /* Keep buffer alive */
  GtkTextIter iter;
};

static void ml_gtk_text_iter_finalize(value v) {
  struct ml_gtk_text_iter *wrapper = Data_custom_val(v);
  caml_remove_global_root(&wrapper->buffer);
  free(wrapper);
}

static struct custom_operations text_iter_ops = {
  .identifier = "ml_gtk_text_iter",
  .finalize = ml_gtk_text_iter_finalize,
  /* ... */
};
```

### Challenge 2: Nullable TextMark/TextTag Parameters

**Problem**: Many methods accept `NULL` for mark/tag parameters (e.g., `gtk_text_buffer_create_mark(buffer, NULL, iter, left_gravity)` for anonymous marks).

**Solution**: ✅ Already implemented via nullable parameter support
- Generated bindings will have `option` types
- C code checks `Is_block()` for Some/None

### Challenge 3: Signal Coordination

**Problem**: TextBuffer, TextView, and TextTag all emit related signals.

**Solution**:
- Generate signal connection helpers in phase 5.4+
- For now, document manual signal connection patterns

---

## Success Criteria

- [ ] All 5 text widget .mli files generated
- [ ] GtkTextIter manual wrapper implemented and tested
- [ ] High-level GText module provides convenient API
- [ ] Text buffer operations work (insert, delete, marks, tags)
- [ ] TextView displays and edits text
- [ ] All tests pass
- [ ] No memory leaks (valgrind clean)
- [ ] Documentation complete

---

## Estimated Timeline

| Task | Time | Cumulative |
|------|------|------------|
| Configure filter | 30 min | 30 min |
| Generate bindings | 1 hour | 1.5 hours |
| Handle GtkTextIter | 2-3 hours | 3.5-4.5 hours |
| Generate .ml files | 30 min | 4-5 hours |
| Create GText wrapper | 3-4 hours | 7-9 hours |
| Update build config | 30 min | 7.5-9.5 hours |
| Testing | 2-3 hours | 9.5-12.5 hours |
| Documentation | 1 hour | 10.5-13.5 hours |

**Total**: 10.5-13.5 hours (0.5-1 week at 2-3 hours/day)

---

## Risk Assessment

**High Risk**:
- GtkTextIter special handling - complex FFI wrapper needed
- Iterator invalidation on buffer modification - need careful lifetime management

**Medium Risk**:
- Tag property setting - may need custom wrappers beyond generated code
- Signal coordination - complex signal interactions

**Low Risk**:
- Basic TextView/TextBuffer generation - straightforward with current generator
- TextTag generation - simple GObject subclass

---

## Deferred to Future Phases

1. **Advanced TextIter Operations**: Some complex iterator methods deferred to Phase 5.5+
2. **Spell Checking**: GtkSpell integration deferred to Phase 6
3. **Undo/Redo**: TextBuffer undo manager deferred to Phase 6
4. **GtkSourceView**: Source code editing (syntax highlighting) deferred to future optional phase

---

## Migration Notes from GTK3

### API Changes

**Unchanged**:
- Most GtkTextView and GtkTextBuffer APIs remain the same
- Tag system largely unchanged

**Changed**:
- Some properties renamed or removed
- Signal names may differ slightly

**New in GTK4**:
- Built-in undo/redo support (GtkTextBuffer.undo/redo)
- Improved accessibility features

### Code Migration Example

**GTK3 (lablgtk3)**:
```ocaml
let buf = GText.buffer ~text:"Hello" () in
let view = GText.view ~buffer:buf () in
```

**GTK4 (lablgtk4)**:
```ocaml
(* Same API! *)
let buf = GText.buffer ~text:"Hello" () in
let view = GText.view ~buffer:buf () in
```

Most text widget code should port with minimal changes.

---

## Next Steps After Phase 5.3

Once Phase 5.3 is complete, move to:

**Phase 5.4: Range Widgets** (0.25 weeks)
- GtkScale, GtkRange, GtkProgressBar, GtkLevelBar
- Much simpler than text widgets

---

## References

- [GTK4 TextWidget Documentation](https://docs.gtk.org/gtk4/class.TextView.html)
- [lablgtk3 GText Implementation](../lablgtk3/src/gText.ml)
- [Phase 5.2 Generator Documentation](lablgtk4/src/tools/README_PHASE5_2_GENERATORS.md)

---

**Last Updated**: 2025-11-17
**Status**: Ready for implementation
