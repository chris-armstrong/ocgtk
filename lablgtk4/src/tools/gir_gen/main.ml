(* Main Entry Point for GIR Code Generator *)

[@@@warning "-27"]

open Printf
open StdLabels
open Cmdliner

(* Helper function to write content to a file *)
let write_file ~path ~content =
  printf "Writing %s...\n" path;
  let oc = open_out path in
  output_string oc content;
  close_out oc

(* Generate C stub file for a single entity (class or interface) *)
let generate_c_stub ~ctx ~output_dir ~generated_stubs ~generated_modules entity =
  if Gir_gen_lib.Exclude_list.should_skip_class entity.Gir_gen_lib.Types.name then begin
    printf "  - %s (SKIPPED - incomplete support)\n" entity.Gir_gen_lib.Types.name
  end else begin
    printf "  - %s (%d methods, %d properties)\n"
      entity.Gir_gen_lib.Types.name
      (List.length entity.Gir_gen_lib.Types.methods)
      (List.length entity.Gir_gen_lib.Types.properties);

    let stub_name = sprintf "ml_%s_gen" (Gir_gen_lib.Utils.to_snake_case entity.Gir_gen_lib.Types.name) in
    let c_file = Filename.concat output_dir (stub_name ^ ".c") in

    let c_code = Gir_gen_lib.Generate.C_stubs.generate_class_c_code
      ~ctx
      ~c_type:entity.Gir_gen_lib.Types.c_type
      entity.Gir_gen_lib.Types.name
      entity.Gir_gen_lib.Types.constructors
      entity.Gir_gen_lib.Types.methods
      entity.Gir_gen_lib.Types.properties in

    write_file ~path:c_file ~content:c_code;
    generated_stubs := stub_name :: !generated_stubs;
    generated_modules := (Gir_gen_lib.Utils.module_name_of_class entity.Gir_gen_lib.Types.name) :: !generated_modules;
  end

(* Generate C stub files for all entities *)
let generate_all_c_stubs ~ctx ~output_dir ~generated_stubs ~generated_modules entities =
  List.iter ~f:(generate_c_stub ~ctx ~output_dir ~generated_stubs ~generated_modules) entities

(* Main generation function *)
let generate_bindings filter_file gir_file output_dir =
  printf "Parsing %s ...\n" gir_file;

  (* Track generated C stub files and OCaml modules *)
  let generated_stubs = ref [] in
  let generated_modules = ref [] in

  (* Read filter file if specified *)
  let filter_classes = match filter_file with
    | Some f ->
      printf "Reading filter file: %s\n" f;
      let classes = Gir_gen_lib.Utils.read_filter_file f in
      printf "Filter includes %d classes\n" (List.length classes);
      classes
    | None -> []
  in

  (* Parse stage: read GIR files *)
  let (controllers, interfaces, gtk_enums, gtk_bitfields, gtk_records) = Gir_gen_lib.Parse.Gir_parser.parse_gir_file gir_file filter_classes in

  printf "Found %d classes\n" (List.length controllers);
  printf "Found %d interfaces\n" (List.length interfaces);
  printf "Found %d Gtk enumerations\n" (List.length gtk_enums);
  printf "Found %d Gtk bitfields\n" (List.length gtk_bitfields);
  printf "Found %d records\n" (List.length gtk_records);

  (* Build parent lookup table for inheritance chains *)
  let parent_table = Hashtbl.create (List.length controllers + 10) in
  List.iter ~f:(fun (cls : Gir_gen_lib.Types.gir_class) ->
    Hashtbl.replace parent_table
      (Gir_gen_lib.Utils.normalize_class_name cls.class_name)
      (Option.map Gir_gen_lib.Utils.normalize_class_name cls.parent)
  ) controllers;

  let parent_chain_for_class name =
    let rec aux current depth =
      if depth > 100 then [] (* avoid accidental cycles *) else
      match Hashtbl.find_opt parent_table current with
      | Some (Some parent) -> parent :: aux parent (depth + 1)
      | _ -> []
    in
    aux (Gir_gen_lib.Utils.normalize_class_name name) 0
  in

  (* Parse external namespace GIR files for enums/bitfields *)
  let external_namespaces = [
    ("Gdk", "/usr/share/gir-1.0/Gdk-4.0.gir");
    ("Pango", "/usr/share/gir-1.0/Pango-1.0.gir");
  ] in

  let external_enums_bitfields = List.map ~f:(fun (ns_name, gir_path) ->
    if Sys.file_exists gir_path then begin
      printf "Parsing %s for enums/bitfields...\n" gir_path;
      let (ns_enums, ns_bitfields) = Gir_gen_lib.Parse.Gir_parser.parse_gir_enums_only gir_path in
      printf "Found %d %s enumerations, %d %s bitfields\n"
        (List.length ns_enums) ns_name (List.length ns_bitfields) ns_name;
      Some (ns_name, ns_enums, ns_bitfields)
    end else begin
      eprintf "Warning: %s not found, skipping external namespace %s\n" gir_path ns_name;
      None
    end
  ) external_namespaces |> List.filter_map ~f:(fun x -> x) in

  (* Combine all enums and bitfields for type mapping lookups *)
  let all_enums = gtk_enums @ (external_enums_bitfields |> List.concat_map ~f:(fun (_, enums, _) -> enums)) in
  let all_bitfields = gtk_bitfields @ (external_enums_bitfields |> List.concat_map ~f:(fun (_, _, bitfields) -> bitfields)) in

  let enums = all_enums in
  let bitfields = all_bitfields in
  let records = gtk_records in

  (* Prepare external namespace enum/bitfield list with namespace prefixes *)
  let external_enums_with_ns = external_enums_bitfields |> List.concat_map ~f:(fun (ns, ns_enums, _) ->
    List.map ~f:(fun enum -> (ns, enum)) ns_enums
  ) in
  let external_bitfields_with_ns = external_enums_bitfields |> List.concat_map ~f:(fun (ns, _, ns_bitfields) ->
    List.map ~f:(fun bitfield -> (ns, bitfield)) ns_bitfields
  ) in

  (* Create generation context with all type information *)
  let ctx : Gir_gen_lib.Types.generation_context = {
    classes = controllers;
    interfaces;
    enums;
    bitfields;
    records;
    external_enums = external_enums_with_ns;
    external_bitfields = external_bitfields_with_ns;
  } in

  (* Create unified entity list combining classes and interfaces *)
  let entities : Gir_gen_lib.Types.entity list =
    (List.map ~f:Gir_gen_lib.Types.entity_of_class controllers) @
    (List.map ~f:Gir_gen_lib.Types.entity_of_interface interfaces)
  in

  (* Generate stage: produce output files *)
  let forced_widget_classes =
    (* Keep this list small: we overwrite these even if files already exist to validate class_gen output. *)
    ["Button"; "Label"; "Range"]
    |> List.map ~f:(fun name ->
      name |> Gir_gen_lib.Utils.normalize_class_name |> String.lowercase_ascii)
  in
  let should_force_generate class_name =
    let normalized = class_name |> Gir_gen_lib.Utils.normalize_class_name |> String.lowercase_ascii in
    List.exists forced_widget_classes ~f:(String.equal normalized)
  in

  (* Generate common header file *)
  let header_file = Filename.concat output_dir "generated_forward_decls.h" in
  printf "\n";
  let header_content = Gir_gen_lib.Generate.C_stubs.generate_forward_decls_header
    ~classes:ctx.classes
    ~gtk_enums:gtk_enums
    ~gtk_bitfields:gtk_bitfields
    ~external_enums:ctx.external_enums
    ~records:ctx.records
    ~external_bitfields:ctx.external_bitfields in
  write_file ~path:header_file ~content:header_content;

  (* Generate GTK enum and bitfield converters *)
  if List.length gtk_enums > 0 || List.length gtk_bitfields > 0 then begin
    let c_file = Filename.concat output_dir "ml_gtk_enums_gen.c" in
    printf "\n";
    let content_parts = [
      Gir_gen_lib.Generate.C_stubs.generate_c_file_header ~class_name:"GTK enums and bitfields" ~external_enums:[] ~external_bitfields:[] ();
    ] @ (List.map ~f:(fun enum ->
      Gir_gen_lib.Generate.Enum_code.generate_c_enum_converters ~namespace:"Gtk" enum
    ) gtk_enums) @ (List.map ~f:(fun bitfield ->
      Gir_gen_lib.Generate.Enum_code.generate_c_bitfield_converters ~namespace:"Gtk" bitfield
    ) gtk_bitfields) in
    write_file ~path:c_file ~content:(String.concat ~sep:"" content_parts);
    generated_stubs := "ml_gtk_enums_gen" :: !generated_stubs;
    generated_modules := "Gtk_enums" :: !generated_modules;
  end;

  (* Generate C files for all entities (classes and interfaces) *)
  generate_all_c_stubs ~ctx ~output_dir ~generated_stubs ~generated_modules entities;

  (* Generate OCaml interface files for classes *)
  List.iter ~f:(fun cls ->
    if not (Gir_gen_lib.Exclude_list.should_skip_class cls.Gir_gen_lib.Types.class_name) then begin
      let parent_chain = parent_chain_for_class cls.Gir_gen_lib.Types.class_name in
      let ml_file = Filename.concat output_dir
        (sprintf "%s.mli" (Gir_gen_lib.Utils.to_snake_case cls.Gir_gen_lib.Types.class_name)) in
      write_file ~path:ml_file ~content:(Gir_gen_lib.Generate.Ml_interface.generate_ml_interface
        ~ctx
        ~output_mode:Gir_gen_lib.Generate.Ml_interface.Interface
        ~class_name:cls.Gir_gen_lib.Types.class_name
        ~class_doc:cls.Gir_gen_lib.Types.class_doc
        ~c_type:cls.Gir_gen_lib.Types.c_type
        ~parent_chain
        ~constructors:(Some cls.Gir_gen_lib.Types.constructors)
        ~methods:cls.Gir_gen_lib.Types.methods
        ~properties:cls.Gir_gen_lib.Types.properties
        ~signals:cls.Gir_gen_lib.Types.signals
        ());

      let ml_impl_file = Filename.concat output_dir
        (sprintf "%s.ml" (Gir_gen_lib.Utils.to_snake_case cls.Gir_gen_lib.Types.class_name)) in
      write_file ~path:ml_impl_file ~content:(Gir_gen_lib.Generate.Ml_interface.generate_ml_interface
        ~ctx
        ~output_mode:Gir_gen_lib.Generate.Ml_interface.Implementation
        ~class_name:cls.Gir_gen_lib.Types.class_name
        ~class_doc:cls.Gir_gen_lib.Types.class_doc
        ~c_type:cls.Gir_gen_lib.Types.c_type
        ~parent_chain
        ~constructors:(Some cls.Gir_gen_lib.Types.constructors)
        ~methods:cls.Gir_gen_lib.Types.methods
        ~properties:cls.Gir_gen_lib.Types.properties
        ~signals:cls.Gir_gen_lib.Types.signals
        ());

      (* Generate high-level wrapper class (g<Widget>.ml) *)
      let has_widget_parent =
        String.lowercase_ascii (Gir_gen_lib.Utils.normalize_class_name cls.Gir_gen_lib.Types.class_name) = "widget" ||
        List.exists parent_chain ~f:(fun p -> String.lowercase_ascii (Gir_gen_lib.Utils.normalize_class_name p) = "widget")
      in
      if has_widget_parent then begin
        let g_file = Filename.concat output_dir
          (sprintf "g%s.ml" (Gir_gen_lib.Utils.module_name_of_class cls.Gir_gen_lib.Types.class_name)) in
        let g_sig_file = Filename.concat output_dir
          (sprintf "g%s.mli" (Gir_gen_lib.Utils.module_name_of_class cls.Gir_gen_lib.Types.class_name)) in
        let output_under_src =
          let norm p = Filename.concat (Filename.dirname p) (Filename.basename p) in
          String.equal (Filename.basename output_dir) "src" || String.equal (norm output_dir) (norm "src")
        in
        let should_overwrite = should_force_generate cls.Gir_gen_lib.Types.class_name in
        let g_file_exists = output_under_src && Sys.file_exists g_file in
        if g_file_exists && not should_overwrite then
          printf "Skipping %s (already exists)\n" g_file
        else begin
          if should_overwrite && g_file_exists then
            printf "Overwriting %s (forced validation)\n" g_file;
          write_file ~path:g_file ~content:(Gir_gen_lib.Generate.Class_gen.generate_class_module
            ~ctx
            ~c_type:cls.Gir_gen_lib.Types.c_type
            ~class_name:cls.Gir_gen_lib.Types.class_name
            ~parent_chain
            ~methods:cls.Gir_gen_lib.Types.methods
            ~properties:cls.Gir_gen_lib.Types.properties
            ~signals:cls.Gir_gen_lib.Types.signals);
          generated_modules := (sprintf "g%s" (Gir_gen_lib.Utils.module_name_of_class cls.Gir_gen_lib.Types.class_name)) :: !generated_modules;

          let g_sig_exists = output_under_src && Sys.file_exists g_sig_file in
          if not (g_sig_exists && not should_overwrite) then begin
            if should_overwrite && g_sig_exists then
              printf "Overwriting %s (forced validation)\n" g_sig_file;
            write_file ~path:g_sig_file ~content:(Gir_gen_lib.Generate.Class_gen.generate_class_signature
              ~ctx
              ~c_type:cls.Gir_gen_lib.Types.c_type
              ~class_name:cls.Gir_gen_lib.Types.class_name
              ~parent_chain
              ~methods:cls.Gir_gen_lib.Types.methods
              ~properties:cls.Gir_gen_lib.Types.properties
              ~signals:cls.Gir_gen_lib.Types.signals);
          end else
            printf "Skipping %s (already exists)\n" g_sig_file;
        end
      end;
    end
  ) ctx.classes;

  (* Generate OCaml interface files for interfaces *)
  List.iter ~f:(fun cls ->
    if not (Gir_gen_lib.Exclude_list.should_skip_class cls.Gir_gen_lib.Types.interface_name) then begin
      let parent_chain = parent_chain_for_class cls.Gir_gen_lib.Types.interface_name in
      let ml_file = Filename.concat output_dir
        (sprintf "%s.mli" (Gir_gen_lib.Utils.to_snake_case cls.Gir_gen_lib.Types.interface_name)) in
      write_file ~path:ml_file ~content:(Gir_gen_lib.Generate.Ml_interface.generate_ml_interface
        ~ctx
        ~output_mode:Gir_gen_lib.Generate.Ml_interface.Interface
        ~class_name:cls.Gir_gen_lib.Types.interface_name
        ~class_doc:cls.Gir_gen_lib.Types.interface_doc
        ~c_type:cls.Gir_gen_lib.Types.c_type
        ~parent_chain
        ~constructors:None
        ~methods:cls.Gir_gen_lib.Types.methods
        ~properties:cls.Gir_gen_lib.Types.properties
        ~signals:cls.Gir_gen_lib.Types.signals
        ());

      let ml_impl_file = Filename.concat output_dir
        (sprintf "%s.ml" (Gir_gen_lib.Utils.to_snake_case cls.Gir_gen_lib.Types.interface_name)) in
      write_file ~path:ml_impl_file ~content:(Gir_gen_lib.Generate.Ml_interface.generate_ml_interface
        ~ctx
        ~output_mode:Gir_gen_lib.Generate.Ml_interface.Implementation
        ~class_name:cls.Gir_gen_lib.Types.interface_name
        ~class_doc:cls.Gir_gen_lib.Types.interface_doc
        ~c_type:cls.Gir_gen_lib.Types.c_type
        ~parent_chain
        ~constructors:None
        ~methods:cls.Gir_gen_lib.Types.methods
        ~properties:cls.Gir_gen_lib.Types.properties
        ~signals:cls.Gir_gen_lib.Types.signals
        ());
    end
  ) ctx.interfaces;

  (* Generate signal classes for ALL classes (controllers and interfaces) *)
  printf "\nGenerating signal classes...\n";

  (* Process controllers *)
  List.iter ~f:(fun cls ->
    if not (Gir_gen_lib.Exclude_list.should_skip_class cls.Gir_gen_lib.Types.class_name) then begin
      if List.length cls.Gir_gen_lib.Types.signals > 0 then begin
        let parent_chain = parent_chain_for_class cls.Gir_gen_lib.Types.class_name in
        let signal_code = Gir_gen_lib.Generate.Signal_gen.generate_signal_class
          ~ctx
          ~class_name:cls.Gir_gen_lib.Types.class_name
          ~signals:cls.Gir_gen_lib.Types.signals
          ~parent_chain in

        let signal_file = Filename.concat output_dir
          (sprintf "g%s_signals.ml" (Gir_gen_lib.Utils.to_snake_case cls.Gir_gen_lib.Types.class_name)) in
        write_file ~path:signal_file ~content:signal_code;
      end
    end
  ) ctx.classes;

  (* Process interfaces *)
  List.iter ~f:(fun intf ->
    if not (Gir_gen_lib.Exclude_list.should_skip_class intf.Gir_gen_lib.Types.interface_name) then begin
      if List.length intf.Gir_gen_lib.Types.signals > 0 then begin
        let parent_chain = parent_chain_for_class intf.Gir_gen_lib.Types.interface_name in
        let signal_code = Gir_gen_lib.Generate.Signal_gen.generate_signal_class
          ~ctx
          ~class_name:intf.Gir_gen_lib.Types.interface_name
          ~signals:intf.Gir_gen_lib.Types.signals
          ~parent_chain in

        let signal_file = Filename.concat output_dir
          (sprintf "g%s_signals.ml" (Gir_gen_lib.Utils.to_snake_case intf.Gir_gen_lib.Types.interface_name)) in
        write_file ~path:signal_file ~content:signal_code;
      end
    end
  ) ctx.interfaces;

  (* Generate C files and OCaml bindings for boxed records *)
  List.iter ~f:(fun record ->
    if Gir_gen_lib.Type_mappings.is_boxed_record record then begin
      (* let value_record_macros = ["GtkTreeIter"; "GtkTextIter"; "GtkRequisition"; "GtkBorder"] in *)
      let is_value_record = not record.opaque
        (* List.mem record.Gir_gen_lib.Types.c_type ~set:value_record_macros
        || (List.length record.Gir_gen_lib.Types.fields > 0 && List.length record.Gir_gen_lib.Types.constructors = 0) *)
      in
      let constructors =
        if (not record.Gir_gen_lib.Types.opaque) && (not is_value_record) && record.Gir_gen_lib.Types.constructors = [] then
          let class_snake = Gir_gen_lib.Utils.to_snake_case record.Gir_gen_lib.Types.record_name in
          let c_id = "gtk_" ^ class_snake ^ "_new" in
          [{ Gir_gen_lib.Types.ctor_name = "new";
             c_identifier = c_id;
             ctor_parameters = [];
             ctor_doc = Some ("Allocate a new " ^ record.Gir_gen_lib.Types.record_name ^ " using g_new0");
             throws = false; }]
        else
          record.Gir_gen_lib.Types.constructors
      in
      printf "  - %s (record: %d constructors, %d methods)\n"
        record.Gir_gen_lib.Types.record_name
        (List.length constructors)
        (List.length record.Gir_gen_lib.Types.methods);

      let stub_name = sprintf "ml_%s_record_gen" (Gir_gen_lib.Utils.to_snake_case record.Gir_gen_lib.Types.record_name) in
      let c_file = Filename.concat output_dir (stub_name ^ ".c") in

      let c_code = Gir_gen_lib.Generate.C_stubs.generate_record_c_code
        ~ctx
        { record with Gir_gen_lib.Types.constructors = constructors }
      in
      write_file ~path:c_file ~content:c_code;
      generated_stubs := stub_name :: !generated_stubs;

      let has_bindings =
        (List.length constructors > 0) ||
        (List.length record.Gir_gen_lib.Types.methods > 0)
      in
      if has_bindings then begin
        let base_type =
          match Gir_gen_lib.Type_mappings.find_type_mapping_for_gir_type
              ~ctx
              { Gir_gen_lib.Types.name = record.Gir_gen_lib.Types.record_name;
                c_type = record.Gir_gen_lib.Types.c_type ^ "*";
                nullable = false; } with
          | Some mapping ->
            Gir_gen_lib.Type_mappings.qualify_ocaml_type
              ~gir_type_name:(Some record.Gir_gen_lib.Types.record_name) mapping.ocaml_type
          | None -> "Obj.t"
        in

        let ml_file = Filename.concat output_dir
          (sprintf "%s.mli" (Gir_gen_lib.Utils.to_snake_case record.Gir_gen_lib.Types.record_name)) in
        write_file ~path:ml_file ~content:(Gir_gen_lib.Generate.Ml_interface.generate_ml_interface
          ~ctx
          ~output_mode:Gir_gen_lib.Generate.Ml_interface.Interface
          ~class_name:record.Gir_gen_lib.Types.record_name
          ~class_doc:record.Gir_gen_lib.Types.record_doc
          ~c_type:record.Gir_gen_lib.Types.c_type
          ~parent_chain:[]
          ~constructors:(Some constructors)
          ~methods:record.Gir_gen_lib.Types.methods
          ~properties:[]
          ~signals:[]
          ?c_symbol_prefix:record.Gir_gen_lib.Types.c_symbol_prefix
          ~record_base_type:base_type
          ~is_record:true
          ());

        let ml_impl_file = Filename.concat output_dir
          (sprintf "%s.ml" (Gir_gen_lib.Utils.to_snake_case record.Gir_gen_lib.Types.record_name)) in
        write_file ~path:ml_impl_file ~content:(Gir_gen_lib.Generate.Ml_interface.generate_ml_interface
          ~ctx
          ~output_mode:Gir_gen_lib.Generate.Ml_interface.Implementation
          ~class_name:record.Gir_gen_lib.Types.record_name
          ~class_doc:record.Gir_gen_lib.Types.record_doc
          ~c_type:record.Gir_gen_lib.Types.c_type
          ~parent_chain:[]
          ~constructors:(Some constructors)
          ~methods:record.Gir_gen_lib.Types.methods
          ~properties:[]
          ~signals:[]
          ?c_symbol_prefix:record.Gir_gen_lib.Types.c_symbol_prefix
          ~record_base_type:base_type
          ~is_record:true
          ());

        generated_modules := (Gir_gen_lib.Utils.module_name_of_class record.Gir_gen_lib.Types.record_name) :: !generated_modules;
      end
    end
  ) ctx.records;

  (* Generate GTK enum and bitfield types file *)
  if List.length gtk_enums > 0 || List.length gtk_bitfields > 0 then begin
    let enum_file = Filename.concat output_dir "gtk_enums.mli" in
    let content_parts = [
      "(* GENERATED CODE - DO NOT EDIT *)\n";
      "(* GTK4 Enumeration and Bitfield Types *)\n\n";
    ] @ (List.map ~f:Gir_gen_lib.Generate.Enum_code.generate_ocaml_enum gtk_enums)
      @ (List.map ~f:Gir_gen_lib.Generate.Enum_code.generate_ocaml_bitfield gtk_bitfields) in
    write_file ~path:enum_file ~content:(String.concat ~sep:"" content_parts);
  end;

  (* Generate enum files for external namespaces *)
  List.iter ~f:(fun (ns_name, ns_enums, ns_bitfields) ->
    let ns_lower = String.lowercase_ascii ns_name in
    let ns_module = String.capitalize_ascii (ns_lower ^ "_enums") in

    (* Generate OCaml enum file *)
    if List.length ns_enums > 0 || List.length ns_bitfields > 0 then begin
      let enum_file = Filename.concat output_dir (sprintf "%s_enums.mli" ns_lower) in
      let content_parts = [
        "(* GENERATED CODE - DO NOT EDIT *)\n";
        sprintf "(* %s Enumeration and Bitfield Types *)\n\n" ns_name;
      ] @ (List.map ~f:Gir_gen_lib.Generate.Enum_code.generate_ocaml_enum ns_enums)
        @ (List.map ~f:Gir_gen_lib.Generate.Enum_code.generate_ocaml_bitfield ns_bitfields) in
      write_file ~path:enum_file ~content:(String.concat ~sep:"" content_parts);
      generated_modules := ns_module :: !generated_modules;
    end;

    (* Generate C converter file *)
    if List.length ns_enums > 0 || List.length ns_bitfields > 0 then begin
      let stub_name = sprintf "ml_%s_enums_gen" ns_lower in
      let c_file = Filename.concat output_dir (stub_name ^ ".c") in
      let include_header =
        if ns_lower = "gdk" then "#include <gdk/gdk.h>\n\n"
        else if ns_lower = "pango" then "#include <pango/pango.h>\n\n"
        else sprintf "#include <%s/%s.h>\n\n" ns_lower ns_lower
      in
      let content_parts = [
        sprintf "/* GENERATED CODE - DO NOT EDIT */\n";
        sprintf "/* %s enum/bitfield converters */\n\n" ns_name;
        "#include <caml/mlvalues.h>\n";
        "#include <caml/memory.h>\n";
        "#include <caml/alloc.h>\n";
        "#include <caml/fail.h>\n";
        "#include <caml/hash.h>\n";
        include_header;
      ] @ (List.map ~f:(fun enum ->
        Gir_gen_lib.Generate.Enum_code.generate_c_enum_converters ~namespace:ns_name enum
      ) ns_enums) @ (List.map ~f:(fun bitfield ->
        Gir_gen_lib.Generate.Enum_code.generate_c_bitfield_converters ~namespace:ns_name bitfield
      ) ns_bitfields) in
      write_file ~path:c_file ~content:(String.concat ~sep:"" content_parts);
      generated_stubs := stub_name :: !generated_stubs;
    end;
  ) external_enums_bitfields;

  (* Generate dune file *)
  let dune_file = Filename.concat output_dir "dune-generated.inc" in
  printf "\n";
  let stub_list = List.rev !generated_stubs |> List.sort ~cmp:String.compare in
  let base_modules = [
    "gError"; "gpointer"; "gaux"; "gobject"; "glib"; "gdk"; "gdkPixbuf";
    "gdkClipboard"; "pango"; "graphene"; "gtk"; "gtkSnapshot";
    "eventController"; "eventControllerKey"; "eventControllerMotion"; "gestureClick";
    "gObj"; "gBox"; "gGrid"; "gFixed"; "gPaned"; "gNotebook"; "gStack"; "gWindow";
    "gScrolledWindow"; "gFrame"; "gPack"; "gMain";
    "Gtk4Enums"; "Gdk4Enums"; "GlibEnums"; "pangoEnums"; "GobjectEnums";
    "gtk_enums"; "gdk_enums"; "pango_enums"; "gtkButton"; "gtkCheckButton";
    "gtkToggleButton"; "gButton"; "gRange"; "entry"; "search_entry"; "password_entry";
    "spin_button"; "label"; "image"; "link_button"; "menu_button"; "switch";
    "text_buffer"; "text_view"; "text_tag"; "text_tag_table"; "button"; "check_button";
    "toggle_button"; "adjustment"; "range"; "progress_bar"; "level_bar"; "scale";
    "editable"; "widget"; "box"; "grid"; "fixed"; "paned"; "notebook"; "stack";
    "window"; "scrolled_window"; "frame";
  ] in
  let module_list =
    (base_modules @ !generated_modules)
    |> List.map ~f:String.capitalize_ascii
    |> List.sort_uniq ~cmp:String.compare
  in
  let dune_content = Gir_gen_lib.Generate.Dune_file.generate_dune_library
    ~stub_names:stub_list
    ~module_names:module_list in
  write_file ~path:dune_file ~content:dune_content;

  let boxed_record_count =
    List.length (List.filter records ~f:Gir_gen_lib.Type_mappings.is_boxed_record)
  in
  let record_binding_count =
    List.length (List.filter records ~f:(fun r ->
      Gir_gen_lib.Type_mappings.is_boxed_record r &&
      ((List.length r.Gir_gen_lib.Types.constructors) > 0 || (List.length r.Gir_gen_lib.Types.methods) > 0)))
  in

  printf "\n✓ Code generation complete!\n";
  printf "  Generated: %d C files (classes/interfaces) and %d record stubs\n"
    ((List.length controllers) + (List.length interfaces)) boxed_record_count;
  printf "  Generated: %d OCaml interface files and %d record bindings\n"
    ((List.length controllers) + (List.length interfaces)) record_binding_count;
  if List.length gtk_enums > 0 || List.length gtk_bitfields > 0 then
    printf "  Generated: gtk_enums.mli and ml_gtk_enums_gen.c (%d enumerations, %d bitfields)\n"
      (List.length gtk_enums) (List.length gtk_bitfields);
  List.iter ~f:(fun (ns_name, ns_enums, ns_bitfields) ->
    if List.length ns_enums > 0 || List.length ns_bitfields > 0 then
      printf "  Generated: %s_enums.mli and ml_%s_enums_gen.c (%d enums, %d bitfields)\n"
        (String.lowercase_ascii ns_name) (String.lowercase_ascii ns_name)
        (List.length ns_enums) (List.length ns_bitfields);
  ) external_enums_bitfields;
  printf "  Generated: dune-generated.inc with %d C stub names\n" (List.length stub_list);
  `Ok ()

(* Cmdliner argument definitions *)
let filter_arg =
  let doc = "Filter file specifying which classes to generate" in
  Arg.(value & opt (some file) None & info ["f"; "filter"] ~docv:"FILE" ~doc)

let gir_file_arg =
  let doc = "Path to GTK GIR file (e.g., /usr/share/gir-1.0/Gtk-4.0.gir)" in
  Arg.(required & pos 0 (some file) None & info [] ~docv:"GIR_FILE" ~doc)

let output_dir_arg =
  let doc = "Output directory for generated files" in
  Arg.(required & pos 1 (some dir) None & info [] ~docv:"OUTPUT_DIR" ~doc)

(* Command definition *)
let gir_gen_cmd =
  let doc = "Generate C FFI bindings and OCaml modules from GTK GIR files" in
  let man = [
    `S Manpage.s_description;
    `P "gir_gen parses GTK GObject Introspection (GIR) files and generates \
        C FFI bindings and OCaml module interfaces for GTK4 event controllers \
        and widgets.";
    `S Manpage.s_examples;
    `P "Generate event controller bindings:";
    `Pre "  gir_gen /usr/share/gir-1.0/Gtk-4.0.gir ./output";
    `S Manpage.s_bugs;
    `P "Report bugs to https://github.com/chris-armstrong/lablgtk/issues";
  ] in
  let info = Cmd.info "gir_gen" ~version:"5.0.0" ~doc ~man in
  Cmd.v info Term.(ret (const generate_bindings $ filter_arg $ gir_file_arg $ output_dir_arg))

(* Main entry point *)
let () = exit (Cmd.eval gir_gen_cmd)
