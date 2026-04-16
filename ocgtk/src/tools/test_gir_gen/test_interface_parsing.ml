(* Tests for Phase 1: gir_interface type extensions and parser.
 *
 * Verifies that parse_interface correctly extracts the 4 new fields:
 *   glib_type_name, glib_get_type, prerequisites, introspectable
 *
 * Tests use both the real Gtk-4.0.gir file (for GtkEditable) and
 * synthetic XML (for edge cases).
 *
 * Shared file utilities come from the Helpers module (infrastructure/helpers.ml).
 * GIR XML is wrapped via Helpers.wrap_namespace.
 *)

open Gir_gen_lib.Types

(* ========================================================================= *)
(* Helpers *)
(* ========================================================================= *)

(** Write [content] to a temp file and return its path. *)
let write_temp_gir content =
  let tmp = Filename.temp_file "test_interface_parsing" ".gir" in
  Helpers.create_gir_file tmp content;
  tmp

(** Wrap namespace content in a minimal GIR repository envelope. *)
let make_gir_xml namespace_content =
  Helpers.wrap_namespace ~version:"4.0" namespace_content

let parse_gir_string content =
  let tmp = write_temp_gir content in
  Fun.protect
    ~finally:(fun () -> Sys.remove tmp)
    (fun () -> Gir_gen_lib.Parse.Gir_parser.parse_gir_file tmp [])

let find_iface name interfaces =
  List.find_opt
    (fun (i : gir_interface) -> String.equal i.interface_name name)
    interfaces

(* ========================================================================= *)
(* Real GIR file: GtkEditable *)
(* ========================================================================= *)

let real_gir_file = "/usr/share/gir-1.0/Gtk-4.0.gir"

let test_editable_glib_type_name () =
  let _repo, _ns, _classes, interfaces, _enums, _bitfields, _records =
    Gir_gen_lib.Parse.Gir_parser.parse_gir_file real_gir_file []
  in
  let editable =
    match find_iface "Editable" interfaces with
    | None -> Alcotest.fail "Editable not found in parsed interfaces"
    | Some i -> i
  in
  Alcotest.(check (option string))
    "glib_type_name" (Some "GtkEditable") editable.glib_type_name

let test_editable_glib_get_type () =
  let _repo, _ns, _classes, interfaces, _enums, _bitfields, _records =
    Gir_gen_lib.Parse.Gir_parser.parse_gir_file real_gir_file []
  in
  let editable =
    match find_iface "Editable" interfaces with
    | None -> Alcotest.fail "Editable not found"
    | Some i -> i
  in
  Alcotest.(check (option string))
    "glib_get_type" (Some "gtk_editable_get_type") editable.glib_get_type

let test_editable_prerequisites () =
  let _repo, _ns, _classes, interfaces, _enums, _bitfields, _records =
    Gir_gen_lib.Parse.Gir_parser.parse_gir_file real_gir_file []
  in
  let editable =
    match find_iface "Editable" interfaces with
    | None -> Alcotest.fail "Editable not found"
    | Some i -> i
  in
  Alcotest.(check (list string))
    "prerequisites" [ "Widget" ] editable.prerequisites

let test_editable_introspectable () =
  let _repo, _ns, _classes, interfaces, _enums, _bitfields, _records =
    Gir_gen_lib.Parse.Gir_parser.parse_gir_file real_gir_file []
  in
  let editable =
    match find_iface "Editable" interfaces with
    | None -> Alcotest.fail "Editable not found"
    | Some i -> i
  in
  Alcotest.(check bool) "introspectable" true editable.introspectable

let test_editable_methods_nonempty () =
  let _repo, _ns, _classes, interfaces, _enums, _bitfields, _records =
    Gir_gen_lib.Parse.Gir_parser.parse_gir_file real_gir_file []
  in
  let editable =
    match find_iface "Editable" interfaces with
    | None -> Alcotest.fail "Editable not found"
    | Some i -> i
  in
  Alcotest.(check bool)
    "methods non-empty" true
    (List.length editable.methods > 0)

let test_editable_properties_nonempty () =
  let _repo, _ns, _classes, interfaces, _enums, _bitfields, _records =
    Gir_gen_lib.Parse.Gir_parser.parse_gir_file real_gir_file []
  in
  let editable =
    match find_iface "Editable" interfaces with
    | None -> Alcotest.fail "Editable not found"
    | Some i -> i
  in
  Alcotest.(check bool)
    "properties non-empty" true
    (List.length editable.properties > 0)

(* ========================================================================= *)
(* Synthetic XML: introspectable="0" *)
(* ========================================================================= *)

let non_introspectable_iface_xml =
  make_gir_xml
    {|<interface name="MyIface"
               c:type="GtkMyIface"
               glib:type-name="GtkMyIface"
               glib:get-type="gtk_my_iface_get_type"
               introspectable="0">
      <prerequisite name="Widget"/>
    </interface>|}

let test_introspectable_false () =
  let _repo, _ns, _classes, interfaces, _enums, _bitfields, _records =
    parse_gir_string non_introspectable_iface_xml
  in
  let iface =
    match find_iface "MyIface" interfaces with
    | None -> Alcotest.fail "MyIface not found"
    | Some i -> i
  in
  Alcotest.(check bool)
    "introspectable=false when attr is 0" false iface.introspectable

(* ========================================================================= *)
(* Synthetic XML: no prerequisites *)
(* ========================================================================= *)

let no_prereqs_iface_xml =
  make_gir_xml
    {|<interface name="MyIface"
               c:type="GtkMyIface"
               glib:type-name="GtkMyIface"
               glib:get-type="gtk_my_iface_get_type">
    </interface>|}

let test_no_prerequisites () =
  let _repo, _ns, _classes, interfaces, _enums, _bitfields, _records =
    parse_gir_string no_prereqs_iface_xml
  in
  let iface =
    match find_iface "MyIface" interfaces with
    | None -> Alcotest.fail "MyIface not found"
    | Some i -> i
  in
  Alcotest.(check (list string)) "prerequisites empty" [] iface.prerequisites

(* ========================================================================= *)
(* Synthetic XML: multiple prerequisites *)
(* ========================================================================= *)

let multi_prereqs_iface_xml =
  make_gir_xml
    {|<interface name="MyIface"
               c:type="GtkMyIface"
               glib:type-name="GtkMyIface"
               glib:get-type="gtk_my_iface_get_type">
      <prerequisite name="Widget"/>
      <prerequisite name="Accessible"/>
    </interface>|}

let test_multiple_prerequisites () =
  let _repo, _ns, _classes, interfaces, _enums, _bitfields, _records =
    parse_gir_string multi_prereqs_iface_xml
  in
  let iface =
    match find_iface "MyIface" interfaces with
    | None -> Alcotest.fail "MyIface not found"
    | Some i -> i
  in
  Alcotest.(check (list string))
    "multiple prerequisites in order" [ "Widget"; "Accessible" ]
    iface.prerequisites

(* ========================================================================= *)
(* Synthetic XML: missing optional attributes *)
(* ========================================================================= *)

let minimal_iface_xml =
  make_gir_xml
    {|<interface name="MyIface"
               c:type="GtkMyIface">
    </interface>|}

let test_missing_glib_attrs_are_none () =
  let _repo, _ns, _classes, interfaces, _enums, _bitfields, _records =
    parse_gir_string minimal_iface_xml
  in
  let iface =
    match find_iface "MyIface" interfaces with
    | None -> Alcotest.fail "MyIface not found"
    | Some i -> i
  in
  Alcotest.(check (option string))
    "glib_type_name None when absent" None iface.glib_type_name;
  Alcotest.(check (option string))
    "glib_get_type None when absent" None iface.glib_get_type

let test_introspectable_defaults_true () =
  let _repo, _ns, _classes, interfaces, _enums, _bitfields, _records =
    parse_gir_string minimal_iface_xml
  in
  let iface =
    match find_iface "MyIface" interfaces with
    | None -> Alcotest.fail "MyIface not found"
    | Some i -> i
  in
  Alcotest.(check bool)
    "introspectable defaults to true when absent" true iface.introspectable

(* ========================================================================= *)
(* Test suite *)
(* ========================================================================= *)

let test_suite =
  [
    ("editable: glib_type_name", `Slow, test_editable_glib_type_name);
    ("editable: glib_get_type", `Slow, test_editable_glib_get_type);
    ("editable: prerequisites = [Widget]", `Slow, test_editable_prerequisites);
    ("editable: introspectable = true", `Slow, test_editable_introspectable);
    ("editable: methods non-empty", `Slow, test_editable_methods_nonempty);
    ("editable: properties non-empty", `Slow, test_editable_properties_nonempty);
    ( "synthetic: introspectable=false when attr is 0",
      `Quick,
      test_introspectable_false );
    ("synthetic: no prerequisites = []", `Quick, test_no_prerequisites);
    ( "synthetic: multiple prerequisites in order",
      `Quick,
      test_multiple_prerequisites );
    ( "synthetic: missing glib attrs are None",
      `Quick,
      test_missing_glib_attrs_are_none );
    ( "synthetic: introspectable defaults to true",
      `Quick,
      test_introspectable_defaults_true );
  ]
