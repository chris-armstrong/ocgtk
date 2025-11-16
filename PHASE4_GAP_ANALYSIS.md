# Phase 4 Implementation Gap Analysis

## Executive Summary

Phase 4 (Container & Layout System) is **mostly complete** with one significant gap: **Phase 4.2 (Single-Child Containers)** is not yet implemented. This includes GtkWindow, GtkScrolledWindow, and GtkFrame.

**Overall Progress**: ~80% complete (4 out of 5 sub-phases implemented)

---

## Detailed Status

### ✅ Phase 4.1: GtkBox Migration (COMPLETE)

**Status**: ✅ **FULLY IMPLEMENTED**

**Implementation**:
- ✅ Low-level `Gtk.Box` module in `gtk.ml`/`gtk.mli`
- ✅ C bindings in `ml_gtk.c`
- ✅ High-level wrapper `GBox` module in `gBox.ml`/`gBox.mli`
- ✅ Widget packing properties (hexpand, vexpand, halign, valign, margins)
- ✅ GTK3 compatibility helpers (`box_pack` class with `pack_start`/`pack_end`)

**Testing**: ✅ **COMPREHENSIVE**
- `tests/test_box.ml` includes:
  - Module accessibility
  - Type constructors
  - Box creation (horizontal/vertical)
  - Property management (spacing, homogeneous, baseline_position)
  - Packing properties (expand, align, margins)
  - High-level GBox wrapper
  - GTK3 compatibility pack methods
  - Child management (append, prepend, remove)

**Files**:
- `lablgtk4/src/gtk.ml` (lines 235-277: Box module)
- `lablgtk4/src/gBox.ml` + `gBox.mli`
- `lablgtk4/tests/test_box.ml` (232 lines, comprehensive)

---

### ❌ Phase 4.2: Single-Child Containers (MISSING)

**Status**: ❌ **NOT IMPLEMENTED**

**Missing Components**:

#### 1. GtkWindow
- ❌ `Gtk.Window` module in `gtk.ml`/`gtk.mli`
- ❌ C bindings for:
  - `gtk_window_new()`
  - `gtk_window_set_child()` / `gtk_window_get_child()`
  - `gtk_window_set_title()` / `gtk_window_get_title()`
  - `gtk_window_set_default_size()` / `gtk_window_get_default_size()`
  - `gtk_window_set_resizable()` / `gtk_window_get_resizable()`
  - `gtk_window_destroy()` / `gtk_window_present()` / `gtk_window_close()`
- ❌ High-level `GWindow` module
- ❌ Tests for Window

#### 2. GtkScrolledWindow
- ❌ `Gtk.ScrolledWindow` module
- ❌ C bindings for:
  - `gtk_scrolled_window_new()`
  - `gtk_scrolled_window_set_child()` / `gtk_scrolled_window_get_child()`
  - `gtk_scrolled_window_set_policy()` / `gtk_scrolled_window_get_policy()`
  - Scrollbar and adjustment accessors
- ❌ High-level `GScrolledWindow` module
- ❌ Tests for ScrolledWindow

#### 3. GtkFrame
- ❌ `Gtk.Frame` module
- ❌ C bindings for:
  - `gtk_frame_new()`
  - `gtk_frame_set_child()` / `gtk_frame_get_child()`
  - `gtk_frame_set_label()` / `gtk_frame_get_label()`
  - `gtk_frame_set_label_align()` / `gtk_frame_get_label_align()`
- ❌ High-level `GFrame` module
- ❌ Tests for Frame

**Impact**:
- **CRITICAL**: Windows are fundamental to any GUI application
- Cannot create working GUI applications without GtkWindow
- Cannot test other containers in real window contexts
- Blocks real-world usage examples

**Planned Location** (from port-phase4.md):
- `lablgtk4/src/gtk.ml` (add Window, ScrolledWindow, Frame modules)
- `lablgtk4/src/ml_gtk.c` (add C bindings)
- `lablgtk4/src/gWindow.ml` + `gWindow.mli` (NEW FILES)
- `lablgtk4/src/gScrolledWindow.ml` + `gScrolledWindow.mli` (NEW FILES)
- `lablgtk4/src/gFrame.ml` + `gFrame.mli` (NEW FILES)
- `lablgtk4/tests/test_window.ml` (NEW FILE)

**Note from GPack**: The `gPack.mli` file includes a comment noting that Window and ScrolledWindow conveniences will be added when those modules are implemented (lines 133-139).

---

### ✅ Phase 4.3: GtkGrid Migration (COMPLETE)

**Status**: ✅ **FULLY IMPLEMENTED**

**Implementation**:
- ✅ Low-level `Gtk.Grid` module in `gtk.ml`/`gtk.mli`
- ✅ C bindings in `ml_gtk.c`
- ✅ High-level wrapper `GGrid` module in `gGrid.ml`/`gGrid.mli`
- ✅ All grid operations:
  - attach, attach_next_to, remove
  - get_child_at
  - insert_row, insert_column, insert_next_to
  - remove_row, remove_column
  - spacing (row/column)
  - homogeneous (row/column)
  - baseline_row

**Testing**: ✅ **COMPREHENSIVE**
- `tests/test_grid.ml` includes:
  - Module accessibility
  - Grid creation
  - Property management (spacing, homogeneous, baseline)
  - Child attachment and removal
  - Row/column operations
  - attach_next_to and insert_next_to
  - High-level GGrid wrapper
  - Complex scenarios (multiple attachments, nested containers)

**Files**:
- `lablgtk4/src/gtk.ml` (lines 278-344: Grid module)
- `lablgtk4/src/gGrid.ml` + `gGrid.mli`
- `lablgtk4/tests/test_grid.ml` (368 lines, comprehensive with 16 test cases)

---

### ✅ Phase 4.4: Additional Containers (COMPLETE)

**Status**: ✅ **FULLY IMPLEMENTED**

**Implementation**:
- ✅ **GtkFixed**: Absolute positioning container
  - Low-level `Gtk.Fixed` module
  - High-level `GFixed` module
  - Methods: create, put, move, remove, get_child_position

- ✅ **GtkPaned**: Two-child resizable container
  - Low-level `Gtk.Paned` module
  - High-level `GPaned` module (with hpaned/vpaned conveniences)
  - Methods: set_start_child, set_end_child, position, wide_handle, resize/shrink properties

- ✅ **GtkNotebook**: Tabbed container
  - Low-level `Gtk.Notebook` module
  - High-level `GNotebook` module
  - Methods: append_page, prepend_page, insert_page, remove_page
  - Navigation: set_current_page, next_page, prev_page
  - Properties: show_tabs, show_border, scrollable

- ✅ **GtkStack**: Layered container with transitions
  - Low-level `Gtk.Stack` module
  - High-level `GStack` module
  - Methods: add_named, add_titled, remove, set_visible_child
  - Transitions: 23 different transition types supported

**Testing**: ✅ **COMPREHENSIVE**
- `tests/test_containers.ml` includes:
  - All four container types (Fixed, Paned, Notebook, Stack)
  - Low-level and high-level APIs for each
  - Property management
  - Child management
  - Integration tests (nested containers, complex compositions)
  - All 23 stack transition types verified

**Files**:
- `lablgtk4/src/gtk.ml` (Fixed, Paned, Notebook, Stack modules)
- `lablgtk4/src/gFixed.ml` + `gFixed.mli`
- `lablgtk4/src/gPaned.ml` + `gPaned.mli`
- `lablgtk4/src/gNotebook.ml` + `gNotebook.mli`
- `lablgtk4/src/gStack.ml` + `gStack.mli`
- `lablgtk4/tests/test_containers.ml` (550 lines, very comprehensive)

---

### ✅ Phase 4.5: GPack Module Redesign (COMPLETE)

**Status**: ✅ **FULLY IMPLEMENTED**

**Implementation**:
- ✅ `GPack` convenience module in `gPack.ml`/`gPack.mli`
- ✅ Box packing: `hbox_pack`, `vbox_pack`
- ✅ Grid packing: `grid_attach`
- ✅ Paned conveniences: `hpaned`, `vpaned`
- ✅ Notebook conveniences: `notebook`
- ✅ Note: Window and ScrolledWindow conveniences are planned for when those modules are implemented

**Testing**: ✅ **COMPREHENSIVE**
- `tests/test_gpack.ml` includes:
  - Box packing (empty and with widgets)
  - Grid attach (empty and with positioned widgets)
  - Paned conveniences (horizontal and vertical)
  - Notebook conveniences (empty and with pages)
  - Complex composition tests (hbox in vbox, grid in paned)

**Files**:
- `lablgtk4/src/gPack.ml` + `gPack.mli`
- `lablgtk4/tests/test_gpack.ml` (253 lines, comprehensive)

---

## Phase 4 Deliverables Checklist

### Code

- [x] GtkBox with append/prepend/remove API
- [ ] **GtkWindow** with set_child API ❌ **MISSING**
- [ ] **GtkScrolledWindow** with set_child API ❌ **MISSING**
- [ ] **GtkFrame** with set_child API ❌ **MISSING**
- [x] GtkGrid with attach/remove API
- [x] GtkFixed, GtkPaned, GtkNotebook, GtkStack
- [x] Widget packing properties (hexpand, vexpand, margins, align)
- [x] High-level wrappers (GBox, GGrid, GFixed, GPaned, GNotebook, GStack)
- [ ] **High-level wrappers (GWindow, GScrolledWindow, GFrame)** ❌ **MISSING**
- [x] GPack convenience module (partial - missing Window/ScrolledWindow helpers)
- [x] All tests passing (for implemented components)

### Testing

- [x] test_box.ml (creation, packing, removal)
- [ ] **test_window.ml (set_child, properties)** ❌ **MISSING**
- [x] test_grid.ml (attach, remove, spacing)
- [x] test_containers.ml (all other containers)
- [ ] Memory leak testing (valgrind) - not yet performed

### Documentation

- [ ] Container migration guide (GTK3 → GTK4) - **PARTIAL** (exists in port-phase4.md but incomplete)
- [ ] Packing API changes document - **MISSING**
- [ ] Examples showing new container patterns - **MISSING**
- [ ] API documentation for all container modules - **PARTIAL** (inline docs exist, no external docs)

---

## Code Generation Opportunities

Based on the review, these are prime candidates for code generation:

### 1. Repetitive Property Getters/Setters

Many modules have similar patterns for property access:

```ocaml
val get_property_name : t -> property_type
val set_property_name : t -> property_type -> unit
```

Examples:
- `Gtk.Box.{get,set}_spacing`
- `Gtk.Grid.{get,set}_row_spacing`
- `Gtk.Widget.{get,set}_margin_*`

**Tool**: Use existing `propcc.ml` tool or extend `gir_gen.ml` to generate from GIR files.

### 2. Container-Specific Child Management

Each container has similar but slightly different child management:
- Box: `append`, `prepend`, `remove`
- Grid: `attach`, `remove`
- Fixed: `put`, `move`, `remove`
- Paned: `set_start_child`, `set_end_child`
- Notebook: `append_page`, `prepend_page`, `remove_page`
- Stack: `add_named`, `add_titled`, `remove`

**Tool**: Create a template-based code generator that takes container type and generates appropriate methods.

### 3. Window/ScrolledWindow/Frame Implementation (Priority)

Since these three single-child containers follow the same pattern, we could:
1. Create a template for single-child containers
2. Generate C bindings from GTK4 GIR file using `gir_gen`
3. Generate OCaml modules using property specifications

**Recommended Approach**:
```bash
cd lablgtk4/src/tools
dune exec -- gir_gen \
  --gir-file /usr/share/gir-1.0/Gtk-4.0.gir \
  --class GtkWindow \
  --output ../gtk_window_generated.ml

# Repeat for GtkScrolledWindow, GtkFrame
```

### 4. High-Level Wrapper Boilerplate

All high-level wrappers (G*) share similar structure:
- Inherit from `GObj.widget_impl`
- Wrap low-level calls
- Provide convenience constructors

**Tool**: Create a script that generates high-level wrapper boilerplate from low-level module signatures.

### 5. Test Boilerplate

Test files share common patterns:
- Module accessibility tests
- Type constructor tests
- Creation tests
- Property tests with get/set verification
- GTK init error handling

**Tool**: Generate test skeletons from module signatures that developers can fill in with specific assertions.

---

## Worked Examples Based on lablgtk3

To help users migrate and to validate the implementation, we should create worked examples based on lablgtk3 code:

### Example 1: Simple Window with Box

**lablgtk3 (GTK3)**:
```ocaml
let main () =
  let window = GWindow.window ~title:"Hello" ~width:200 ~height:100 () in
  let box = GPack.vbox ~packing:window#add () in
  let button1 = GButton.button ~label:"Button 1" ~packing:box#pack () in
  let button2 = GButton.button ~label:"Button 2" ~packing:box#pack () in

  window#show ();
  GMain.main ()
```

**lablgtk4 (GTK4)** - NOT YET POSSIBLE (missing GWindow):
```ocaml
(* Will be: *)
let main () =
  let window = GWindow.window ~title:"Hello" ~width:200 ~height:100 () in
  let box = GBox.vbox ~spacing:5 () in

  (* In GTK4, buttons would be created differently *)
  (* box#append button1; *)
  (* box#append button2; *)

  window#set_child (Some (box :> GObj.widget));
  window#present ();
  GMain.main ()
```

### Example 2: Grid Layout

**lablgtk3 (GTK3)**:
```ocaml
let create_grid () =
  let grid = GPack.grid ~row_spacing:10 ~column_spacing:10 () in
  let button1 = GButton.button ~label:"1,1" () in
  let button2 = GButton.button ~label:"1,2" () in
  let button3 = GButton.button ~label:"2,1-2" () in

  grid#attach ~left:0 ~top:0 ~width:1 ~height:1 button1#coerce;
  grid#attach ~left:1 ~top:0 ~width:1 ~height:1 button2#coerce;
  grid#attach ~left:0 ~top:1 ~width:2 ~height:1 button3#coerce;

  grid#coerce
```

**lablgtk4 (GTK4)** - PARTIALLY POSSIBLE (missing buttons):
```ocaml
let create_grid () =
  let grid = GGrid.create ~row_spacing:10 ~column_spacing:10 () in

  (* In GTK4, once buttons are implemented: *)
  (* grid#attach ~left:0 ~top:0 ~width:1 ~height:1 button1; *)
  (* grid#attach ~left:1 ~top:0 ~width:1 ~height:1 button2; *)
  (* grid#attach ~left:0 ~top:1 ~width:2 ~height:1 button3; *)

  (grid :> GObj.widget)
```

### Example 3: Notebook with Pages

**lablgtk3 (GTK3)**:
```ocaml
let create_notebook () =
  let notebook = GPack.notebook () in
  let page1 = GMisc.label ~text:"Page 1 content" () in
  let page2 = GMisc.label ~text:"Page 2 content" () in

  notebook#append_page ~tab_label:(GMisc.label ~text:"Tab 1" ())#coerce page1#coerce;
  notebook#append_page ~tab_label:(GMisc.label ~text:"Tab 2" ())#coerce page2#coerce;

  notebook#coerce
```

**lablgtk4 (GTK4)** - PARTIALLY POSSIBLE (missing labels):
```ocaml
let create_notebook () =
  let notebook = GNotebook.create () in

  (* In GTK4, once labels are implemented: *)
  (* let _ = notebook#append_page page1 in *)
  (* let _ = notebook#append_page page2 in *)

  (notebook :> GObj.widget)
```

---

## Priority Recommendations

### Immediate Actions

1. **Implement Phase 4.2 (Single-Child Containers)** - CRITICAL
   - Start with GtkWindow (highest priority)
   - Then GtkScrolledWindow
   - Finally GtkFrame
   - Use code generation where possible

2. **Create worked examples** that can be tested once Window is implemented
   - Start with simple window + box
   - Add grid layout example
   - Add paned example
   - Add notebook example

3. **Run memory leak testing** with valgrind
   - Test all container types
   - Test complex nesting scenarios
   - Test add/remove cycles

### Code Generation Strategy

1. **Use existing gir_gen tool** for Window/ScrolledWindow/Frame:
   ```bash
   cd lablgtk4/src/tools
   ./generate_containers.sh  # Create this script
   ```

2. **Create high-level wrapper generator**:
   - Input: Low-level module signature
   - Output: High-level wrapper boilerplate
   - Manual completion: Add convenience methods

3. **Generate test skeletons**:
   - Input: Module signature
   - Output: Test file with standard test patterns
   - Manual completion: Add specific assertions

### lablgtk3 Reference Strategy

Before implementing each missing component:
1. **Find corresponding lablgtk3 file**:
   ```bash
   find lablgtk3/src -name "*window*" -o -name "*frame*" -o -name "*scroll*"
   ```

2. **Study the implementation pattern**
   - How are properties handled?
   - How is memory management done?
   - What FFI patterns are used?

3. **Adapt to GTK4 differences**
   - GTK4 removed/renamed some functions
   - GTK4 uses different widget hierarchy
   - GTK4 has different property names

---

## Risk Assessment

### High Risk (for missing Phase 4.2)

- **User Impact**: Cannot create any working applications without GtkWindow
- **Testing Impact**: Cannot test most containers in realistic scenarios
- **Example Impact**: Cannot provide working demonstrations

### Medium Risk

- **Documentation**: Lack of migration guide may confuse GTK3 users
- **Memory Leaks**: Not yet tested with valgrind
- **Code Generation**: Manual implementation is error-prone and time-consuming

### Low Risk

- **Existing Implementation**: Already-implemented phases (4.1, 4.3, 4.4, 4.5) are well-tested and comprehensive
- **Test Coverage**: Implemented components have excellent test coverage

---

## Estimated Effort

Based on port-phase4.md estimates and existing implementation quality:

| Task | Estimated Time | Priority |
|------|----------------|----------|
| Phase 4.2 (Window/ScrolledWindow/Frame) | 1 week | CRITICAL |
| Memory leak testing (valgrind) | 0.5 days | HIGH |
| Worked examples (5-10 examples) | 2 days | HIGH |
| Migration guide documentation | 1 day | MEDIUM |
| Code generation tooling setup | 2 days | MEDIUM |
| **Total** | **~2 weeks** | - |

---

## Conclusion

Phase 4 is **mostly complete (80%)** with excellent implementation quality and test coverage for the completed components. The critical gap is **Phase 4.2 (Single-Child Containers)**, particularly GtkWindow, which is essential for any usable GUI application.

**Recommended Next Steps**:
1. Implement GtkWindow using code generation (highest priority)
2. Create simple worked examples to validate Window implementation
3. Complete GtkScrolledWindow and GtkFrame
4. Run comprehensive memory leak testing
5. Create migration guide and documentation

Once Phase 4.2 is complete, the container system will be production-ready and can serve as a solid foundation for Phase 5 (High-Level Widgets).
