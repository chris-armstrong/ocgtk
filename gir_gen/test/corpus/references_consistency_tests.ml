(* The member tables in each corpus references file, read back as the index
   reads them, against the tables generating the namespace computes: the
   namespace loaded through [Namespace_loader] with the same overrides and
   dependency references. A difference means the references step and
   [generate] disagree about what the namespace emits, and a cross-namespace
   doc link could point at a member that does not exist. *)

open Gir_gen_lib
open Types

(* Each namespace's GIR file and dependencies, as in the DEPS table of
   [scripts/generate-bindings.sh] and the rules in [corpus/dune] *)
let namespaces =
  [
    ("cairo", "cairo-1.0", []);
    ("gio", "Gio-2.0", []);
    ("graphene", "Graphene-1.0", []);
    ("gdkpixbuf", "GdkPixbuf-2.0", [ "gio" ]);
    ("pango", "Pango-1.0", [ "cairo"; "gio" ]);
    ("pangocairo", "PangoCairo-1.0", [ "cairo"; "pango"; "gio" ]);
    ("gdk", "Gdk-4.0", [ "cairo"; "pango"; "pangocairo"; "gdkpixbuf"; "gio" ]);
    ( "gsk",
      "Gsk-4.0",
      [ "cairo"; "gio"; "gdk"; "pangocairo"; "pango"; "gdkpixbuf"; "graphene" ]
    );
    ( "gtk",
      "Gtk-4.0",
      [
        "cairo";
        "gio";
        "gdk";
        "graphene";
        "gdkpixbuf";
        "pango";
        "pangocairo";
        "gsk";
      ] );
  ]

let corpus_dir () =
  Filename.concat (Filename.dirname Sys.executable_name) "corpus"

let references_file ns =
  Filename.concat (corpus_dir ()) (ns ^ "-references.sexp")

let overrides_dir () =
  match Sys.getenv_opt "OVERRIDES_DIR" with
  | Some dir -> dir
  | None -> Alcotest.fail "OVERRIDES_DIR environment variable is not set"

let expect_ok ~what = function
  | Ok v -> v
  | Error e -> Alcotest.failf "%s: %s" what (Namespace_loader.format_error e)

(* One line per table entry, so a difference reads as the entries that
   differ *)
let table_lines (ns : doc_index_namespace) =
  let layer type_name layer_name (n : doc_member_names) =
    List.concat_map
      (fun (kind, table) ->
        StringMap.bindings table
        |> List.map (fun (gir_name, ocaml_name) ->
            Fmt.str "%s %s %s %s -> %s" type_name layer_name kind gir_name
              ocaml_name))
      [
        ("method", n.dm_methods);
        ("constructor", n.dm_constructors);
        ("signal", n.dm_signals);
        ("property", n.dm_properties);
      ]
  in
  let members =
    StringMap.bindings ns.di_members
    |> List.concat_map (fun (type_name, { dm_l1; dm_l2 }) ->
        layer type_name "L1" dm_l1 @ layer type_name "L2" dm_l2)
  in
  let enum_members =
    StringMap.bindings ns.di_enum_members
    |> List.concat_map (fun (type_name, variants) ->
        StringMap.bindings variants
        |> List.map (fun (key, tag) -> Fmt.str "%s %s -> `%s" type_name key tag))
  in
  let kind_name = function
    | Dc_method -> "method"
    | Dc_constructor -> "constructor"
    | Dc_enum_member -> "enum member"
  in
  let c_symbols =
    StringMap.bindings ns.di_c_symbols
    |> List.map (fun (c_identifier, { dc_kind; dc_type; dc_member }) ->
        Fmt.str "%s -> %s %s.%s" c_identifier (kind_name dc_kind) dc_type
          dc_member)
  in
  members @ enum_members @ c_symbols

let test_namespace (ns, gir, deps) () =
  let gir_file = Filename.concat (Helpers.gir_data_dir ()) (gir ^ ".gir") in
  let loaded =
    Namespace_loader.load
      ~overrides_file:(Filename.concat (overrides_dir ()) (ns ^ ".sexp"))
      ~reference_files:(List.map references_file deps)
      gir_file
    |> expect_ok ~what:("loading " ^ gir_file)
  in
  let namespace = loaded.ctx.namespace.namespace_name in
  let computed =
    Helpers.expect_some
      (Fmt.str "no index entry for %s" namespace)
      (StringMap.find_opt namespace loaded.ctx.doc_index)
      Fun.id
  in
  let written =
    Namespace_loader.load_reference_files [ references_file ns ]
    |> expect_ok ~what:("reading the references file of " ^ ns)
    |> StringMap.find_opt namespace
    |> Option.map Generate.Doc_index.of_cross_references
    |> fun found ->
    Helpers.expect_some
      (Fmt.str "the references file of %s is not for %s" ns namespace)
      found Fun.id
  in
  Alcotest.(check (list string))
    (Fmt.str "%s member tables" namespace)
    (table_lines computed) (table_lines written)

let test_tables_listed () =
  let written =
    Namespace_loader.load_reference_files [ references_file "gdk" ]
    |> expect_ok ~what:"reading the Gdk references file"
    |> StringMap.find_opt "Gdk"
    |> Option.map Generate.Doc_index.of_cross_references
    |> fun found -> Helpers.expect_some "no Gdk entry" found Fun.id
  in
  let surface =
    Helpers.expect_some "Gdk.Surface has no member tables"
      (StringMap.find_opt "Surface" written.di_members)
      Fun.id
  in
  Alcotest.(check (option string))
    "Gdk.Surface.beep at layer 2" (Some "beep")
    (StringMap.find_opt "beep" surface.dm_l2.dm_methods);
  Alcotest.(check bool)
    "gdk_surface_beep is a method of Surface" true
    (match StringMap.find_opt "gdk_surface_beep" written.di_c_symbols with
    | Some { dc_kind = Dc_method; dc_type = "Surface"; dc_member = "beep" } ->
        true
    | Some _ | None -> false)

let tests =
  Alcotest.test_case
    "the Gdk references file lists Surface's members and C identifiers" `Quick
    test_tables_listed
  :: List.map
       (fun ((ns, _, _) as namespace) ->
         Alcotest.test_case
           (Fmt.str
              "%s references file lists the member tables generation computes"
              ns)
           `Slow (test_namespace namespace))
       namespaces
