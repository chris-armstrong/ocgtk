(* Unit tests for the per-namespace library layout: one package per namespace
   with an enums, a raw (layer 1) and a main (layer 2) library.

   The name-mapping tests resolve types through
   [Type_mappings.find_type_mapping_for_gir_type], the path every generator
   takes, from a raw-library and a main-library context, one test per row of
   the layout plan's name mapping, plus layer 2 references to a cycle
   member from inside and outside its group. Fixtures: Graphene with Point and the
   cycle Box/Sphere (combined module Box_and__sphere), and a Gio reference
   file with Icon and AppInfo, which is in a cycle in Gio. *)

open Gir_gen_lib.Types
module Module_paths = Gir_gen_lib.Module_paths
module Dune_file = Gir_gen_lib.Generate.Dune_file
module Library_module = Gir_gen_lib.Generate.Library_module

let gir_type name = Type_factory.make_gir_type ~name ()

let gio_references =
  let entity ~name ~kind c_type =
    ( name,
      Type_factory.make_cross_reference_entity ~cr_name:name
        ~cr_type:(Type_factory.make_cross_reference_type kind)
        ~cr_c_type:c_type () )
  in
  StringMap.of_list
    [
      entity ~name:"Icon" ~kind:`Interface "GIcon";
      entity ~name:"AppInfo" ~kind:`Interface "GAppInfo";
      entity ~name:"FileType" ~kind:`Enum "GFileType";
    ]

let graphene_ctx target_library =
  Type_factory.make_generation_context
    ~namespace:
      (Type_factory.make_gir_namespace ~namespace_name:"Graphene"
         ~namespace_c_identifier_prefixes:"graphene"
         ~namespace_c_symbol_prefixes:"graphene" ())
    ~repository:
      (Type_factory.make_gir_repository
         ~repository_includes:
           [ Type_factory.make_gir_include ~include_name:"Gio" () ]
         ())
    ~classes:
      [
        Type_factory.make_gir_class ~class_name:"Point" ~c_type:"GraphenePoint"
          ();
        Type_factory.make_gir_class ~class_name:"Box" ~c_type:"GrapheneBox" ();
        Type_factory.make_gir_class ~class_name:"Sphere"
          ~c_type:"GrapheneSphere" ();
      ]
    ~enums:
      [
        Type_factory.make_gir_enum ~enum_name:"EulerOrder"
          ~enum_c_type:"graphene_euler_order_t" ();
      ]
    ~module_groups:
      [
        ("Point", "Point");
        ("Box", "Box_and__sphere");
        ("Sphere", "Box_and__sphere");
      ]
    ~cross_references:
      (Type_factory.make_cross_reference_map
         [ Helpers.make_ncr "Gio" gio_references ])
    ~target_library ()

let raw_ctx = graphene_ctx Raw_library
let main_ctx = graphene_ctx Main_library

let mapping ~ctx name =
  Helpers.assert_some_value
    (Fmt.str "type mapping for %s" name)
    (Gir_gen_lib.Type_mappings.find_type_mapping_for_gir_type ~ctx
       (gir_type name))

let check_ocaml_type ~ctx name expected =
  Alcotest.(check string)
    (Fmt.str "ocaml_type of %s" name)
    expected (mapping ~ctx name).ocaml_type

let check_layer2_module ~ctx name expected =
  Helpers.expect_some
    (Fmt.str "layer 2 class for %s" name)
    (mapping ~ctx name).layer2_class
  @@ fun lc ->
  Alcotest.(check string)
    (Fmt.str "class_module of %s" name)
    expected lc.class_module

(* ---------- name mapping, one test per row ------------------------------ *)

let test_layer2_to_layer2_same_namespace () =
  check_layer2_module ~ctx:main_ctx "Point" "Point";
  check_layer2_module ~ctx:main_ctx "Box" "Box"

(* While Box/Sphere's own modules are generated, its members refer to each other
   through the combined module, which their member modules re-export. *)
let test_layer2_to_layer2_within_cycle () =
  let ctx = { main_ctx with current_cycle_classes = [ "Box"; "Sphere" ] } in
  check_layer2_module ~ctx "Box" "Box_and__sphere";
  check_layer2_module ~ctx "Point" "Point"

let test_layer2_to_layer1_same_namespace () =
  check_ocaml_type ~ctx:main_ctx "Point" "Raw.Point.t";
  check_ocaml_type ~ctx:main_ctx "Box" "Raw.Box.t"

let test_layer1_to_layer1_same_namespace () =
  check_ocaml_type ~ctx:raw_ctx "Point" "Point.t";
  check_ocaml_type ~ctx:raw_ctx "Box" "Box_and__sphere.Box.t"

let test_layer2_to_layer2_other_namespace () =
  check_layer2_module ~ctx:main_ctx "Gio.Icon" "Ocgio.Icon";
  check_layer2_module ~ctx:main_ctx "Gio.AppInfo" "Ocgio.App_info"

let test_layer1_to_layer1_other_namespace () =
  check_ocaml_type ~ctx:raw_ctx "Gio.Icon" "Ocgio_raw.Icon.t";
  check_ocaml_type ~ctx:raw_ctx "Gio.AppInfo" "Ocgio_raw.App_info.t"

let test_layer2_to_layer1_other_namespace () =
  check_ocaml_type ~ctx:main_ctx "Gio.Icon" "Ocgio.Raw.Icon.t";
  check_ocaml_type ~ctx:main_ctx "Gio.AppInfo" "Ocgio.Raw.App_info.t"

let test_layer1_to_enums () =
  check_ocaml_type ~ctx:raw_ctx "EulerOrder" "Ocgraphene_enums.eulerorder";
  check_ocaml_type ~ctx:raw_ctx "Gio.FileType" "Ocgio_enums.filetype"

let test_layer2_to_enums_same_namespace () =
  check_ocaml_type ~ctx:main_ctx "EulerOrder" "Enums.eulerorder"

let test_layer2_to_enums_other_namespace () =
  check_ocaml_type ~ctx:main_ctx "Gio.FileType" "Ocgio.Enums.filetype"

let test_constants () =
  Alcotest.(check string)
    "same namespace" "Constants"
    (Module_paths.namespace_constants_module ~ctx:main_ctx "Graphene");
  Alcotest.(check string)
    "other namespace" "Ocgio.Constants"
    (Module_paths.namespace_constants_module ~ctx:main_ctx "Gio")

(* ---------- names and output paths -------------------------------------- *)

let test_package_and_library_names () =
  let check = Alcotest.(check string) in
  check "package" "ocgdkpixbuf" (Module_paths.package_name "GdkPixbuf");
  check "main module" "Ocgdkpixbuf" (Module_paths.main_module "GdkPixbuf");
  check "raw module" "Ocgio_raw" (Module_paths.raw_module "Gio");
  check "enums module" "Ocgio_enums" (Module_paths.enums_module "Gio");
  check "enums file" "ocgio_enums" (Module_paths.enums_file_stem "Gio");
  check "raw library" "ocgio.raw" (Module_paths.raw_library_public_name "Gio");
  check "enums library" "ocgio.enums"
    (Module_paths.enums_library_public_name "Gio");
  check "stubs library" "ocgio_raw_stubs"
    (Module_paths.stubs_library_name "Gio");
  check "stubs batch" "ocgio.raw.stubs_batch_2"
    (Module_paths.stubs_batch_library_public_name "Gio" 2)

let test_output_directories () =
  let check = Alcotest.(check string) in
  check "layer 1 and C" "raw/generated" Module_paths.raw_generated_dir;
  check "hand-written core" "raw/core" Module_paths.raw_core_dir;
  check "enums" "enums/generated" Module_paths.enums_generated_dir;
  check "layer 2" "generated" Module_paths.main_generated_dir;
  check "hand-written layer 2" "core" Module_paths.main_core_dir

let test_layer2_module_has_no_g_prefix () =
  Alcotest.(check string)
    "module" "App_info"
    (Module_paths.layer2_module_name "AppInfo");
  Alcotest.(check string)
    "file" "app_info"
    (Module_paths.layer2_module_filename "AppInfo")

(* ---------- raw.ml and enums.ml ----------------------------------------- *)

let test_raw_module_aliases () =
  let ast =
    Ml_ast_helpers.parse_implementation
      (Library_module.generate_raw_module ~ctx:raw_ctx
         ~entity_names:[ "Sphere"; "Point"; "Box" ]
         ~core_modules:[ "Graphene_extra_core" ])
  in
  Alcotest.(check (list (pair string string)))
    "one alias per class (cycle members by their shim), sorted, then core"
    [
      ("Box", "Ocgraphene_raw.Box");
      ("Point", "Ocgraphene_raw.Point");
      ("Sphere", "Ocgraphene_raw.Sphere");
      ("Graphene_extra_core", "Ocgraphene_raw.Graphene_extra_core");
    ]
    (Ml_ast_helpers.module_aliases ast)

(* A member of a cycle gets its own layer 1 module: the implementation
   includes the member of the combined module, and the interface keeps its
   types equal to it. *)
let test_cycle_member_shim () =
  let shim output_mode =
    Gir_gen_lib.Generate.Ml_interface.generate_cycle_member_shim ~output_mode
      ~refs:(Gir_gen_lib.Generate.Doc_resolve.no_links ~namespace:"Graphene")
      ~member_doc:None ~combined_module_name:"Box_and__sphere"
      ~member_name:"Box"
  in
  Alcotest.(check (list string))
    "implementation" [ "Box_and__sphere.Box" ]
    (Ml_ast_helpers.included_modules
       (Ml_ast_helpers.parse_implementation
          (shim Gir_gen_lib.Generate.Ml_interface.Implementation)));
  Alcotest.(check (list string))
    "interface" [ "Box_and__sphere.Box" ]
    (Ml_ast_helpers.strengthened_includes
       (Ml_ast_helpers.parse_interface
          (shim Gir_gen_lib.Generate.Ml_interface.Interface)))

let test_enums_module_includes_enums_library () =
  let ast =
    Ml_ast_helpers.parse_implementation
      (Library_module.generate_enums_module ~namespace:"Graphene")
  in
  Alcotest.(check (list string))
    "include" [ "Ocgraphene_enums" ]
    (Ml_ast_helpers.included_modules ast)

let test_modules_page () =
  let entities =
    [
      entity_of_class
        (Type_factory.make_gir_class ~class_name:"Sphere" ~c_type:"Sphere" ());
      entity_of_record
        (Type_factory.make_gir_record ~record_name:"Point" ~c_type:"Point" ());
      entity_of_class
        (Type_factory.make_gir_class ~class_name:"Box" ~c_type:"Box" ());
    ]
  in
  let text =
    Library_module.generate_modules_page ~namespace:"Graphene" ~entities
      ~has_constants:true
  in
  Alcotest.(check string)
    "classes, then records, sorted; no interfaces section"
    "{0 Graphene classes and records}\n\n\
     {!Ocgraphene} has one module for each Graphene class and record, with the \
     externals they are built on in {!Ocgraphene.Raw}, the enumerations and \
     bitfields in {!Ocgraphene.Enums} and the constants in \
     {!Ocgraphene.Constants}. See {%html:<a \
     href=\"../ocgtk/conventions.html\">the conventions page</a>%} for how the \
     bindings are organised: the two layers, the anatomy of a class module, \
     and how names, types, signals and properties are mapped.\n\n\
     {1 Classes}\n\n\
     {!modules:\n\
    \  Ocgraphene.Box\n\
    \  Ocgraphene.Sphere\n\
     }\n\n\
     {1 Records}\n\n\
     {!modules:\n\
    \  Ocgraphene.Point\n\
     }\n"
    text

let modules_page_intro ~namespace ~has_constants =
  let entities =
    [
      entity_of_class
        (Type_factory.make_gir_class ~class_name:"Box" ~c_type:"Box" ());
    ]
  in
  Library_module.generate_modules_page ~namespace ~entities ~has_constants
  |> String.split_on_char '\n'
  |> function
  | _title :: _blank :: intro :: _ -> intro
  | _ -> Alcotest.fail "modules page has no intro"

let test_modules_page_no_constants () =
  let intro = modules_page_intro ~namespace:"Gsk" ~has_constants:false in
  Alcotest.(check bool)
    "names Raw and Enums" true
    (Helpers.string_contains intro
       "the externals they are built on in {!Ocgsk.Raw} and the enumerations \
        and bitfields in {!Ocgsk.Enums}.");
  Alcotest.(check bool)
    "no Constants" false
    (Helpers.string_contains intro "Constants")

let test_modules_page_conventions_link () =
  let gtk = modules_page_intro ~namespace:"Gtk" ~has_constants:true in
  Alcotest.(check bool)
    "same package: page reference" true
    (Helpers.string_contains gtk "See {{!page-conventions}the conventions page}");
  Alcotest.(check bool)
    "same package: no raw HTML" false
    (Helpers.string_contains gtk "{%html:")

(* ---------- dune stanzas ------------------------------------------------ *)

let lines s = String.split_on_char '\n' s

let check_has_line msg line text =
  Alcotest.(check bool) msg true (List.mem line (lines text))

let test_enums_dune () =
  let text = Dune_file.generate_enums_dune ~namespace:"Graphene" in
  check_has_line "name" " (name ocgraphene_enums)" text;
  check_has_line "public name" " (public_name ocgraphene.enums)" text;
  Alcotest.(check bool)
    "no libraries" false
    (Helpers.string_contains text "(libraries")

let main_dune ~core_modules =
  Dune_file.generate_main_dune ~ctx:main_ctx ~namespace:"Graphene"
    ~repository:main_ctx.repository ~core_modules

let core_copy_files = "(copy_files# ../core/*.{ml,mli})"

let test_main_dune () =
  let text = main_dune ~core_modules:[] in
  check_has_line "name" " (name ocgraphene)" text;
  check_has_line "opens Ocglib"
    " (flags :standard -w -3-6-9-27-32-33-34-50-7 -open Ocglib)" text;
  check_has_line "own raw and enums, other namespaces' main libraries"
    " (libraries ocglib ocgraphene.raw ocgraphene.enums ocgio))" text;
  Alcotest.(check bool)
    "no core, no copy_files" false
    (Helpers.string_contains text "copy_files")

let test_main_dune_documents_modules_page () =
  let text = main_dune ~core_modules:[] in
  check_has_line "documentation for the package" " (package ocgraphene)" text;
  check_has_line "the modules page" " (mld_files modules))" text

let test_main_dune_copies_core () =
  check_has_line "hand-written modules from core/" core_copy_files
    (main_dune ~core_modules:[ "Main" ])

let raw_dune_inc ~stub_names =
  Dune_file.generate_raw_dune_inc ~ctx:raw_ctx ~namespace:"Graphene" ~stub_names
    ~repository:raw_ctx.repository

let test_raw_dune_inc_stubs_library () =
  let text = raw_dune_inc ~stub_names:[ "ml_point_gen" ] in
  check_has_line "name" " (name ocgraphene_raw_stubs)" text;
  check_has_line "public name" " (public_name ocgraphene.raw.stubs)" text;
  check_has_line "other namespaces' raw libraries for their headers"
    " (libraries ocgio.raw ocglib)  ; Dependencies and ocglib for header files"
    text

let test_raw_dune_inc_copies_headers () =
  let text = raw_dune_inc ~stub_names:[ "ml_point_gen" ] in
  check_has_line "decls header"
    " (copy generated/graphene_decls.h graphene_decls.h))" text;
  check_has_line "core header" " (copy core/graphene_core.h graphene_core.h))"
    text

let test_raw_dune_inc_batches () =
  let stub_names =
    List.init (Dune_file.stub_batch_size + 1) (Fmt.str "ml_s%03d_gen")
  in
  let text = raw_dune_inc ~stub_names in
  check_has_line "batch library" " (name ocgraphene_raw_stubs_batch_1)" text;
  check_has_line "facade over the batches"
    " (libraries ocgraphene_raw_stubs_batch_0 ocgraphene_raw_stubs_batch_1))"
    text

let tests =
  [
    ( "layer 2 to layer 2, same namespace",
      `Quick,
      test_layer2_to_layer2_same_namespace );
    ( "layer 2 to layer 2, within a cycle, via the combined module",
      `Quick,
      test_layer2_to_layer2_within_cycle );
    ( "layer 2 to layer 1, same namespace, via Raw",
      `Quick,
      test_layer2_to_layer1_same_namespace );
    ( "layer 1 to layer 1, same namespace, unchanged",
      `Quick,
      test_layer1_to_layer1_same_namespace );
    ( "layer 2 to another namespace's layer 2",
      `Quick,
      test_layer2_to_layer2_other_namespace );
    ( "layer 1 to another namespace's raw library, cycle member by its shim",
      `Quick,
      test_layer1_to_layer1_other_namespace );
    ( "layer 2 to another namespace's layer 1, via its Raw",
      `Quick,
      test_layer2_to_layer1_other_namespace );
    ("layer 1 to the enums libraries", `Quick, test_layer1_to_enums);
    ( "layer 2 to its own enums via Enums",
      `Quick,
      test_layer2_to_enums_same_namespace );
    ( "layer 2 to another namespace's enums via its Enums",
      `Quick,
      test_layer2_to_enums_other_namespace );
    ("constants modules", `Quick, test_constants);
    ("package and library names", `Quick, test_package_and_library_names);
    ("output directories", `Quick, test_output_directories);
    ( "layer 2 module has no G prefix",
      `Quick,
      test_layer2_module_has_no_g_prefix );
    ("raw.ml: one alias per class, then core", `Quick, test_raw_module_aliases);
    ("cycle member shim module", `Quick, test_cycle_member_shim);
    ( "enums.ml includes the enums library",
      `Quick,
      test_enums_module_includes_enums_library );
    ("enums library stanza", `Quick, test_enums_dune);
    ("main library stanza", `Quick, test_main_dune);
    ("main library copies in core/", `Quick, test_main_dune_copies_core);
    ( "main library documents the modules page",
      `Quick,
      test_main_dune_documents_modules_page );
    ("modules page lists modules by kind", `Quick, test_modules_page);
    ("modules page without constants", `Quick, test_modules_page_no_constants);
    ( "modules page links conventions in ocgtk",
      `Quick,
      test_modules_page_conventions_link );
    ("raw stubs library stanza", `Quick, test_raw_dune_inc_stubs_library);
    ( "dune.inc copies the headers for install",
      `Quick,
      test_raw_dune_inc_copies_headers );
    ("stubs split into batches", `Quick, test_raw_dune_inc_batches);
  ]
