# GIR Code Generator (gir_gen)

GTK introspection-based code generator for LablGTK4 bindings.

## Building

```bash
# From lablgtk4 directory
dune build
```

The executable is built to `_build/default/src/tools/gir_gen/main.exe`

## Running

**Always run from the `lablgtk4` directory using `dune exec`:**

```bash
# Generate event controllers and widgets (recommended)
dune exec src/tools/gir_gen/main.exe -- /usr/share/gir-1.0/Gtk-4.0.gir src


### Options

- `GIR_FILE`: Path to GTK GIR file (usually `/usr/share/gir-1.0/Gtk-4.0.gir`)
- `OUTPUT_DIR`: Where to write generated files

## Testing

### Quick Test
```bash
# Generate test output
mkdir -p output/test
echo "Label" > output/test/filter.txt
dune exec src/tools/gir_gen/main.exe -- -f output/test/filter.txt \
  /usr/share/gir-1.0/Gtk-4.0.gir output/test

# Verify files generated
ls output/test/label.mli output/test/ml_event_controllers_gen.c
```

### Verify C Compilation
```bash
# Check generated C compiles (headers only)
gcc -c output/test/ml_event_controllers_gen.c \
  -I$(ocamlc -where) $(pkg-config --cflags gtk4) \
  -fsyntax-only
```

### Full Rebuild
```bash
# Regenerate all src bindings and rebuild library
dune exec src/tools/gir_gen/main.exe -- /usr/share/gir-1.0/Gtk-4.0.gir src
dune build
dune build src/lablgtk4.cma
```

## Output Files

- `ml_event_controllers_gen.c`: C FFI bindings for all classes
- `<class_name>.mli`: OCaml interface for each class (snake_case)
- `gtk_enums.mli`: Generated enum and bitfield types

## Common Issues

**Error: "Program 'src/tools/gir_gen/main.exe' not found"**
- Ensure you're in the `lablgtk4` directory
- Run `dune build` first

**Error: "Don't know how to build src/tools/gir_gen/main.exe"**
- Use `dune exec src/tools/gir_gen/main.exe` instead of `dune build src/tools/gir_gen/main.exe`

---

# Widget Class Generation Plan

## Current State

The gir_gen tool currently generates **low-level FFI bindings only**:

- **C stub files**: FFI functions for constructors, methods, and properties
- **OCaml interfaces**: Typed external declarations
- **Unified type system**: All widgets use `type t = Gtk.widget`
- **Enum/bitfield converters**: Type-safe enum mappings

**What's missing**: High-level object-oriented widget classes with:
- Specific polymorphic variant types for type safety
- OCaml class wrappers with inheritance
- Signal handling
- Convenient factory functions
- Property access via method syntax

## Goal

Extend gir_gen to generate **complete widget bindings** matching the pattern used in manually created classes (window.ml, box.ml, gWindow.ml, gBox.ml), enabling full GTK4 widget support.

## Type System Architecture

### Phase 1: Low-Level Bindings (Current - Needs Enhancement)

**Generated files**: `<widget>.ml` / `<widget>.mli`

**Current approach** (from button.mli):
```ocaml
type t = Gtk.widget

external new_ : unit -> t = "ml_gtk_button_new"
external set_label : t -> string -> unit = "ml_gtk_button_set_label"
external get_label : t -> string = "ml_gtk_button_get_label"
```

**Target approach** (from box.ml, window.ml):
```ocaml
type t = [`button | `widget] Gobject.obj

external new_ : unit -> t = "ml_gtk_button_new"
external set_label : t -> string -> unit = "ml_gtk_button_set_label"
external get_label : t -> string = "ml_gtk_button_get_label"

(* Widget upcasting helper *)
let as_widget (button : t) : Gtk.widget = Obj.magic button
```

**Key changes**:
- Use **specific polymorphic variant types** instead of unified `Gtk.widget`
- Include widget hierarchy in type: `[`button | `widget]` indicates Button is-a Widget
- Add `as_widget` conversion function for compatibility
- Enable compile-time type checking for widget-specific operations

### Phase 2: High-Level Wrappers (New Generation)

**Generated files**: `g<Widget>.ml` / `g<Widget>.mli`

**Structure** (from gButton.ml):
```ocaml
(** Signal handling class *)
class button_signals obj = object
  method clicked ~callback =
    Gobject.Signal.connect_simple obj ~name:"clicked" ~callback ~after:false
end

(** Skeleton class with widget-specific methods *)
class button_skel obj = object (self)
  inherit GObj.widget_impl obj

  method connect = new button_signals obj

  (* Properties as methods *)
  method set_label label = GtkButton.set_label obj label
  method label = GtkButton.get_label obj

  method set_has_frame has_frame = GtkButton.set_has_frame obj has_frame
  method has_frame = GtkButton.get_has_frame obj
end

(** Concrete widget class *)
class button obj = object
  inherit button_skel obj
end

(** Factory function with optional parameters *)
let button ?label ?use_mnemonic ?icon_name ?has_frame ?packing ?show () =
  let btn = match label, use_mnemonic with
    | Some l, Some true -> GtkButton.new_with_mnemonic l
    | Some l, _ -> GtkButton.new_with_label l
    | None, _ when icon_name <> None -> GtkButton.new_from_icon_name (Option.get icon_name)
    | None, _ -> GtkButton.new_ ()
  in
  let widget = new button btn in
  Option.iter (fun f -> widget#set_has_frame f) has_frame;
  Option.iter (fun p -> p (widget :> widget)) packing;
  if show = Some true then widget#show;
  widget
```

## Implementation Plan

### Step 1: Enhance Type System Generation

**Module**: `type_mappings.ml`, `ml_interface.ml`

**Tasks**:
1. Add GIR inheritance parsing to extract parent class
2. Generate polymorphic variant types: `type t = [`<class_snake> | `widget] Gobject.obj`
3. For widgets with specific parents (e.g., Button extends Widget):
   - Parse `parent` attribute from GIR
   - Build inheritance chain: `[`button | `widget]`
4. For containers (Box, Window, etc.):
   - Include all parent types: `[`box | `widget]`
5. Generate `as_widget` helper functions
6. Update C stub type converters to use specific types

**Example GIR input**:
```xml
<class name="Button" c:type="GtkButton" parent="Widget">
  <implements name="Buildable"/>
  <constructor name="new" c:identifier="gtk_button_new"/>
  <method name="set_label" c:identifier="gtk_button_set_label">
    <return-value transfer-ownership="none"><type name="none"/></return-value>
    <parameters>
      <instance-parameter><type name="Button"/></instance-parameter>
      <parameter name="label"><type name="utf8"/></parameter>
    </parameters>
  </method>
</class>
```

**Expected output** (button.ml):
```ocaml
type t = [`button | `widget] Gobject.obj

external new_ : unit -> t = "ml_gtk_button_new"
external set_label : t -> string -> unit = "ml_gtk_button_set_label"
external get_label : t -> string = "ml_gtk_button_get_label"

let as_widget (button : t) : Gtk.widget = Obj.magic button
```

### Step 2: Signal Definition Generation

**Status**: Implemented for parameterless void signals (see `parse/gir_parser.ml`, `generate/signal_gen.ml`, and tests in `test_gir_gen.ml`).

- Parses `<glib:signal>` elements into the GIR AST.
- Generates `<widget>_signals` classes that use `Gobject.Signal.connect_simple` for signals with no parameters and `void` return types.
- Current limitation: signals with parameters or non-void returns are still skipped (the generator logs skips); extend `signal_gen.ml` to add callback wrappers when needed.

**GIR signal example**:
```xml
<glib:signal name="clicked" when="first">
  <return-value transfer-ownership="none">
    <type name="none"/>
  </return-value>
  <parameters/>
</glib:signal>

<glib:signal name="activate" when="last">
  <return-value transfer-ownership="none">
    <type name="none"/>
  </return-value>
  <parameters/>
</glib:signal>
```

**Generated signal class** (gButton.ml):
```ocaml
class button_signals obj = object
  method clicked ~callback =
    Gobject.Signal.connect_simple
      (Button.as_widget obj :> [`widget] Gobject.obj)
      ~name:"clicked" ~callback ~after:false

  method activate ~callback =
    Gobject.Signal.connect_simple
      (Button.as_widget obj :> [`widget] Gobject.obj)
      ~name:"activate" ~callback ~after:false
end
```

**Implementation approach**:
- Use `Gobject.Signal.connect_simple` for simple signals (no parameters). Already shipped.
- For signals with parameters, generate callback wrappers with proper type conversion. **TODO**.
- Handle signal return values (e.g., key-press-event returns bool). **TODO**.

### Step 3: High-Level Class Generation

**Status**: Initial generator added (`generate/class_gen.ml`) and wired into `gir_gen` to emit `g<Widget>.ml` for widget classes.

- Emits `<widget>_skel` + concrete class when the class has a widget parent.
- Adds `connect` method returning the generated `<widget>_signals` class.
- Generates property wrappers (getters/setters) and method wrappers for non-variadic, non-`out` methods.
- Uses the low-level module (e.g., `Button.set_label`) and `GObj.widget_impl` for inheritance.

**Next steps** (future work):
- Add container/window/range specializations (add/remove/append, present/close, adjustment/value).
- Handle inheritance between generated skeletons (parent `_skel`).
- Support methods with `out` params and signals with arguments.
- Wire the generator into `main.ml` to emit `g<Widget>.ml/.mli` files, and add Dune includes.

**Tasks**:
1. Generate skeleton class (`<widget>_skel`) with:
   - Inheritance from `GObj.widget_impl` or specific parent class
   - `connect` method returning signal class
   - Property methods (generated from GIR properties)
   - Widget-specific methods (from GIR methods)

2. Generate concrete class (`<widget>`)
3. Handle special cases:
   - Container widgets (add/remove child methods)
   - Windows (destroy, present, close)
   - Range widgets (scale, scrollbar)

**Property generation**:
```ocaml
(* From GIR property: name="label" type="utf8" readable="true" writable="true" *)
method set_label label = GtkButton.set_label obj label
method label = GtkButton.get_label obj

(* From GIR property: name="has-frame" type="gboolean" readable="true" writable="true" *)
method set_has_frame has_frame = GtkButton.set_has_frame obj has_frame
method has_frame = GtkButton.get_has_frame obj
```

**Method generation**:
```ocaml
(* From GIR method: name="clicked" c:identifier="gtk_button_clicked" *)
method clicked () = GtkButton.clicked obj
```

### Step 4: Factory Function Generation

**Module**: New `factory_gen.ml`

**Tasks**:
1. Analyze constructors from GIR to determine optional parameters
2. Generate factory function with:
   - Optional parameters for common properties
   - Constructor selection logic (new_, new_with_label, new_with_mnemonic, etc.)
   - Property initialization
   - Packing and show support

**Constructor analysis** (from GIR):
```xml
<constructor name="new" c:identifier="gtk_button_new"/>
<constructor name="new_with_label" c:identifier="gtk_button_new_with_label">
  <parameters>
    <parameter name="label"><type name="utf8"/></parameter>
  </parameters>
</constructor>
<constructor name="new_with_mnemonic" c:identifier="gtk_button_new_with_mnemonic">
  <parameters>
    <parameter name="label"><type name="utf8"/></parameter>
  </parameters>
</constructor>
```

**Generated factory**:
```ocaml
let button ?label ?use_mnemonic ?icon_name ?has_frame ?packing ?show () =
  let btn =
    match label, use_mnemonic with
    | Some l, Some true -> GtkButton.new_with_mnemonic l
    | Some l, _ -> GtkButton.new_with_label l
    | None, _ when icon_name <> None -> GtkButton.new_from_icon_name (Option.get icon_name)
    | None, _ -> GtkButton.new_ ()
  in
  let widget = new button btn in
  Option.iter (fun f -> widget#set_has_frame f) has_frame;
  Option.iter (fun p -> p (widget :> widget)) packing;
  if show = Some true then widget#show;
  widget
```

### Step 5: Container Widget Specialization

**Module**: `container_gen.ml`

**Tasks**:
1. Detect container widgets (implement `Gtk.Buildable`, have `child` property)
2. Generate specialized container methods:
   - `add`, `remove` for single-child containers
   - `append`, `prepend`, `insert_child_after` for Box-like containers
   - `pack` methods for GTK3 compatibility (optional)

**Example** (from gBox.ml):
```ocaml
class box_skel (obj : Box.t) = object (self)
  inherit GObj.widget_impl (Box.as_widget obj)

  method append (child : GObj.widget) =
    Box.append obj child#as_widget

  method prepend (child : GObj.widget) =
    Box.prepend obj child#as_widget

  method remove (child : GObj.widget) =
    Box.remove obj child#as_widget

  method spacing = Box.get_spacing obj
  method set_spacing spacing = Box.set_spacing obj spacing

  method homogeneous = Box.get_homogeneous obj
  method set_homogeneous h = Box.set_homogeneous obj h
end
```

### Step 6: Inheritance Chain Handling

**Module**: `inheritance.ml` (new)

**Tasks**:
1. Build widget class hierarchy from GIR parent relationships
2. Determine which parent class to inherit from:
   - Direct inheritance: `inherit parent_skel obj`
   - For widgets, inherit from `GObj.widget_impl`
3. Handle multiple interface implementations
4. Generate proper type coercions

**Example inheritance chains**:
```
Widget
  ├─ Button
  │   └─ ToggleButton
  │       └─ CheckButton
  ├─ Box
  ├─ Window
  │   └─ Dialog
  └─ Range
      ├─ Scale
      └─ Scrollbar
```

**Generated class hierarchy**:
```ocaml
(* button_skel inherits from widget_impl *)
class button_skel obj = object (self)
  inherit GObj.widget_impl obj
  (* ... button-specific methods ... *)
end

(* toggle_button_skel inherits from button_skel *)
class toggle_button_skel obj = object (self)
  inherit button_skel obj
  (* ... toggle-specific methods ... *)
  method set_active active = GtkToggleButton.set_active obj active
  method active = GtkToggleButton.get_active obj
end
```

### Step 7: Special Widget Patterns

**Module**: `widget_patterns.ml` (new)

**Tasks**:

1. **Window widgets**: Add lifecycle methods
   ```ocaml
   method destroy = Window.destroy obj
   method present = Window.present obj
   method close = Window.close obj
   ```

2. **Dialog widgets**: Add response handling
   ```ocaml
   method response (response : Gtk_enums.responsetype) =
     Dialog.response obj response

   method run () = Dialog.run obj
   ```

3. **Range widgets**: Add adjustment and value methods
   ```ocaml
   method value = Range.get_value obj
   method set_value v = Range.set_value obj v
   method adjustment = new GData.adjustment (Range.get_adjustment obj)
   ```

4. **TreeView/ListView**: Add model and selection methods
   ```ocaml
   method set_model model = TreeView.set_model obj (Some model#as_model)
   method selection = new tree_selection (TreeView.get_selection obj)
   ```

## Output File Organization

```
lablgtk4/src/
├── button.ml              # Low-level FFI (type t = [`button | `widget] Gobject.obj)
├── button.mli             # Low-level interface
├── gButton.ml             # High-level classes (button_signals, button_skel, button)
├── gButton.mli            # High-level interface
├── toggle_button.ml       # Low-level FFI
├── gToggleButton.ml       # High-level (inherits from button_skel)
├── check_button.ml
├── gCheckButton.ml
└── ...
```

## Generation Workflow

```
GIR File (Gtk-4.0.gir)
       |
       v
   Parse GIR (gir_parser.ml)
       |
       ├─> Extract classes, interfaces, enums
       ├─> Extract methods, properties, constructors
       ├─> Extract signals
       └─> Build inheritance tree
       |
       v
   Type Mapping (type_mappings.ml)
       |
       ├─> Map GIR types to OCaml types
       ├─> Generate polymorphic variant types
       └─> Handle nullable, optional parameters
       |
       v
   Code Generation
       |
       ├─> C Stubs (c_stubs.ml)
       │   └─> ml_<widget>_gen.c
       │
       ├─> Low-Level Bindings (ml_interface.ml + type enhancement)
       │   ├─> <widget>.ml with specific types
       │   └─> <widget>.mli
       │
       ├─> Signal Classes (signal_gen.ml - NEW)
       │   └─> <widget>_signals in g<Widget>.ml
       │
       ├─> High-Level Classes (class_gen.ml - NEW)
       │   ├─> <widget>_skel with inheritance
       │   ├─> <widget> concrete class
       │   └─> g<Widget>.ml / g<Widget>.mli
       │
       └─> Factory Functions (factory_gen.ml - NEW)
           └─> Convenient constructors in g<Widget>.ml
```

## Record Type Support Plan

- **Goal**: Parse and generate support for GIR `<record>` elements so methods/properties that use them no longer get skipped, mirroring lablgtk3’s record-aware stubs (`extract_prototype.ml` marks record conversions) and following `FFI_GUIDELINES.md` / `SECURITY_GUIDELINES.md`.
- **Parser updates**: Add a `gir_record` type (name, c_type, glib:type-name/get-type, disguised flag, fields with types/docs) in `types.ml` and extend `parse/gir_parser.ml` to collect `<record>` entries into the AST rather than discarding them (reuse the existing `record_signal` hook to keep coverage in one place).
- **Type mapping**: Teach `type_mappings.ml` to resolve record C types and GIR names:
  - GBoxed-style (`glib:type-name`/`glib:get-type`) -> emit `Val_<Type>` / `<Type>_val` converters like classes, with NULL checks and deep copies where required.
  - Disguised/opaque records -> map to abstract custom blocks or pointer wrappers; preserve nullable/ownership semantics so method/property generators can still wire them through.
- **Generation integration**: Use the resolved record mappings in the generators so properties, parameters, and return values referencing records produce externals instead of being filtered out. Start with pointer-level support; optionally add field accessors once GIR exposes usable fields.
- **Safety**: Any new C helpers must follow the security checklist (CAMLparam/CAMLlocal, bounds/overflow checks, no memcpy on `GValue`-like data, register/unregister roots as needed).
- **Testing**: Add `test_gir_gen.ml` fixtures for (1) boxed record with get_type, (2) disguised opaque record, (3) nullable record parameter/return. Assert parsed AST contents and generated type mappings/stub signatures cover those cases.

**Current status (implemented):**
- `gir_record` parsing is wired; boxed records populate the AST and type mapping lookups.
- Type mapping emits conversion macros for boxed records; disguised/opaque records are ignored for converter emission to avoid struct-by-value mishandling.
- Generators (C stubs, ML interfaces, class wrappers) accept `~records` and use record mappings for parameters/properties/returns.
- Regression test `Record type support` exists and should be kept in sync with any future tweaks to record handling.

### Generation Modes

**Note**: The following command-line flags need to be implemented:

```bash
# Generate only low-level FFI bindings (current behavior)
dune exec src/tools/gir_gen/main.exe -- --ffi-only -f filter.txt Gtk-4.0.gir src

# Generate both low-level and high-level classes (planned)
dune exec src/tools/gir_gen/main.exe -- --full -f filter.txt Gtk-4.0.gir src

# Generate only high-level classes (planned - for manually created FFI)
dune exec src/tools/gir_gen/main.exe -- --classes-only -f filter.txt Gtk-4.0.gir src
```

### Customization Files

Create per-widget customization files for special handling:

```
lablgtk4/src/tools/customizations/
├── button.json          # Constructor preferences, signal customization
├── window.json          # Special lifecycle methods
├── dialog.json          # Response handling
└── treeview.json        # Model/selection handling
```

**Example customization** (button.json):
```json
{
  "preferred_constructor": "new_with_label",
  "factory_params": ["label", "use_mnemonic", "icon_name", "has_frame"],
  "signals": {
    "clicked": {
      "callback_type": "unit -> unit"
    }
  },
  "extra_methods": []
}
```

## Testing Strategy

### Phase 1: Single Widget Generation
1. Generate Button widget classes
2. Manually verify generated code
3. Compile and test basic functionality
4. Compare with manually created button.ml/gButton.ml

### Phase 2: Widget Family Generation
1. Generate Button family (Button, ToggleButton, CheckButton)
2. Verify inheritance chain works correctly
3. Test signal handling
4. Test factory functions

### Phase 3: Container Widgets
1. Generate Box, Window, Dialog
2. Verify container methods (add, remove, etc.)
3. Test child widget management

### Phase 4: Full Widget Set
1. Generate all GTK4 widgets
2. Run comprehensive test suite
3. Verify compilation
4. Performance testing

## Migration Path

### Approach: Gradual Migration

1. **Keep existing manually created classes** during transition
2. **Generate new classes** with `_gen` suffix initially
3. **Compare generated vs manual** side-by-side
4. **Refine generator** based on comparison
5. **Switch to generated** once quality matches manual
6. **Remove manual classes** after validation

### Backward Compatibility

Maintain compatibility with existing lablgtk4 code:
- Preserve existing class names and method signatures
- Ensure generated classes match manual class interfaces
- Add deprecation warnings to manual classes before removal

## Implementation Timeline

### Phase 1: Foundation (Weeks 1-2)
- Enhance type system generation with polymorphic variants
- Implement inheritance tree parsing
- Generate `as_widget` helpers

### Phase 2: Signals (Week 3)
- Parse GIR signal definitions
- Generate signal handler classes
- Test with simple signals (clicked, activate)

### Phase 3: Classes (Weeks 4-5)
- Implement skeleton class generation
- Generate property methods
- Generate widget-specific methods
- Handle inheritance properly

### Phase 4: Factories (Week 6)
- Implement factory function generation
- Constructor selection logic
- Property initialization

### Phase 5: Containers (Week 7)
- Implement container detection
- Generate container-specific methods
- Handle child widget management

### Phase 6: Testing & Refinement (Weeks 8-10)
- Generate full widget set
- Comprehensive testing
- Bug fixes and refinements
- Documentation

## Success Criteria

1. **Generated code compiles** without errors
2. **Type safety preserved**: Specific widget types prevent type errors
3. **API compatibility**: Generated classes match manual class interfaces
4. **Signal handling works**: All signals can be connected
5. **Inheritance correct**: Widget hierarchies properly represented
6. **Factory functions convenient**: Easy widget creation
7. **Performance acceptable**: No significant overhead vs manual
8. **Code quality**: Generated code is readable and maintainable

## Future Enhancements

1. **Property change notifications**: Generate property observers
2. **Builder integration**: Support for Glade/GTK Builder XML
3. **CSS class helpers**: Convenience methods for CSS styling
4. **Event controller integration**: Better integration with GTK4 event system
5. **Documentation generation**: Extract docs from GIR and include in generated code
6. **Automatic test generation**: Generate basic widget tests
7. **FFI optimization**: Generate more efficient C stubs
8. **Cross-namespace support**: Handle Gdk, Pango, etc. widgets

## References

### Existing Patterns
- **lablgtk3**: Advanced polymorphic variant type hierarchy
- **lablgtk4 manual classes**: window.ml, box.ml, gWindow.ml, gBox.ml, gButton.ml
- **Generated bindings**: button.mli, label.mli (current gir_gen output)

### Key Files to Study
- `lablgtk4/src/gObj.ml`: Base widget_impl class
- `lablgtk4/src/gobject.ml`: GObject type system
- `lablgtk4/src/tools/gir_parser.ml`: GIR parsing
- `lablgtk4/src/tools/type_mappings.ml`: Type conversion
- `lablgtk4/src/tools/c_stubs.ml`: C stub generation
- `lablgtk4/src/tools/ml_interface.ml`: OCaml interface generation

### GTK4 Documentation
- GObject Introspection: https://gi.readthedocs.io/
- GTK4 Reference: https://docs.gtk.org/gtk4/
- GIR Format: https://gi.readthedocs.io/en/latest/annotations/giannotations.html
