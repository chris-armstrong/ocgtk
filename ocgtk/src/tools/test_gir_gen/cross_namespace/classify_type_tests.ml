(* Phase 6 tests: classify_type unit tests and cross-namespace array element
   type resolution.

   classify_type: same-namespace (enum, bitfield, class, interface, record,
   primitive) and cross-namespace (enum, bitfield, class, interface, record).

   Array element resolution: find_type_mapping_for_gir_type recursively
   resolves array element types through cross-namespace lookup. *)

open Gir_gen_lib.Types

let make_gir_type name =
  { name; c_type = None; nullable = false;
    transfer_ownership = TransferNone; array = None }

let make_gir_type_with_array name element_type =
  let array_info =
    { length = None; zero_terminated = true; fixed_size = None;
      element_type; array_name = None }
  in
  { name; c_type = None; nullable = false;
    transfer_ownership = TransferNone; array = Some array_info }

(* Build a test context with one of each type kind in the "Gtk" namespace *)
let base_ctx () =
  let namespace =
    { namespace_name = "Gtk"; namespace_version = "4.0";
      namespace_shared_library = "libgtk-4.so.1";
      namespace_c_identifier_prefixes = "Gtk";
      namespace_c_symbol_prefixes = "gtk" }
  in
  let repository =
    { repository_c_includes = []; repository_includes = [];
      repository_packages = [] }
  in
  let widget_class =
    { class_name = "Widget"; c_type = "GtkWidget"; parent = None;
      implements = []; introspectable = true; constructors = [];
      methods = []; properties = []; signals = []; class_doc = None; version = None }
  in
  let scrollable_iface =
    { interface_name = "Scrollable"; c_type = "GtkScrollable";
      c_symbol_prefix = "scrollable"; glib_type_name = None;
      glib_get_type = None; prerequisites = []; introspectable = true;
      methods = []; properties = [];
      signals = []; interface_doc = None; version = None }
  in
  let text_direction_enum =
    { enum_name = "TextDirection"; enum_c_type = "GtkTextDirection";
      members = []; enum_doc = None; functions = []; enum_version = None }
  in
  let state_flags_bitfield =
    { bitfield_name = "StateFlags"; bitfield_c_type = "GtkStateFlags";
      flags = []; bitfield_doc = None; bitfield_version = None }
  in
  let text_iter_record =
    { record_name = "TextIter"; c_type = "GtkTextIter";
      glib_type_name = None; glib_get_type = None; introspectable = true;
      opaque = false; disguised = false; c_symbol_prefix = None;
      is_gtype_struct_for = None; fields = []; constructors = [];
      methods = []; functions = []; record_doc = None; version = None }
  in
  { namespace; repository;
    classes = [ widget_class ];
    interfaces = [ scrollable_iface ];
    enums = [ text_direction_enum ];
    bitfields = [ state_flags_bitfield ];
    records = [ text_iter_record ];
    module_groups = Hashtbl.create 0;
    current_cycle_classes = [];
    cross_references = StringMap.empty }

let add_cross_refs ctx =
  let gdk_entities =
    StringMap.empty
    |> StringMap.add "ModifierType"
         { cr_name = "ModifierType"; cr_type = Crt_Bitfield;
           cr_c_type = "GdkModifierType" }
    |> StringMap.add "Texture"
         { cr_name = "Texture";
           cr_type = Crt_Class { parent = Some "Paintable" };
           cr_c_type = "GdkTexture*" }
    |> StringMap.add "ContentFormats"
         { cr_name = "ContentFormats";
           cr_type = Crt_Record { opaque = true };
           cr_c_type = "GdkContentFormats*" }
    |> StringMap.add "Paintable"
         { cr_name = "Paintable"; cr_type = Crt_Interface;
           cr_c_type = "GdkPaintable*" }
  in
  let cairo_entities =
    StringMap.empty
    |> StringMap.add "FontType"
         { cr_name = "FontType"; cr_type = Crt_Enum;
           cr_c_type = "cairo_font_type_t" }
    |> StringMap.add "Surface"
         { cr_name = "Surface";
           cr_type = Crt_Record { opaque = true };
           cr_c_type = "cairo_surface_t*" }
  in
  let cross_refs =
    StringMap.empty
    |> StringMap.add "Gdk"
         (snd (Helpers.make_ncr "Gdk" gdk_entities))
    |> StringMap.add "cairo"
         (snd (Helpers.make_ncr "cairo" cairo_entities))
  in
  { ctx with cross_references = cross_refs }

let type_kind_testable =
  let open Gir_gen_lib.Type_mappings in
  Alcotest.testable
    (fun ppf tk ->
       Format.pp_print_string ppf
         (match tk with
          | Tk_Enum -> "Tk_Enum" | Tk_Bitfield -> "Tk_Bitfield"
          | Tk_Class -> "Tk_Class" | Tk_Interface -> "Tk_Interface"
          | Tk_Record -> "Tk_Record" | Tk_Primitive -> "Tk_Primitive"
          | Tk_Unknown -> "Tk_Unknown"))
    (fun a b ->
       match (a, b) with
       | Tk_Enum, Tk_Enum | Tk_Bitfield, Tk_Bitfield
       | Tk_Class, Tk_Class | Tk_Interface, Tk_Interface
       | Tk_Record, Tk_Record | Tk_Primitive, Tk_Primitive
       | Tk_Unknown, Tk_Unknown -> true
       | _ -> false)

let check_kind ctx name expected =
  let open Gir_gen_lib.Type_mappings in
  let gir_type = make_gir_type name in
  Alcotest.check type_kind_testable name expected
    (classify_type ~ctx gir_type)

(* ===================================================================== *)
(* Same-namespace classify_type tests *)
(* ===================================================================== *)

let test_classify_same_ns_enum () =
  let ctx = base_ctx () in
  check_kind ctx "TextDirection" Gir_gen_lib.Type_mappings.Tk_Enum

let test_classify_same_ns_bitfield () =
  let ctx = base_ctx () in
  check_kind ctx "StateFlags" Gir_gen_lib.Type_mappings.Tk_Bitfield

let test_classify_same_ns_class () =
  let ctx = base_ctx () in
  check_kind ctx "Widget" Gir_gen_lib.Type_mappings.Tk_Class

let test_classify_same_ns_interface () =
  let ctx = base_ctx () in
  (* lookup_interface matches by c_type, so use the C type name *)
  check_kind ctx "GtkScrollable" Gir_gen_lib.Type_mappings.Tk_Interface

let test_classify_same_ns_record () =
  let ctx = base_ctx () in
  check_kind ctx "TextIter" Gir_gen_lib.Type_mappings.Tk_Record

let test_classify_same_ns_primitive () =
  let ctx = base_ctx () in
  check_kind ctx "gboolean" Gir_gen_lib.Type_mappings.Tk_Primitive

let test_classify_same_ns_unknown () =
  let ctx = base_ctx () in
  check_kind ctx "NoSuchType" Gir_gen_lib.Type_mappings.Tk_Unknown

(* ===================================================================== *)
(* Cross-namespace classify_type tests *)
(* ===================================================================== *)

let test_classify_cross_ns_enum () =
  let ctx = add_cross_refs (base_ctx ()) in
  check_kind ctx "cairo.FontType" Gir_gen_lib.Type_mappings.Tk_Enum

let test_classify_cross_ns_bitfield () =
  let ctx = add_cross_refs (base_ctx ()) in
  check_kind ctx "Gdk.ModifierType" Gir_gen_lib.Type_mappings.Tk_Bitfield

let test_classify_cross_ns_class () =
  let ctx = add_cross_refs (base_ctx ()) in
  check_kind ctx "Gdk.Texture" Gir_gen_lib.Type_mappings.Tk_Class

let test_classify_cross_ns_interface () =
  let ctx = add_cross_refs (base_ctx ()) in
  check_kind ctx "Gdk.Paintable" Gir_gen_lib.Type_mappings.Tk_Interface

let test_classify_cross_ns_record () =
  let ctx = add_cross_refs (base_ctx ()) in
  check_kind ctx "Gdk.ContentFormats" Gir_gen_lib.Type_mappings.Tk_Record

let test_classify_cross_ns_unknown_namespace () =
  let ctx = add_cross_refs (base_ctx ()) in
  check_kind ctx "Foo.Bar" Gir_gen_lib.Type_mappings.Tk_Unknown

let test_classify_cross_ns_unknown_name () =
  let ctx = add_cross_refs (base_ctx ()) in
  check_kind ctx "Gdk.NoSuchType" Gir_gen_lib.Type_mappings.Tk_Unknown

(* ===================================================================== *)
(* Cross-namespace array element type resolution tests *)
(* ===================================================================== *)

let test_array_cross_ns_class_element () =
  let ctx = add_cross_refs (base_ctx ()) in
  let element_type = make_gir_type "Gdk.Texture" in
  let array_type = make_gir_type_with_array "" element_type in
  match Gir_gen_lib.Type_mappings.find_type_mapping_for_gir_type ~ctx array_type with
  | None -> Alcotest.fail "expected array type mapping for Gdk.Texture elements"
  | Some tm ->
      Alcotest.(check bool) "ocaml_type ends with array"
        true (Helpers.string_contains tm.ocaml_type "array");
      Alcotest.(check bool) "ocaml_type contains Ocgtk_gdk"
        true (Helpers.string_contains tm.ocaml_type "Ocgtk_gdk")

let test_array_cross_ns_enum_element () =
  let ctx = add_cross_refs (base_ctx ()) in
  let element_type = make_gir_type "cairo.FontType" in
  let array_type = make_gir_type_with_array "" element_type in
  match Gir_gen_lib.Type_mappings.find_type_mapping_for_gir_type ~ctx array_type with
  | None -> Alcotest.fail "expected array type mapping for cairo.FontType elements"
  | Some tm ->
      Alcotest.(check bool) "ocaml_type ends with array"
        true (Helpers.string_contains tm.ocaml_type "array");
      Alcotest.(check bool) "ocaml_type contains Ocgtk_cairo"
        true (Helpers.string_contains tm.ocaml_type "Ocgtk_cairo")

let test_array_cross_ns_record_element () =
  let ctx = add_cross_refs (base_ctx ()) in
  let element_type = make_gir_type "cairo.Surface" in
  let array_type = make_gir_type_with_array "" element_type in
  match Gir_gen_lib.Type_mappings.find_type_mapping_for_gir_type ~ctx array_type with
  | None -> Alcotest.fail "expected array type mapping for cairo.Surface elements"
  | Some tm ->
      Alcotest.(check bool) "ocaml_type ends with array"
        true (Helpers.string_contains tm.ocaml_type "array");
      Alcotest.(check bool) "ocaml_type contains Ocgtk_cairo"
        true (Helpers.string_contains tm.ocaml_type "Ocgtk_cairo")

let test_array_same_ns_class_element () =
  let ctx = base_ctx () in
  let element_type = make_gir_type "Widget" in
  let array_type = make_gir_type_with_array "" element_type in
  match Gir_gen_lib.Type_mappings.find_type_mapping_for_gir_type ~ctx array_type with
  | None -> Alcotest.fail "expected array type mapping for Widget elements"
  | Some tm ->
      Alcotest.(check bool) "ocaml_type ends with array"
        true (Helpers.string_contains tm.ocaml_type "array");
      Alcotest.(check bool) "ocaml_type contains Widget"
        true (Helpers.string_contains tm.ocaml_type "Widget")

let test_array_unknown_element_returns_none () =
  let ctx = base_ctx () in
  let element_type = make_gir_type "Foo.Unknown" in
  let array_type = make_gir_type_with_array "" element_type in
  Alcotest.(check bool) "unknown element returns None" true
    (Option.is_none
       (Gir_gen_lib.Type_mappings.find_type_mapping_for_gir_type ~ctx array_type))

(* ===================================================================== *)
(* Test list *)
(* ===================================================================== *)

let tests =
  [
    Alcotest.test_case "same-ns enum" `Quick test_classify_same_ns_enum;
    Alcotest.test_case "same-ns bitfield" `Quick test_classify_same_ns_bitfield;
    Alcotest.test_case "same-ns class" `Quick test_classify_same_ns_class;
    Alcotest.test_case "same-ns interface" `Quick test_classify_same_ns_interface;
    Alcotest.test_case "same-ns record" `Quick test_classify_same_ns_record;
    Alcotest.test_case "same-ns primitive" `Quick test_classify_same_ns_primitive;
    Alcotest.test_case "same-ns unknown" `Quick test_classify_same_ns_unknown;
    Alcotest.test_case "cross-ns enum" `Quick test_classify_cross_ns_enum;
    Alcotest.test_case "cross-ns bitfield" `Quick test_classify_cross_ns_bitfield;
    Alcotest.test_case "cross-ns class" `Quick test_classify_cross_ns_class;
    Alcotest.test_case "cross-ns interface" `Quick test_classify_cross_ns_interface;
    Alcotest.test_case "cross-ns record" `Quick test_classify_cross_ns_record;
    Alcotest.test_case "cross-ns unknown namespace" `Quick test_classify_cross_ns_unknown_namespace;
    Alcotest.test_case "cross-ns unknown name" `Quick test_classify_cross_ns_unknown_name;
    Alcotest.test_case "array cross-ns class element" `Quick test_array_cross_ns_class_element;
    Alcotest.test_case "array cross-ns enum element" `Quick test_array_cross_ns_enum_element;
    Alcotest.test_case "array cross-ns record element" `Quick test_array_cross_ns_record_element;
    Alcotest.test_case "array same-ns class element" `Quick test_array_same_ns_class_element;
    Alcotest.test_case "array unknown element returns None" `Quick test_array_unknown_element_returns_none;
  ]
