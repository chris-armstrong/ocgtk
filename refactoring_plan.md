# main.ml Refactoring Plan

## Progress Checklist

- [x] **Step 1: Extract Type Context Record & File Writing Helper**
  - [x] Added `generation_context` record type (lines 10-18)
  - [x] Added `write_file` helper function (lines 20-25)
  - [x] Created `ctx` instance after parsing (lines 89-98)
  - [x] Updated all generator function calls to use `ctx.classes`, `ctx.interfaces`, etc.
  - [x] Updated all file writing to use `write_file` helper
  - [x] Verified build succeeds
  - [x] Tested code generation (297 C files, 389 .mli files)
  - [x] Moved `generation_context` to types.ml for reuse across modules
  - [x] Updated signal_gen.ml to accept ~ctx parameter
  - [x] Updated class_gen.ml public functions to accept ~ctx parameter
  - [x] Updated class_gen.ml internal functions to accept ~ctx parameter:
    - [x] ocaml_type_of_gir_type
    - [x] generate_property_methods
    - [x] generate_property_signatures
    - [x] generate_method_wrappers
    - [x] generate_method_signatures
  - [x] Updated filtering.ml functions to accept ~ctx parameter:
    - [x] has_simple_type
    - [x] should_generate_property
    - [x] property_method_names
    - [x] property_base_names
    - [x] should_skip_method_binding
  - [x] Updated c_stubs.ml to use ctx (created local contexts in functions)
  - [x] Verified build succeeds after all refactoring
  - [x] All tests pass (21/21)
- [x] **Step 2: Create Unified Entity Type**
  - [x] Add `entity_kind` variant (Class | Interface) and `entity` record type
  - [x] Implement `entity_of_class` and `entity_of_interface` converters
  - [x] Create combined entity list in main.ml
  - [x] Verified build succeeds
  - [x] All tests pass (21/21)
  - [ ] Update generator functions to work with entities instead of separate class/interface types (deferred to later steps)
- [x] **Step 3: Extract C Code Generation**
  - [x] Create `generate_c_stub` function (lines 17-40 in main.ml)
  - [x] Create `generate_all_c_stubs` function (lines 43-44 in main.ml)
  - [x] Replace duplicate class/interface C generation loops (line 184)
  - [x] Verified build succeeds
  - [x] Code generation produces no changes
  - [x] All tests pass (21/21)
- [x] **Step 4: Extract ML Interface Generation**
  - [x] Create `output_file_kind` type (line 47 in main.ml)
  - [x] Create `generate_ml_file` function (lines 50-72 in main.ml)
  - [x] Create `generate_ml_interfaces` function (lines 75-79 in main.ml)
  - [x] Replace duplicate ML generation loops with unified entity-based loop (lines 222-225)
  - [x] Removed duplicate interface loop (previously lines 281-315)
  - [x] Verified build succeeds
  - [x] Code generation produces no changes
  - [x] All tests pass (21/21)
- [x] **Step 5: Extract High-Level Class Generation**
  - [x] Extract `should_generate_high_level_class` function
  - [x] Extract `generate_high_level_class` function
  - [x] Replace duplicate high-level class generation loop with unified entity-based loop
  - [x] Verified build succeeds
  - [x] Code generation produces no changes
  - [x] All tests pass (21/21)
- [x] **Step 6: Extract Signal Generation**
  - [x] Create `generate_signal_class` function
  - [x] Create `generate_all_signal_classes` function
  - [x] Replace duplicate class/interface signal generation loops with unified entity-based loop
  - [x] Verified build succeeds
  - [x] Code generation produces no changes
  - [x] All tests pass (21/21)
- [x] **Step 7: Extract Enum/Bitfield Generation**
  - [x] Create `namespace_info` type
  - [x] Create `generate_enum_files` function
  - [x] Replace duplicate GTK enum generation code with unified function call
  - [x] Replace duplicate external namespace enum generation loop with unified function calls
  - [x] Verified build succeeds
  - [x] Code generation produces cleaner output (simpler C headers without unnecessary includes)
  - [x] All tests pass (21/21)
- [ ] **Step 8: Restructure Main Function**
  - [ ] Simplify main function to high-level orchestration
- [ ] **Step 9: Split into Modules (Optional)**
  - [ ] Create generation/ subdirectory
  - [ ] Move helper functions to separate modules

## Working through this plan

* Work on one stage at a time
* At the end of each stage:
  * re-run `dune build` in the lablgtk4 folder to verify the code still compiles
  * re-run code generation into the src folder with no filters and ensure there are no meaningufl changes.
  * add any relevant unit tests to test_gir_gen.ml and ensure they run with `xvfb-run dune runtest`


## Overview
The main.ml file is 652 lines with significant repetition. This plan proposes extracting common patterns into helper functions and modules.

## Identified Issues

### 1. **Duplicate Class/Interface Processing** (3 locations)
- Lines 133-159: C file generation for classes
- Lines 162-188: C file generation for interfaces>
- Lines 191-294: ML interface generation for classes
- Lines 296-340: ML interface generation for interfaces
- Lines 346-363: Signal generation for classes
- Lines 366-383: Signal generation for interfaces

**Pattern**: Same logic applied to `controllers` (classes) then `interfaces`, with only field names changing (`class_name` vs `interface_name`, etc.)

### 2. **File Writing Boilerplate** (20+ locations)
```ocaml
let oc = open_out file in
output_string oc content;
close_out oc;
```

### 3. **Repeated Type Context Parameters**
Every generation function receives the same context:
```ocaml
~enums ~bitfields ~records ~classes:controllers
~external_enums:external_enums_with_ns
~external_bitfields:external_bitfields_with_ns
```

### 4. **Duplicate ML Interface/Implementation Generation**
Lines 191-232: Generate `.mli` then `.ml` for classes with nearly identical code
Lines 296-338: Same pattern for interfaces

### 5. **Enum/Bitfield Generation Duplication**
- Lines 116-130: GTK enums/bitfields
- Lines 512-562: External namespace enums/bitfields (same logic)

## Proposed Refactoring

### Step 1: Extract Type Context Record
Create a record to hold all the type information passed around:

```ocaml
type generation_context = {
  classes: gir_class list;
  interfaces: gir_interface list;
  records: gir_record list;
  enums: gir_enum list;
  bitfields: gir_bitfield list;
  external_enums: (string * gir_enum) list;
  external_bitfields: (string * gir_bitfield) list;
  parent_table: (string, string option) Hashtbl.t;
  output_dir: string;
  generated_stubs: string list ref;
  generated_modules: string list ref;
}
```

**Impact**: Reduces 6-8 parameters per function call to 1

### Step 2: Extract File Writing Helper
```ocaml
(* Helper: write content to file *)
let write_file ~path ~content =
  printf "Writing %s...\n" path;
  let oc = open_out path in
  Fun.protect ~finally:(fun () -> close_out oc)
    (fun () -> output_string oc content)
```

**Impact**: Eliminates 20+ repetitions of open/write/close pattern
**Safety**: Adds exception safety with `Fun.protect`

### Step 3: Create Unified Entity Type
Abstract over class vs interface differences:

```ocaml
(* Simple variant - no redundant data in constructors *)
type entity_kind = Class | Interface

type entity = {
  kind: entity_kind;
  name: string;
  c_type: string;
  doc: string option;
  parent: string option;  (* None for interfaces *)
  implements: string list;  (* Empty for interfaces *)
  constructors: gir_constructor list;  (* Empty for interfaces *)
  methods: gir_method list;
  properties: gir_property list;
  signals: gir_signal list;
}

let entity_of_class (cls: gir_class) : entity = {
  kind = Class;
  name = cls.class_name;
  c_type = cls.c_type;
  doc = cls.class_doc;
  parent = cls.parent;
  implements = cls.implements;
  constructors = cls.constructors;
  methods = cls.methods;
  properties = cls.properties;
  signals = cls.signals;
}

let entity_of_interface (intf: gir_interface) : entity = {
  kind = Interface;
  name = intf.interface_name;
  c_type = intf.c_type;
  doc = intf.interface_doc;
  parent = None;
  implements = [];
  constructors = [];
  methods = intf.methods;
  properties = intf.properties;
  signals = intf.signals;
}
```

**Impact**: Allows single iteration over all entities instead of separate class/interface loops
**Design**: `entity_kind` is a simple variant without data - all shared fields are in the `entity` record to avoid redundancy

### Step 4: Extract C Code Generation
```ocaml
let generate_c_stub ctx entity =
  if Exclude_list.should_skip_class entity.name then begin
    printf "  - %s (SKIPPED - incomplete support)\n" entity.name
  end else begin
    printf "  - %s (%d methods, %d properties)\n"
      entity.name (List.length entity.methods) (List.length entity.properties);

    let stub_name = sprintf "ml_%s_gen" (Utils.to_snake_case entity.name) in
    let c_file = Filename.concat ctx.output_dir (stub_name ^ ".c") in

    let c_code = C_stubs.generate_class_c_code
      ~classes:ctx.classes ~records:ctx.records
      ~enums:ctx.enums ~bitfields:ctx.bitfields
      ~external_enums:ctx.external_enums
      ~external_bitfields:ctx.external_bitfields
      ~c_type:entity.c_type
      entity.name entity.constructors entity.methods entity.properties in

    write_file ~path:c_file ~content:c_code;
    ctx.generated_stubs := stub_name :: !(ctx.generated_stubs);
    ctx.generated_modules := (Utils.module_name_of_class entity.name) :: !(ctx.generated_modules);
  end

let generate_all_c_stubs ctx entities =
  List.iter ~f:(generate_c_stub ctx) entities
```

**Impact**: Eliminates duplicate loops at lines 133-159 and 162-188

### Step 5: Extract ML Interface Generation
```ocaml
type output_file_kind = Interface | Implementation

let generate_ml_file ctx entity ~kind parent_chain =
  let ext = match kind with Interface -> ".mli" | Implementation -> ".ml" in
  let ml_file = Filename.concat ctx.output_dir
    (sprintf "%s%s" (Utils.to_snake_case entity.name) ext) in

  let output_mode = match kind with
    | Interface -> Ml_interface.Interface
    | Implementation -> Ml_interface.Implementation in

  let content = Ml_interface.generate_ml_interface
    ~output_mode
    ~class_name:entity.name
    ~class_doc:entity.doc
    ~c_type:entity.c_type
    ~enums:ctx.enums ~bitfields:ctx.bitfields
    ~classes:ctx.classes ~records:ctx.records
    ~parent_chain
    ~constructors:(Some entity.constructors)
    ~methods:entity.methods
    ~properties:entity.properties
    ~signals:entity.signals
    () in

  write_file ~path:ml_file ~content

let generate_ml_interfaces ctx entity =
  if not (Exclude_list.should_skip_class entity.name) then begin
    let parent_chain = parent_chain_for_class ctx.parent_table entity.name in
    generate_ml_file ctx entity ~kind:Interface parent_chain;
    generate_ml_file ctx entity ~kind:Implementation parent_chain
  end
```

**Impact**: Eliminates duplication at lines 191-232, 296-338, and 444-488

### Step 6: Extract High-Level Class Generation
```ocaml
let should_generate_high_level_class ctx entity parent_chain =
  let has_widget_parent =
    String.lowercase_ascii (Utils.normalize_class_name entity.name) = "widget" ||
    List.exists parent_chain ~f:(fun p ->
      String.lowercase_ascii (Utils.normalize_class_name p) = "widget") in
  has_widget_parent

let generate_high_level_class ctx entity parent_chain =
  if not should_generate_high_level_class ctx entity parent_chain then ()
  else begin
    let module_name = Utils.module_name_of_class entity.name in
    let g_file = Filename.concat ctx.output_dir (sprintf "g%s.ml" module_name) in
    let g_sig_file = Filename.concat ctx.output_dir (sprintf "g%s.mli" module_name) in

    (* File existence and overwrite logic extracted to separate function *)
    let should_write = check_should_write_g_file ctx entity.name g_file in

    if should_write then begin
      let impl_content = Class_gen.generate_class_module
        ~classes:ctx.classes ~enums:ctx.enums ~bitfields:ctx.bitfields
        ~records:ctx.records ~c_type:entity.c_type
        ~class_name:entity.name ~parent_chain
        ~methods:entity.methods ~properties:entity.properties
        ~signals:entity.signals in
      write_file ~path:g_file ~content:impl_content;
      ctx.generated_modules := (sprintf "g%s" module_name) :: !(ctx.generated_modules);

      (* Similar for signature file *)
      (* ... *)
    end
  end
```

**Impact**: Simplifies complex logic at lines 234-292

### Step 7: Extract Signal Generation
```ocaml
let generate_signal_class ctx entity parent_chain =
  if Exclude_list.should_skip_class entity.name then ()
  else if List.length entity.signals = 0 then ()
  else begin
    let signal_code = Signal_gen.generate_signal_class
      ~class_name:entity.name
      ~signals:entity.signals
      ~parent_chain in

    let signal_file = Filename.concat ctx.output_dir
      (sprintf "g%s_signals.ml" (Utils.to_snake_case entity.name)) in
    write_file ~path:signal_file ~content:signal_code
  end

let generate_all_signal_classes ctx entities =
  printf "\nGenerating signal classes...\n";
  List.iter entities ~f:(fun entity ->
    let parent_chain = parent_chain_for_class ctx.parent_table entity.name in
    generate_signal_class ctx entity parent_chain
  )
```

**Impact**: Eliminates duplication at lines 346-363 and 366-383

### Step 8: Extract Enum/Bitfield Generation
```ocaml
type namespace_info = {
  name: string;
  prefix: string;
  include_header: string;
}

let gtk_namespace = {
  name = "Gtk";
  prefix = "gtk";
  include_header = "#include <gtk/gtk.h>";
}

let generate_enum_files ctx namespace enums bitfields =
  if List.length enums = 0 && List.length bitfields = 0 then ()
  else begin
    (* Generate OCaml .mli file *)
    let enum_file = Filename.concat ctx.output_dir
      (sprintf "%s_enums.mli" namespace.prefix) in
    let ocaml_content = String.concat "\n" [
      "(* GENERATED CODE - DO NOT EDIT *)";
      sprintf "(* %s Enumeration and Bitfield Types *)\n" namespace.name;
      String.concat "" (List.map ~f:Enum_code.generate_ocaml_enum enums);
      String.concat "" (List.map ~f:Enum_code.generate_ocaml_bitfield bitfields);
    ] in
    write_file ~path:enum_file ~content:ocaml_content;

    (* Generate C converter file *)
    let stub_name = sprintf "ml_%s_enums_gen" namespace.prefix in
    let c_file = Filename.concat ctx.output_dir (stub_name ^ ".c") in
    let c_content = String.concat "" [
      "/* GENERATED CODE - DO NOT EDIT */\n";
      sprintf "/* %s enum/bitfield converters */\n\n" namespace.name;
      "#include <caml/mlvalues.h>\n";
      "#include <caml/memory.h>\n";
      "#include <caml/alloc.h>\n";
      "#include <caml/fail.h>\n";
      "#include <caml/hash.h>\n";
      namespace.include_header ^ "\n\n";
      String.concat "" (List.map ~f:(Enum_code.generate_c_enum_converters ~namespace:namespace.name) enums);
      String.concat "" (List.map ~f:(Enum_code.generate_c_bitfield_converters ~namespace:namespace.name) bitfields);
    ] in
    write_file ~path:c_file ~content:c_content;

    ctx.generated_stubs := stub_name :: !(ctx.generated_stubs);
    ctx.generated_modules := (String.capitalize_ascii (namespace.prefix ^ "_enums")) :: !(ctx.generated_modules);
  end
```

**Impact**: Eliminates duplication between lines 116-130 and 512-562

### Step 9: Restructure Main Function
```ocaml
let generate_bindings filter_file gir_file output_dir =
  printf "Parsing %s ...\n" gir_file;

  (* 1. Parse stage *)
  let parse_result = parse_all_gir_files gir_file filter_file in

  (* 2. Build context *)
  let ctx = create_generation_context parse_result output_dir in

  (* 3. Collect all entities *)
  let entities =
    (List.map ~f:entity_of_class ctx.classes) @
    (List.map ~f:entity_of_interface ctx.interfaces) in

  (* 4. Generate common files *)
  generate_forward_decls_header ctx;
  generate_enum_files ctx gtk_namespace parse_result.gtk_enums parse_result.gtk_bitfields;
  List.iter parse_result.external_namespaces ~f:(fun (ns, enums, bitfields) ->
    generate_enum_files ctx ns enums bitfields
  );

  (* 5. Generate per-entity files *)
  generate_all_c_stubs ctx entities;
  List.iter entities ~f:(fun entity ->
    let parent_chain = parent_chain_for_class ctx.parent_table entity.name in
    generate_ml_interfaces ctx entity;
    generate_high_level_class ctx entity parent_chain
  );
  generate_all_signal_classes ctx entities;

  (* 6. Generate record bindings *)
  generate_record_bindings ctx;

  (* 7. Generate build files *)
  generate_dune_file ctx;

  (* 8. Print summary *)
  print_generation_summary ctx;

  `Ok ()
```

**Impact**: Main function becomes 30 lines instead of 600+

## File Structure After Refactoring

```
lablgtk4/src/tools/gir_gen/
├── main.ml                  (~100 lines - just cmdliner + orchestration)
├── generation/
│   ├── context.ml          (generation_context type + helpers)
│   ├── file_writer.ml      (write_file, file existence checks)
│   ├── entity.ml           (entity type + conversions)
│   ├── c_gen.ml            (generate_c_stub, generate_all_c_stubs)
│   ├── ml_gen.ml           (generate_ml_file, generate_ml_interfaces)
│   ├── class_wrapper_gen.ml (generate_high_level_class)
│   ├── signal_gen.ml       (already exists, just wire it up)
│   ├── enum_gen.ml         (generate_enum_files)
│   ├── record_gen.ml       (generate_record_bindings)
│   └── summary.ml          (print_generation_summary)
└── parse/
    └── gir_parser.ml       (already exists)
```

## Migration Strategy

1. **Phase 1**: Extract helpers without changing structure
   - Add `write_file` helper
   - Add `generation_context` type
   - Keep existing code, just use helpers

2. **Phase 2**: Extract entity abstraction
   - Add `entity` type and conversions
   - Create single combined entity list
   - Keep dual loops but prepare for unification

3. **Phase 3**: Unify processing loops
   - Replace separate class/interface loops with single entity loop
   - Extract generation functions

4. **Phase 4**: Split into modules
   - Move functions to separate files
   - Keep all in same directory initially
   - Update dune file

5. **Phase 5**: Final cleanup
   - Reorganize into generation/ subdirectory
   - Update imports
   - Remove dead code

## Benefits

- **Readability**: Main function becomes ~30 lines showing high-level flow
- **Maintainability**: Each concern in its own module
- **Testability**: Helper functions can be unit tested
- **Extensibility**: Easy to add new entity types or generation passes
- **Safety**: `Fun.protect` adds exception safety to file operations

## Estimated Impact

- **Before**: 652 lines, ~40% repetition
- **After**:
  - main.ml: ~100 lines
  - Helper modules: ~400 lines total
  - **Net reduction**: ~150 lines (23%)
  - **More importantly**: Clear separation of concerns
