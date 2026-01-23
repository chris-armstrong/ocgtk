(* Main Entry Point for GIR Code Generator *)

[@@@warning "-27"]

open Printf
open StdLabels
open Cmdliner
open Gir_gen_lib.Types

(* Helper function to write content to a file *)
let write_file ~path ~content =
  printf "Writing %s...\n" path;
  let oc = open_out path in
  output_string oc content;
  close_out oc

(* Helper function to get the generated output directory *)
let generated_output_dir output_dir = Filename.concat output_dir "generated"

(* Ensure the generated directory exists *)
let ensure_generated_dir output_dir =
  let gen_dir = generated_output_dir output_dir in
  if not (Sys.file_exists gen_dir) then Unix.mkdir gen_dir 0o755

type entity_generators = {
  generate_c_stub_headers :
    ctx:generation_context -> entity:entity -> Buffer.t -> unit;
  generate_c_stub_converters :
    ctx:generation_context -> entity:entity -> Buffer.t -> unit;
  generate_c_stub_constructors :
    ctx:generation_context -> entity:entity -> Buffer.t -> unit;
  generate_c_stub_methods :
    ctx:generation_context -> entity:entity -> Buffer.t -> unit;
  generate_c_stub_properties :
    ctx:generation_context -> entity:entity -> Buffer.t -> unit;
}

let entity_generator_by_entity_type =
  let open Gir_gen_lib.Generate in
  fun entity_type ->
    let generate_c_stub_headers =
     fun ~ctx ~entity buf ->
      (* Add header *)
      Buffer.add_string buf
        (C_stub_helpers.generate_c_file_header ~ctx ~class_name:entity.name
           ~external_enums:ctx.external_enums
           ~external_bitfields:ctx.external_bitfields ())
    in
    let generate_c_stub_constructors =
     fun ~ctx ~(entity : entity) buf ->
      (* Constructors - skip those that throw GError, are variadic, have cross-namespace types, or have array params *)
      C_stub_helpers.generate_constructors ~ctx ~c_type:entity.c_type
        ~class_name:entity.name ~buf
        ~generator:C_stub_constructor.generate_c_constructor entity.constructors
    in
    let generate_c_stub_methods =
     fun ~ctx ~(entity : entity) buf ->
      (* Generate methods, skip duplicates *)
      C_stub_helpers.generate_methods ~ctx ~c_type:entity.c_type
        ~class_name:entity.name ~buf ~generator:C_stub_method.generate_c_method
        entity.methods
    in
    let generate_c_stub_properties =
     fun ~ctx ~(entity : entity) buf ->
      let class_name = entity.name in
      let methods = entity.methods in
      let c_type = entity.c_type in
      let properties = entity.properties in
      (* Generate property getters and setters *)
      List.iter
        ~f:(fun (prop : gir_property) ->
          if Filtering.should_generate_property ~ctx ~class_name ~methods prop
          then begin
            if prop.readable then
              Buffer.add_string buf
                (C_stub_property.generate_c_property_getter ~ctx ~c_type prop
                   class_name);
            if prop.writable && not prop.construct_only then
              Buffer.add_string buf
                (C_stub_property.generate_c_property_setter ~ctx ~c_type prop
                   class_name)
          end)
        properties
    in
    let generate_c_stub_converters ~ctx ~entity buf =
      match entity.kind with
      | Class _ | Interface _ -> ()
      | Record record -> C_stub_record.generate_record_converters ~buf record
    in

    match entity_type with
    | Class _ ->
        {
          generate_c_stub_headers;
          generate_c_stub_converters;
          generate_c_stub_constructors;
          generate_c_stub_methods;
          generate_c_stub_properties;
        }
    | Interface _ ->
        {
          generate_c_stub_headers;
          generate_c_stub_converters;
          generate_c_stub_constructors;
          generate_c_stub_methods;
          generate_c_stub_properties;
        }
    | Record _ ->
        {
          generate_c_stub_headers;
          generate_c_stub_converters;
          generate_c_stub_constructors;
          generate_c_stub_methods;
          generate_c_stub_properties;
        }

(* Generate C stub file for a single entity (class or interface or record) *)
let generate_c_stub ~ctx ~output_dir entity =
  if Gir_gen_lib.Exclude_list.should_skip_class entity.Gir_gen_lib.Types.name
  then begin
    printf "  - %s (SKIPPED - incomplete support)\n"
      entity.Gir_gen_lib.Types.name;
    None
  end
  else begin
    printf "  - %s (%d methods, %d properties)\n" entity.Gir_gen_lib.Types.name
      (List.length entity.Gir_gen_lib.Types.methods)
      (List.length entity.Gir_gen_lib.Types.properties);

    let stub_name =
      sprintf "ml_%s_gen"
        (Gir_gen_lib.Utils.to_snake_case entity.Gir_gen_lib.Types.name)
    in
    let c_file =
      Filename.concat (generated_output_dir output_dir) (stub_name ^ ".c")
    in
    let buf = Buffer.create 4096 in

    (* Note: Record-specific conversions are generated in generate_record_c_code, not here *)
    let {
      generate_c_stub_headers;
      generate_c_stub_converters;
      generate_c_stub_constructors;
      generate_c_stub_methods;
      generate_c_stub_properties;
      _;
    } =
      entity_generator_by_entity_type entity.kind
    in
    generate_c_stub_headers ~ctx ~entity buf;
    generate_c_stub_converters ~ctx ~entity buf;
    generate_c_stub_constructors ~ctx ~entity buf;
    generate_c_stub_methods ~ctx ~entity buf;
    generate_c_stub_properties ~ctx ~entity buf;
    write_file ~path:c_file ~content:(Buffer.contents buf);
    Some stub_name
  end

(* Generate C stub files for all entities *)
let generate_all_c_stubs ~ctx ~output_dir ~generated_stubs entities =
  List.iter
    ~f:(fun entity ->
      generate_c_stub ~ctx ~output_dir entity
      |> Option.iter (fun c_file ->
          generated_stubs := c_file :: !generated_stubs))
    entities

(* Output file kind for ML generation *)
type output_file_kind = Interface | Implementation

(* Namespace information for enum/bitfield generation *)
type namespace_info = {
  name : string; (* Display name, e.g., "Gtk" *)
  prefix : string; (* Lowercase prefix for files, e.g., "gtk" *)
  include_header : string;
      (* C include directive, e.g., "#include <gtk/gtk.h>" *)
}

(* Generate a single ML file (interface or implementation) for an entity *)
let generate_ml_file ~ctx ~output_dir ~kind ~parent_chain entity =
  let ext = match kind with Interface -> ".mli" | Implementation -> ".ml" in
  let ml_file =
    Filename.concat
      (generated_output_dir output_dir)
      (sprintf "%s%s"
         (Gir_gen_lib.Utils.to_snake_case entity.Gir_gen_lib.Types.name)
         ext)
  in

  let output_mode =
    match kind with
    | Interface -> Gir_gen_lib.Generate.Ml_interface.Interface
    | Implementation -> Gir_gen_lib.Generate.Ml_interface.Implementation
  in

  let content =
    Gir_gen_lib.Generate.Ml_interface.generate_ml_interface ~ctx ~output_mode
      ~class_name:entity.Gir_gen_lib.Types.name
      ~class_doc:entity.Gir_gen_lib.Types.doc
      ~c_type:entity.Gir_gen_lib.Types.c_type ~parent_chain
      ~constructors:
        (if List.length entity.Gir_gen_lib.Types.constructors > 0 then
           Some entity.Gir_gen_lib.Types.constructors
         else None)
      ~methods:entity.Gir_gen_lib.Types.methods
      ~properties:entity.Gir_gen_lib.Types.properties
      ~signals:entity.Gir_gen_lib.Types.signals ()
  in

  write_file ~path:ml_file ~content

(* Generate both .mli and .ml files for an entity *)
let generate_ml_interfaces ~ctx ~output_dir ~generated_modules ~parent_chain
    entity =
  if
    not
      (Gir_gen_lib.Exclude_list.should_skip_class entity.Gir_gen_lib.Types.name)
  then begin
    generate_ml_file ~ctx ~output_dir ~kind:Interface ~parent_chain entity;
    generate_ml_file ~ctx ~output_dir ~kind:Implementation ~parent_chain entity;
    generated_modules :=
      Gir_gen_lib.Utils.module_name_of_class entity.Gir_gen_lib.Types.name
      :: !generated_modules
  end

(* Generate high-level wrapper class (g<Widget>.ml) for a class entity *)
let generate_high_level_class ~ctx ~output_dir ~generated_modules entity
    parent_chain =
  if Gir_gen_lib.Exclude_list.should_skip_class entity.Gir_gen_lib.Types.name
  then ()
  else begin
    let module_name =
      Gir_gen_lib.Utils.module_name_of_class entity.Gir_gen_lib.Types.name
    in
    let g_file =
      Filename.concat
        (generated_output_dir output_dir)
        (sprintf "g%s.ml" module_name)
    in
    let g_sig_file =
      Filename.concat
        (generated_output_dir output_dir)
        (sprintf "g%s.mli" module_name)
    in

    (* Check if we're generating to src directory *)
    let output_under_src =
      let norm p = Filename.concat (Filename.dirname p) (Filename.basename p) in
      String.equal (Filename.basename output_dir) "src"
      || String.equal (norm output_dir) (norm "src")
    in

    let g_file_exists = output_under_src && Sys.file_exists g_file in

    (* Always overwrite to enable wholesale regeneration *)
    if g_file_exists then
      printf "Overwriting %s (wholesale regeneration enabled)\n" g_file
    else printf "Creating %s\n" g_file;

    write_file ~path:g_file
      ~content:
        (Gir_gen_lib.Generate.Class_gen.generate_class_module ~ctx
           ~c_type:entity.Gir_gen_lib.Types.c_type
           ~class_name:entity.Gir_gen_lib.Types.name ~parent_chain
           ~methods:entity.Gir_gen_lib.Types.methods
           ~properties:entity.Gir_gen_lib.Types.properties
           ~signals:entity.Gir_gen_lib.Types.signals);
    generated_modules := sprintf "g%s" module_name :: !generated_modules;

    (* Always overwrite signature files too *)
    let g_sig_exists = output_under_src && Sys.file_exists g_sig_file in
    if g_sig_exists then
      printf "Overwriting %s (wholesale regeneration enabled)\n" g_sig_file
    else printf "Creating %s\n" g_sig_file;
    write_file ~path:g_sig_file
      ~content:
        (Gir_gen_lib.Generate.Class_gen.generate_class_signature ~ctx
           ~c_type:entity.Gir_gen_lib.Types.c_type
           ~class_name:entity.Gir_gen_lib.Types.name ~parent_chain
           ~methods:entity.Gir_gen_lib.Types.methods
           ~properties:entity.Gir_gen_lib.Types.properties
           ~signals:entity.Gir_gen_lib.Types.signals)
  end

(* Generate signal class file for a single entity *)
let generate_signal_class ~ctx ~output_dir ~parent_chain entity =
  if Gir_gen_lib.Exclude_list.should_skip_class entity.Gir_gen_lib.Types.name
  then ()
  else if List.length entity.Gir_gen_lib.Types.signals = 0 then ()
  else begin
    let signal_code =
      Gir_gen_lib.Generate.Signal_gen.generate_signal_class ~ctx
        ~class_name:entity.Gir_gen_lib.Types.name
        ~signals:entity.Gir_gen_lib.Types.signals ~parent_chain
    in

    let signal_file =
      Filename.concat
        (generated_output_dir output_dir)
        (sprintf "g%s_signals.ml"
           (Gir_gen_lib.Utils.to_snake_case entity.Gir_gen_lib.Types.name))
    in
    write_file ~path:signal_file ~content:signal_code
  end

(* Generate signal classes for all entities *)
let generate_all_signal_classes ~ctx ~output_dir ~parent_chain_for_class
    entities =
  printf "\nGenerating signal classes...\n";
  List.iter
    ~f:(fun entity ->
      let parent_chain = parent_chain_for_class entity.Gir_gen_lib.Types.name in
      generate_signal_class ~ctx ~output_dir ~parent_chain entity)
    entities

(* Generate combined .ml + .mli for cyclic Layer 1 modules *)
let generate_combined_ml_files ~ctx ~output_dir ~generated_modules ~module_group
    ~parent_chain_for_class =
  let entities =
    Gir_gen_lib.Dependency_analysis.entities_of_group module_group
  in
  let combined_name =
    Gir_gen_lib.Dependency_analysis.module_name_of_group module_group
  in
  let combined_snake = Gir_gen_lib.Utils.to_snake_case combined_name in

  let mli_path =
    Filename.concat (generated_output_dir output_dir) (combined_snake ^ ".mli")
  in
  let ml_path =
    Filename.concat (generated_output_dir output_dir) (combined_snake ^ ".ml")
  in

  let parent_chain_for_entity name = parent_chain_for_class name in

  (* Create a context with current_cycle_classes set *)
  let cycle_class_names =
    List.map ~f:(fun e -> e.Gir_gen_lib.Types.name) entities
  in
  let ctx_with_cycle =
    { ctx with Gir_gen_lib.Types.current_cycle_classes = cycle_class_names }
  in

  let mli_content =
    Gir_gen_lib.Generate.Ml_interface.generate_combined_ml_modules
      ~ctx:ctx_with_cycle
      ~output_mode:Gir_gen_lib.Generate.Ml_interface.Interface ~entities
      ~parent_chain_for_entity ()
  in
  let ml_content =
    Gir_gen_lib.Generate.Ml_interface.generate_combined_ml_modules
      ~ctx:ctx_with_cycle
      ~output_mode:Gir_gen_lib.Generate.Ml_interface.Implementation ~entities
      ~parent_chain_for_entity ()
  in

  write_file ~path:mli_path ~content:mli_content;
  write_file ~path:ml_path ~content:ml_content;
  generated_modules := combined_name :: !generated_modules

(* Generate combined g*.ml + g*.mli for cyclic Layer 2 classes *)
let generate_combined_class_files ~ctx ~output_dir ~generated_modules
    ~module_group ~parent_chain_for_class =
  let entities =
    Gir_gen_lib.Dependency_analysis.entities_of_group module_group
  in
  let combined_name =
    Gir_gen_lib.Dependency_analysis.module_name_of_group module_group
  in
  let g_file =
    Filename.concat
      (generated_output_dir output_dir)
      ("g" ^ Gir_gen_lib.Utils.module_name_of_class combined_name ^ ".ml")
  in
  let g_sig_file =
    Filename.concat
      (generated_output_dir output_dir)
      ("g" ^ Gir_gen_lib.Utils.module_name_of_class combined_name ^ ".mli")
  in

  let parent_chain_for_entity name = parent_chain_for_class name in

  (* For class layer (g*.ml files), do NOT set current_cycle_classes *)
  (* Class files are not mutually recursive - they reference the combined C binding module *)
  (* So all references must be fully qualified *)
  let g_content =
    Gir_gen_lib.Generate.Class_gen.generate_combined_class_module ~ctx
      ~combined_module_name:combined_name ~entities ~parent_chain_for_entity
  in
  let g_sig =
    Gir_gen_lib.Generate.Class_gen.generate_combined_class_signature ~ctx
      ~combined_module_name:combined_name ~entities ~parent_chain_for_entity
  in

  write_file ~path:g_file ~content:g_content;
  write_file ~path:g_sig_file ~content:g_sig;
  generated_modules :=
    ("g" ^ Gir_gen_lib.Utils.module_name_of_class combined_name)
    :: !generated_modules

(* Generate enum and bitfield files for a namespace *)
let generate_enum_files ~output_dir ~generated_stubs ~generated_modules
    namespace enums bitfields =
  if List.length enums = 0 && List.length bitfields = 0 then ()
  else begin
    (* Generate OCaml .mli file with type definitions *)
    let enum_file =
      Filename.concat
        (generated_output_dir output_dir)
        (sprintf "%s_enums.mli" namespace.prefix)
    in
    let ocaml_content_parts =
      [
        "(* GENERATED CODE - DO NOT EDIT *)\n";
        sprintf "(* %s Enumeration and Bitfield Types *)\n\n" namespace.name;
      ]
      @ List.map ~f:Gir_gen_lib.Generate.Enum_code.generate_ocaml_enum enums
      @ List.map ~f:Gir_gen_lib.Generate.Enum_code.generate_ocaml_bitfield
          bitfields
    in
    write_file ~path:enum_file
      ~content:(String.concat ~sep:"" ocaml_content_parts);

    (* Generate C converter file *)
    let stub_name = sprintf "ml_%s_enums_gen" namespace.prefix in
    let c_file =
      Filename.concat (generated_output_dir output_dir) (stub_name ^ ".c")
    in
    let c_content_parts =
      [
        "/* GENERATED CODE - DO NOT EDIT */\n";
        sprintf "/* %s enum/bitfield converters */\n\n" namespace.name;
        "#include <caml/mlvalues.h>\n";
        "#include <caml/memory.h>\n";
        "#include <caml/alloc.h>\n";
        "#include <caml/fail.h>\n";
        "#include <caml/hash.h>\n";
        "#include <glib.h>\n";
        namespace.include_header ^ "\n";
      ]
      @ List.map
          ~f:(fun enum ->
            Gir_gen_lib.Generate.Enum_code.generate_c_enum_converters
              ~namespace:namespace.name enum)
          enums
      @ List.map
          ~f:(fun bitfield ->
            Gir_gen_lib.Generate.Enum_code.generate_c_bitfield_converters
              ~namespace:namespace.name bitfield)
          bitfields
    in
    write_file ~path:c_file ~content:(String.concat ~sep:"" c_content_parts);

    generated_stubs := stub_name :: !generated_stubs;
    generated_modules :=
      String.capitalize_ascii (namespace.prefix ^ "_enums")
      :: !generated_modules
  end

(* Main generation function *)
let generate_bindings filter_file gir_file output_dir =
  printf "Parsing %s ...\n" gir_file;

  (* ==== INITIALIZATION ==== *)

  (* Ensure generated/ directory exists *)
  ensure_generated_dir output_dir;

  (* Track generated C stub files and OCaml modules *)
  let generated_stubs = ref [] in
  let generated_modules = ref [] in

  (* Read filter file if specified *)
  let filter_classes =
    match filter_file with
    | Some f ->
        printf "Reading filter file: %s\n" f;
        let classes = Gir_gen_lib.Utils.read_filter_file f in
        printf "Filter includes %d classes\n" (List.length classes);
        classes
    | None -> []
  in

  (* ==== PARSING STAGE ==== *)

  (* Parse GTK GIR file *)
  let ( repository,
        namespace,
        controllers,
        interfaces,
        gtk_enums,
        gtk_bitfields,
        gtk_records ) =
    Gir_gen_lib.Parse.Gir_parser.parse_gir_file gir_file filter_classes
  in

  printf "Found %d classes\n" (List.length controllers);
  printf "Found %d interfaces\n" (List.length interfaces);
  printf "Found %d Gtk enumerations\n" (List.length gtk_enums);
  printf "Found %d Gtk bitfields\n" (List.length gtk_bitfields);
  printf "Found %d records\n" (List.length gtk_records);

  (* ==== PREPROCESSING STAGE ==== *)

  (* Build parent lookup table for inheritance chains *)
  let parent_table = Hashtbl.create (List.length controllers + 10) in
  List.iter
    ~f:(fun (cls : Gir_gen_lib.Types.gir_class) ->
      Hashtbl.replace parent_table
        (Gir_gen_lib.Utils.normalize_class_name cls.class_name)
        (Option.map Gir_gen_lib.Utils.normalize_class_name cls.parent))
    controllers;

  let parent_chain_for_class name =
    let rec aux current depth =
      if depth > 100 then []
      (* avoid accidental cycles *) else
        match Hashtbl.find_opt parent_table current with
        | Some (Some parent) -> parent :: aux parent (depth + 1)
        | _ -> []
    in
    aux (Gir_gen_lib.Utils.normalize_class_name name) 0
  in

  (* Parse external namespace GIR files for enums/bitfields *)
  let external_namespaces =
    [
      ("Gdk", "/usr/share/gir-1.0/Gdk-4.0.gir");
      ("Pango", "/usr/share/gir-1.0/Pango-1.0.gir");
      ("GdkPixbuf", "/usr/share/gir-1.0/GdkPixbuf-2.0.gir");
      ("Gsk", "/usr/share/gir-1.0/Gsk-4.0.gir");
      ("Graphene", "/usr/share/gir-1.0/Graphene-1.0.gir");
      ("GObject", "/usr/share/gir-1.0/GObject-2.0.gir");
    ]
  in

  let included_namespaces =
    let rec find_included includes =
      includes
      |> List.map ~f:(fun incl ->
          try
            let external_file =
              ListLabels.assoc
                Gir_gen_lib.Types.(incl.include_name)
                external_namespaces
            in
            let repository, _, _, _, _, _, _ =
              Gir_gen_lib.Parse.Gir_parser.parse_gir_file external_file []
            in
            (incl.include_name, external_file)
            :: find_included repository.repository_includes
          with Not_found -> [])
      |> List.flatten
    in
    find_included repository.repository_includes
    |> List.sort_uniq ~cmp:(fun (x1, _) (x2, _) -> String.compare x1 x2)
  in
  let external_enums_bitfields =
    List.map
      ~f:(fun (ns_name, gir_path) ->
        if Sys.file_exists gir_path then begin
          printf "Parsing %s for enums/bitfields...\n" gir_path;
          let ns_enums, ns_bitfields =
            Gir_gen_lib.Parse.Gir_parser.parse_gir_enums_only gir_path
          in
          printf "Found %d %s enumerations, %d %s bitfields\n"
            (List.length ns_enums) ns_name (List.length ns_bitfields) ns_name;
          Some (ns_name, ns_enums, ns_bitfields)
        end
        else begin
          eprintf "Warning: %s not found, skipping external namespace %s\n"
            gir_path ns_name;
          None
        end)
      included_namespaces
    |> List.filter_map ~f:(fun x -> x)
  in

  (* Combine all enums and bitfields for type mapping lookups *)
  let all_enums =
    gtk_enums
    @ (external_enums_bitfields
      |> List.concat_map ~f:(fun (_, enums, _) -> enums))
  in
  let all_bitfields =
    gtk_bitfields
    @ (external_enums_bitfields
      |> List.concat_map ~f:(fun (_, _, bitfields) -> bitfields))
  in

  let enums = all_enums in
  let bitfields = all_bitfields in
  (* Filter out GObject class structs (records with is_gtype_struct_for attribute) *)
  (* Also filter out *Private records - internal structures not in public headers *)
  let records =
    List.filter gtk_records ~f:(fun record ->
        record.Gir_gen_lib.Types.is_gtype_struct_for = None
        && not
             (Gir_gen_lib.Generate.Filtering.should_skip_private_record record))
  in

  (* Prepare external namespace enum/bitfield list with namespace prefixes *)
  let external_enums_with_ns =
    external_enums_bitfields
    |> List.concat_map ~f:(fun (ns, ns_enums, _) ->
        List.map ~f:(fun enum -> (ns, enum)) ns_enums)
  in
  let external_bitfields_with_ns =
    external_enums_bitfields
    |> List.concat_map ~f:(fun (ns, _, ns_bitfields) ->
        List.map ~f:(fun bitfield -> (ns, bitfield)) ns_bitfields)
  in

  (* Create generation context with all type information *)
  let ctx_initial : Gir_gen_lib.Types.generation_context =
    {
      namespace;
      repository;
      classes = controllers;
      interfaces;
      enums;
      bitfields;
      records;
      external_enums = external_enums_with_ns;
      external_bitfields = external_bitfields_with_ns;
      hierarchy_map = Hashtbl.create 0;
      (* Temporary empty map *)
      module_groups = Hashtbl.create 0;
      (* Temporary empty map *)
      current_cycle_classes = [];
      (* No cycle context initially *)
    }
  in

  (* Create unified entity list combining classes, interfaces, and records *)
  let entities : Gir_gen_lib.Types.entity list =
    List.map ~f:Gir_gen_lib.Types.entity_of_class controllers
    @ List.map ~f:Gir_gen_lib.Types.entity_of_interface interfaces
    @ List.map ~f:Gir_gen_lib.Types.entity_of_record records
  in

  (* Compute module groups using SCC algorithm to populate module_groups *)
  let module_groups_list =
    Gir_gen_lib.Dependency_analysis.compute_module_groups ctx_initial entities
  in
  let module_groups =
    Gir_gen_lib.Dependency_analysis.create_module_groups_table
      module_groups_list
  in

  (* Create context with module_groups populated so hierarchy info can use correct module names *)
  let ctx_with_modules =
    { ctx_initial with module_groups; current_cycle_classes = [] }
  in

  (* Build hierarchy map based on class inheritance chains, now with correct module names *)
  let hierarchy_map =
    Gir_gen_lib.Hierarchy_detection.build_hierarchy_map ctx_with_modules
  in

  (* Final context with both hierarchy map and module_groups populated *)
  let ctx : Gir_gen_lib.Types.generation_context =
    { ctx_with_modules with hierarchy_map }
  in

  (* ==== GENERATION STAGE ==== *)

  (* Generate common header file *)
  let header_file =
    Filename.concat
      (generated_output_dir output_dir)
      "generated_forward_decls.h"
  in
  printf "\n";
  let header_content =
    Gir_gen_lib.Generate.C_stubs.generate_forward_decls_header ~ctx
      ~classes:ctx.classes ~gtk_enums ~gtk_bitfields
      ~external_enums:ctx.external_enums ~records:ctx.records
      ~interfaces:ctx.interfaces ~external_bitfields:ctx.external_bitfields
  in
  write_file ~path:header_file ~content:header_content;

  (* Generate enum and bitfield files for current namespace *)
  let ns_name = ctx.namespace.namespace_name in
  let ns_lower = String.lowercase_ascii ns_name in
  let current_namespace =
    {
      name = ns_name;
      prefix = ns_lower;
      include_header =
        Gir_gen_lib.Generate.C_stubs.include_header_for_namespace ns_name;
    }
  in
  generate_enum_files ~output_dir ~generated_stubs ~generated_modules
    current_namespace gtk_enums gtk_bitfields;

  (* Generate C files for all entities (classes and interfaces and records only) *)
  generate_all_c_stubs ~ctx ~output_dir ~generated_stubs entities;

  (* ==== SCC-BASED GENERATION ==== *)

  (* Use the already computed module groups *)
  printf "\nUsing computed dependency groups...\n";
  printf "Found %d module groups (%d cyclic, %d acyclic)\n"
    (List.length module_groups_list)
    (List.length
       (List.filter module_groups_list
          ~f:Gir_gen_lib.Dependency_analysis.is_cyclic_group))
    (List.length
       (List.filter module_groups_list ~f:(fun g ->
            not (Gir_gen_lib.Dependency_analysis.is_cyclic_group g))));

  (* Generate Layer 1 files (OCaml interfaces) *)
  printf "\nGenerating Layer 1 interface files...\n";
  List.iter
    ~f:(fun group ->
      match group with
      | Gir_gen_lib.Dependency_analysis.Single entity ->
          let parent_chain =
            parent_chain_for_class entity.Gir_gen_lib.Types.name
          in
          generate_ml_interfaces ~ctx ~output_dir ~generated_modules
            ~parent_chain entity
      | Gir_gen_lib.Dependency_analysis.Cycle cycle_entities ->
          let names =
            String.concat ~sep:", "
              (List.map cycle_entities ~f:(fun e -> e.Gir_gen_lib.Types.name))
          in
          printf "  Generating combined module for cycle: %s\n" names;
          generate_combined_ml_files ~ctx ~output_dir ~generated_modules
            ~module_group:group ~parent_chain_for_class)
    module_groups_list;

  (* Generate Layer 2 files (high-level wrapper classes) *)
  printf "\nGenerating Layer 2 class files...\n";
  List.iter
    ~f:(fun group ->
      match group with
      | Gir_gen_lib.Dependency_analysis.Single entity ->
          let parent_chain =
            parent_chain_for_class entity.Gir_gen_lib.Types.name
          in
          generate_high_level_class ~ctx ~output_dir ~generated_modules entity
            parent_chain
      | Gir_gen_lib.Dependency_analysis.Cycle cycle_entities ->
          let names =
            String.concat ~sep:", "
              (List.map cycle_entities ~f:(fun e -> e.Gir_gen_lib.Types.name))
          in
          printf "  Generating combined class for cycle: %s\n" names;
          generate_combined_class_files ~ctx ~output_dir ~generated_modules
            ~module_group:group ~parent_chain_for_class)
    module_groups_list;

  (* Generate signal classes for all entities (classes and interfaces) *)
  generate_all_signal_classes ~ctx ~output_dir ~parent_chain_for_class entities;

  (* Generate enum files for external namespaces *)
  (* Only generate these for Gtk - other libraries will use Gtk's converters *)
  let is_gtk = String.lowercase_ascii ctx.namespace.namespace_name = "gtk" in
  if is_gtk then begin
    List.iter
      ~f:(fun (ns_name, ns_enums, ns_bitfields) ->
        let ns_lower = String.lowercase_ascii ns_name in
        let include_header =
          Gir_gen_lib.Generate.C_stubs.include_header_for_namespace ns_name
        in
        let namespace = { name = ns_name; prefix = ns_lower; include_header } in
        generate_enum_files ~output_dir ~generated_stubs ~generated_modules
          namespace ns_enums ns_bitfields)
      external_enums_bitfields
  end;

  (* ==== BUILD CONFIGURATION ==== *)

  (* Generate dune file in generated/ subdirectory *)
  let dune_file =
    Filename.concat (generated_output_dir output_dir) "dune-generated.inc"
  in
  printf "\n";
  let stub_list = List.rev !generated_stubs |> List.sort ~cmp:String.compare in
  let base_modules =
    [
      "gError";
      "gpointer";
      "gaux";
      "gobject";
      "glib";
      "gdk";
      "gdkPixbuf";
      "gdkClipboard";
      "pango";
      "graphene";
      "gtk";
      "gtkSnapshot";
      "eventController";
      "eventControllerKey";
      "eventControllerMotion";
      "gestureClick";
      (* OLD varcc enum modules - REMOVED during migration *)
      (* "Gtk4Enums"; "Gdk4Enums"; "GlibEnums"; "pangoEnums"; "GobjectEnums"; *)
      (* NEW gir_gen enum modules - using lowercase_with_underscore convention *)
      "gtk_enums";
      "gdk_enums";
      "pango_enums";
      "gtkButton";
      "gtkCheckButton";
      "gtkToggleButton";
      "entry";
      "search_entry";
      "password_entry";
      "spin_button";
      "label";
      "image";
      "link_button";
      "menu_button";
      "switch";
      "text_buffer";
      "text_view";
      "text_tag";
      "text_tag_table";
      "button";
      "check_button";
      "toggle_button";
      "adjustment";
      "range";
      "progress_bar";
      "level_bar";
      "scale";
      "box";
      "grid";
      "fixed";
      "paned";
      "notebook";
      "stack";
      "scrolled_window";
      "frame";
      (* NOTE: "editable", "widget", "window" removed - they are generated as part of recursive modules *)
    ]
  in

  (* ==== LIBRARY TOP-LEVEL MODULE ==== *)
  printf "Generating library top-level module...\n";
  let lib_name = String.capitalize_ascii namespace.namespace_name in
  let lib_ml_file =
    Filename.concat (generated_output_dir output_dir) (lib_name ^ ".ml")
  in
  let lib_mli_file =
    Filename.concat (generated_output_dir output_dir) (lib_name ^ ".mli")
  in
  let lib_ml_content, lib_mli_content =
    Gir_gen_lib.Generate.Library_module.generate_library_module ~ctx
  in
  write_file ~path:lib_ml_file ~content:lib_ml_content;
  write_file ~path:lib_mli_file ~content:lib_mli_content;
  generated_modules := lib_name :: !generated_modules;

  let module_list =
    base_modules @ !generated_modules
    |> List.map ~f:String.capitalize_ascii
    |> List.sort_uniq ~cmp:String.compare
  in
  let dune_content =
    Gir_gen_lib.Generate.Dune_file.generate_dune_library ~stub_names:stub_list
      ~lib_name:namespace.namespace_name ~module_names:module_list
      ~package_names:ctx.repository.repository_packages
  in
  write_file ~path:dune_file ~content:dune_content;

  (* ==== SUMMARY ==== *)
  let boxed_record_count =
    List.length
      (List.filter records ~f:Gir_gen_lib.Type_mappings.is_boxed_record)
  in
  let record_binding_count =
    List.length
      (List.filter records ~f:(fun r ->
           Gir_gen_lib.Type_mappings.is_boxed_record r
           && (List.length r.Gir_gen_lib.Types.constructors > 0
              || List.length r.Gir_gen_lib.Types.methods > 0)))
  in

  printf "\n✓ Code generation complete!\n";
  printf "  Generated: %d C files (classes/interfaces) and %d record stubs\n"
    (List.length controllers + List.length interfaces)
    boxed_record_count;
  printf "  Generated: %d OCaml interface files and %d record bindings\n"
    (List.length controllers + List.length interfaces)
    record_binding_count;
  if List.length gtk_enums > 0 || List.length gtk_bitfields > 0 then begin
    let ns_name = ctx.namespace.namespace_name in
    printf
      "  Generated: %s_enums.mli and ml_%s_enums_gen.c (%d enumerations, %d \
       bitfields)\n"
      (String.lowercase_ascii ns_name)
      (String.lowercase_ascii ns_name)
      (List.length gtk_enums)
      (List.length gtk_bitfields)
  end;
  if is_gtk then begin
    List.iter
      ~f:(fun (ns_name, ns_enums, ns_bitfields) ->
        if List.length ns_enums > 0 || List.length ns_bitfields > 0 then
          printf
            "  Generated: %s_enums.mli and ml_%s_enums_gen.c (%d enums, %d \
             bitfields)\n"
            (String.lowercase_ascii ns_name)
            (String.lowercase_ascii ns_name)
            (List.length ns_enums) (List.length ns_bitfields))
      external_enums_bitfields
  end;
  printf "  Generated: dune-generated.inc with %d C stub names\n"
    (List.length stub_list);
  printf "  Generated: %s.ml/.mli (library top-level module)\n" lib_name;
  `Ok ()

(* Cmdliner argument definitions *)
let filter_arg =
  let doc = "Filter file specifying which classes to generate" in
  Arg.(value & opt (some file) None & info [ "f"; "filter" ] ~docv:"FILE" ~doc)

let gir_file_arg =
  let doc = "Path to GTK GIR file (e.g., /usr/share/gir-1.0/Gtk-4.0.gir)" in
  Arg.(required & pos 0 (some file) None & info [] ~docv:"GIR_FILE" ~doc)

let output_dir_arg =
  let doc = "Output directory for generated files" in
  Arg.(required & pos 1 (some dir) None & info [] ~docv:"OUTPUT_DIR" ~doc)

(* Command definition *)
let gir_gen_cmd =
  let doc = "Generate C FFI bindings and OCaml modules from GTK GIR files" in
  let man =
    [
      `S Manpage.s_description;
      `P
        "gir_gen parses GTK GObject Introspection (GIR) files and generates C \
         FFI bindings and OCaml module interfaces for GTK4 event controllers \
         and widgets.";
      `S Manpage.s_examples;
      `P "Generate event controller bindings:";
      `Pre "  gir_gen /usr/share/gir-1.0/Gtk-4.0.gir ./output";
      `S Manpage.s_bugs;
      `P "Report bugs to https://github.com/chris-armstrong/ocgtk/issues";
    ]
  in
  let info = Cmd.info "gir_gen" ~version:"5.0.0" ~doc ~man in
  Cmd.v info
    Term.(
      ret (const generate_bindings $ filter_arg $ gir_file_arg $ output_dir_arg))

(* Main entry point *)
let () = exit (Cmd.eval gir_gen_cmd)
