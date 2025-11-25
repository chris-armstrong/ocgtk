(* Main Entry Point for GIR Code Generator *)

[@@@warning "-27"]

open Printf
open StdLabels
open Cmdliner

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
  let (controllers, interfaces, gtk_enums, gtk_bitfields) = Gir_gen_lib.Parse.Gir_parser.parse_gir_file gir_file filter_classes in

  printf "Found %d classes\n" (List.length controllers);
  printf "Found %d interfaces\n" (List.length interfaces);
  printf "Found %d Gtk enumerations\n" (List.length gtk_enums);
  printf "Found %d Gtk bitfields\n" (List.length gtk_bitfields);

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

  (* Prepare external namespace enum/bitfield list with namespace prefixes *)
  let external_enums_with_ns = external_enums_bitfields |> List.concat_map ~f:(fun (ns, ns_enums, _) ->
    List.map ~f:(fun enum -> (ns, enum)) ns_enums
  ) in
  let external_bitfields_with_ns = external_enums_bitfields |> List.concat_map ~f:(fun (ns, _, ns_bitfields) ->
    List.map ~f:(fun bitfield -> (ns, bitfield)) ns_bitfields
  ) in

  (* Generate stage: produce output files *)

  (* Generate common header file *)
  let header_file = Filename.concat output_dir "generated_forward_decls.h" in
  printf "\nWriting %s...\n" header_file;
  let header_content = Gir_gen_lib.Generate.C_stubs.generate_forward_decls_header
    ~classes:controllers
    ~external_enums:external_enums_with_ns
    ~external_bitfields:external_bitfields_with_ns in
  let oc = open_out header_file in
  output_string oc header_content;
  close_out oc;

  (* Generate GTK enum and bitfield converters *)
  if List.length gtk_enums > 0 || List.length gtk_bitfields > 0 then begin
    let c_file = Filename.concat output_dir "ml_gtk_enums_gen.c" in
    printf "\nWriting %s...\n" c_file;
    let oc = open_out c_file in
    output_string oc (Gir_gen_lib.Generate.C_stubs.generate_c_file_header ~class_name:"GTK enums and bitfields" ~external_enums:[] ~external_bitfields:[] ());
    List.iter ~f:(fun enum ->
      output_string oc (Gir_gen_lib.Generate.Enum_code.generate_c_enum_converters ~namespace:"Gtk" enum);
    ) gtk_enums;
    List.iter ~f:(fun bitfield ->
      output_string oc (Gir_gen_lib.Generate.Enum_code.generate_c_bitfield_converters ~namespace:"Gtk" bitfield);
    ) gtk_bitfields;
    close_out oc;
    generated_stubs := "ml_gtk_enums_gen" :: !generated_stubs;
    generated_modules := "Gtk_enums" :: !generated_modules;
  end;

  (* Generate C files for each class *)
  List.iter ~f:(fun cls ->
    if Gir_gen_lib.Blacklists.should_skip_class cls.Gir_gen_lib.Types.class_name then begin
      printf "  - %s (SKIPPED - incomplete support)\n" cls.Gir_gen_lib.Types.class_name
    end else begin
      printf "  - %s (%d methods, %d properties)\n"
        cls.Gir_gen_lib.Types.class_name (List.length cls.Gir_gen_lib.Types.methods) (List.length cls.Gir_gen_lib.Types.properties);

      let stub_name = sprintf "ml_%s_gen" (Gir_gen_lib.Utils.to_snake_case cls.Gir_gen_lib.Types.class_name) in
      let c_file = Filename.concat output_dir (stub_name ^ ".c") in
      printf "Writing %s...\n" c_file;

      let c_code = Gir_gen_lib.Generate.C_stubs.generate_class_c_code
        ~classes:controllers
        ~enums ~bitfields
        ~external_enums:external_enums_with_ns
        ~external_bitfields:external_bitfields_with_ns
        ~c_type:cls.Gir_gen_lib.Types.c_type
        cls.Gir_gen_lib.Types.class_name cls.Gir_gen_lib.Types.constructors cls.Gir_gen_lib.Types.methods cls.Gir_gen_lib.Types.properties in

      let oc = open_out c_file in
      output_string oc c_code;
      close_out oc;
      generated_stubs := stub_name :: !generated_stubs;
      generated_modules := (Gir_gen_lib.Utils.module_name_of_class cls.Gir_gen_lib.Types.class_name) :: !generated_modules;
    end
  ) controllers;

  (* Generate C files for each interface *)
  List.iter ~f:(fun intf ->
    if Gir_gen_lib.Blacklists.should_skip_class intf.Gir_gen_lib.Types.interface_name then begin
      printf "  - %s (SKIPPED - incomplete support)\n" intf.Gir_gen_lib.Types.interface_name
    end else begin
      printf "  - %s (%d methods, %d properties)\n"
        intf.Gir_gen_lib.Types.interface_name (List.length intf.Gir_gen_lib.Types.methods) (List.length intf.Gir_gen_lib.Types.properties);

      let stub_name = sprintf "ml_%s_gen" (Gir_gen_lib.Utils.to_snake_case intf.Gir_gen_lib.Types.interface_name) in
      let c_file = Filename.concat output_dir (stub_name ^ ".c") in
      printf "Writing %s...\n" c_file;

      let c_code = Gir_gen_lib.Generate.C_stubs.generate_class_c_code
        ~classes:controllers
        ~enums ~bitfields
        ~external_enums:external_enums_with_ns
        ~external_bitfields:external_bitfields_with_ns
        ~c_type:intf.Gir_gen_lib.Types.c_type
        intf.Gir_gen_lib.Types.interface_name [] intf.Gir_gen_lib.Types.methods intf.Gir_gen_lib.Types.properties in

      let oc = open_out c_file in
      output_string oc c_code;
      close_out oc;
      generated_stubs := stub_name :: !generated_stubs;
      generated_modules := (Gir_gen_lib.Utils.module_name_of_class intf.Gir_gen_lib.Types.interface_name) :: !generated_modules;
    end
  ) interfaces;

  (* Generate OCaml interface files for classes *)
  List.iter ~f:(fun cls ->
    if not (Gir_gen_lib.Blacklists.should_skip_class cls.Gir_gen_lib.Types.class_name) then begin
      let parent_chain = parent_chain_for_class cls.Gir_gen_lib.Types.class_name in
      let ml_file = Filename.concat output_dir
        (sprintf "%s.mli" (Gir_gen_lib.Utils.to_snake_case cls.Gir_gen_lib.Types.class_name)) in
      printf "Writing %s...\n" ml_file;
      let oc = open_out ml_file in
      output_string oc (Gir_gen_lib.Generate.Ml_interface.generate_ml_interface
        ~output_mode:Gir_gen_lib.Generate.Ml_interface.Interface
        ~class_name:cls.Gir_gen_lib.Types.class_name
        ~class_doc:cls.Gir_gen_lib.Types.class_doc
        ~enums ~bitfields
        ~classes:controllers
        ~parent_chain
        ~constructors:(Some cls.Gir_gen_lib.Types.constructors)
        ~methods:cls.Gir_gen_lib.Types.methods
        ~properties:cls.Gir_gen_lib.Types.properties
        ~signals:cls.Gir_gen_lib.Types.signals);
      close_out oc;

      let ml_impl_file = Filename.concat output_dir
        (sprintf "%s.ml" (Gir_gen_lib.Utils.to_snake_case cls.Gir_gen_lib.Types.class_name)) in
      printf "Writing %s...\n" ml_impl_file;
      let oc_impl = open_out ml_impl_file in
      output_string oc_impl (Gir_gen_lib.Generate.Ml_interface.generate_ml_interface
        ~output_mode:Gir_gen_lib.Generate.Ml_interface.Implementation
        ~class_name:cls.Gir_gen_lib.Types.class_name
        ~class_doc:cls.Gir_gen_lib.Types.class_doc
        ~enums ~bitfields
        ~classes:controllers
        ~parent_chain
        ~constructors:(Some cls.Gir_gen_lib.Types.constructors)
        ~methods:cls.Gir_gen_lib.Types.methods
        ~properties:cls.Gir_gen_lib.Types.properties
        ~signals:cls.Gir_gen_lib.Types.signals);
      close_out oc_impl;
    end
  ) controllers;

  (* Generate OCaml interface files for interfaces *)
  List.iter ~f:(fun cls ->
    if not (Gir_gen_lib.Blacklists.should_skip_class cls.Gir_gen_lib.Types.interface_name) then begin
      let parent_chain = parent_chain_for_class cls.Gir_gen_lib.Types.interface_name in
      let ml_file = Filename.concat output_dir
        (sprintf "%s.mli" (Gir_gen_lib.Utils.to_snake_case cls.Gir_gen_lib.Types.interface_name)) in
      printf "Writing %s...\n" ml_file;
      let oc = open_out ml_file in
      output_string oc (Gir_gen_lib.Generate.Ml_interface.generate_ml_interface
        ~output_mode:Gir_gen_lib.Generate.Ml_interface.Interface
        ~class_name:cls.Gir_gen_lib.Types.interface_name
        ~class_doc:cls.Gir_gen_lib.Types.interface_doc
        ~enums ~bitfields
        ~classes:controllers
        ~parent_chain
        ~constructors:None
        ~methods:cls.Gir_gen_lib.Types.methods
        ~properties:cls.Gir_gen_lib.Types.properties
        ~signals:cls.Gir_gen_lib.Types.signals);
      close_out oc;

      let ml_impl_file = Filename.concat output_dir
        (sprintf "%s.ml" (Gir_gen_lib.Utils.to_snake_case cls.Gir_gen_lib.Types.interface_name)) in
      printf "Writing %s...\n" ml_impl_file;
      let oc_impl = open_out ml_impl_file in
      output_string oc_impl (Gir_gen_lib.Generate.Ml_interface.generate_ml_interface
        ~output_mode:Gir_gen_lib.Generate.Ml_interface.Implementation
        ~class_name:cls.Gir_gen_lib.Types.interface_name
        ~class_doc:cls.Gir_gen_lib.Types.interface_doc
        ~enums ~bitfields
        ~classes:controllers
        ~parent_chain
        ~constructors:None
        ~methods:cls.Gir_gen_lib.Types.methods
        ~properties:cls.Gir_gen_lib.Types.properties
        ~signals:cls.Gir_gen_lib.Types.signals);
      close_out oc_impl;
    end
  ) interfaces;

  (* Generate GTK enum and bitfield types file *)
  if List.length gtk_enums > 0 || List.length gtk_bitfields > 0 then begin
    let enum_file = Filename.concat output_dir "gtk_enums.mli" in
    printf "Writing %s...\n" enum_file;
    let oc = open_out enum_file in
    output_string oc "(* GENERATED CODE - DO NOT EDIT *)\n";
    output_string oc "(* GTK4 Enumeration and Bitfield Types *)\n\n";
    List.iter ~f:(fun enum ->
      output_string oc (Gir_gen_lib.Generate.Enum_code.generate_ocaml_enum enum);
    ) gtk_enums;
    List.iter ~f:(fun bitfield ->
      output_string oc (Gir_gen_lib.Generate.Enum_code.generate_ocaml_bitfield bitfield);
    ) gtk_bitfields;
    close_out oc;
  end;

  (* Generate enum files for external namespaces *)
  List.iter ~f:(fun (ns_name, ns_enums, ns_bitfields) ->
    let ns_lower = String.lowercase_ascii ns_name in
    let ns_module = String.capitalize_ascii (ns_lower ^ "_enums") in

    (* Generate OCaml enum file *)
    if List.length ns_enums > 0 || List.length ns_bitfields > 0 then begin
      let enum_file = Filename.concat output_dir (sprintf "%s_enums.mli" ns_lower) in
      printf "Writing %s...\n" enum_file;
      let oc = open_out enum_file in
      output_string oc "(* GENERATED CODE - DO NOT EDIT *)\n";
      output_string oc (sprintf "(* %s Enumeration and Bitfield Types *)\n\n" ns_name);
      List.iter ~f:(fun enum ->
        output_string oc (Gir_gen_lib.Generate.Enum_code.generate_ocaml_enum enum);
      ) ns_enums;
      List.iter ~f:(fun bitfield ->
        output_string oc (Gir_gen_lib.Generate.Enum_code.generate_ocaml_bitfield bitfield);
      ) ns_bitfields;
      close_out oc;
      generated_modules := ns_module :: !generated_modules;
    end;

    (* Generate C converter file *)
    if List.length ns_enums > 0 || List.length ns_bitfields > 0 then begin
      let stub_name = sprintf "ml_%s_enums_gen" ns_lower in
      let c_file = Filename.concat output_dir (stub_name ^ ".c") in
      printf "Writing %s...\n" c_file;
      let oc = open_out c_file in
      output_string oc (sprintf "/* GENERATED CODE - DO NOT EDIT */\n");
      output_string oc (sprintf "/* %s enum/bitfield converters */\n\n" ns_name);
      output_string oc "#include <caml/mlvalues.h>\n";
      output_string oc "#include <caml/memory.h>\n";
      output_string oc "#include <caml/alloc.h>\n";
      output_string oc "#include <caml/fail.h>\n";
      output_string oc "#include <caml/hash.h>\n";
      if ns_lower = "gdk" then
        output_string oc "#include <gdk/gdk.h>\n\n"
      else if ns_lower = "pango" then
        output_string oc "#include <pango/pango.h>\n\n"
      else
        output_string oc (sprintf "#include <%s/%s.h>\n\n" ns_lower ns_lower);

      List.iter ~f:(fun enum ->
        output_string oc (Gir_gen_lib.Generate.Enum_code.generate_c_enum_converters ~namespace:ns_name enum);
      ) ns_enums;
      List.iter ~f:(fun bitfield ->
        output_string oc (Gir_gen_lib.Generate.Enum_code.generate_c_bitfield_converters ~namespace:ns_name bitfield);
      ) ns_bitfields;
      close_out oc;
      generated_stubs := stub_name :: !generated_stubs;
    end;
  ) external_enums_bitfields;

  (* Generate dune file *)
  let dune_file = Filename.concat output_dir "dune-generated.inc" in
  printf "\nWriting %s...\n" dune_file;
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
  let oc = open_out dune_file in
  output_string oc dune_content;
  close_out oc;

  printf "\n✓ Code generation complete!\n";
  printf "  Generated: %d C files (one per class/interface)\n" ((List.length controllers) + (List.length interfaces));
  printf "  Generated: %d OCaml interface files\n" ((List.length controllers) + (List.length interfaces));
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
