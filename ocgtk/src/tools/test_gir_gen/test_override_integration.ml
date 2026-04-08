(* Integration tests for the override pipeline.
 *
 * Verifies that override-based filtering propagates correctly through the
 * complete pipeline:
 *   parse GIR → apply overrides → build generation_context
 *   → type-mapping lookups return None for ignored entities
 *
 * This is distinct from test_override_e2e.ml which only checks the
 * apply_overrides result. These tests go one level further and verify
 * that the ctx type-mapping is consistent with the filtering, so that
 * filtering.ml correctly skips methods referencing ignored types.
 *)

open Gir_gen_lib.Types
open Gir_gen_lib.Override_types

(* ========================================================================= *)
(* Shared synthetic GIR XML *)
(* ========================================================================= *)

let synthetic_gir_xml =
  {|<?xml version="1.0"?>
<repository version="1.2"
  xmlns="http://www.gtk.org/introspection/core/1.0"
  xmlns:c="http://www.gtk.org/introspection/c/1.0"
  xmlns:glib="http://www.gtk.org/introspection/glib/1.0">
  <namespace name="Gtk" version="4.0"
             shared-library="libgtk-4.so.1"
             c:identifier-prefixes="Gtk"
             c:symbol-prefixes="gtk">
    <class name="Widget"
           c:type="GtkWidget"
           glib:type-name="GtkWidget"
           glib:get-type="gtk_widget_get_type"
           parent="GObject.Object">
      <constructor name="new" c:identifier="gtk_widget_new" introspectable="1">
        <return-value transfer-ownership="none">
          <type name="Widget" c:type="GtkWidget*"/>
        </return-value>
      </constructor>
      <method name="create" c:identifier="gtk_widget_create" introspectable="1">
        <return-value transfer-ownership="none">
          <type name="none" c:type="void"/>
        </return-value>
      </method>
      <method name="show" c:identifier="gtk_widget_show" introspectable="1">
        <return-value transfer-ownership="none">
          <type name="none" c:type="void"/>
        </return-value>
      </method>
    </class>
    <class name="Button"
           c:type="GtkButton"
           glib:type-name="GtkButton"
           glib:get-type="gtk_button_get_type"
           parent="Widget">
      <constructor name="new" c:identifier="gtk_button_new" introspectable="1">
        <return-value transfer-ownership="none">
          <type name="Button" c:type="GtkButton*"/>
        </return-value>
      </constructor>
    </class>
  </namespace>
</repository>|}

(* ========================================================================= *)
(* Helpers *)
(* ========================================================================= *)

let write_temp_file content =
  let tmp = Filename.temp_file "test_override_integration" ".gir" in
  let oc = open_out tmp in
  output_string oc content;
  close_out oc;
  tmp

(** Parse the synthetic GIR and apply overrides. Returns the apply_result. *)
let parse_and_apply overrides =
  let tmp = write_temp_file synthetic_gir_xml in
  Fun.protect
    ~finally:(fun () -> Sys.remove tmp)
    (fun () ->
      let _repository, _namespace, classes, interfaces, enums, bitfields, records =
        Gir_gen_lib.Parse.Gir_parser.parse_gir_file tmp []
      in
      Gir_gen_lib.Override_apply.apply_overrides ~overrides
        ~classes ~interfaces ~enums ~bitfields ~records ~functions:[])

(** Minimal namespace for building a generation_context in tests. *)
let test_namespace : gir_namespace =
  { namespace_name = "Gtk";
    namespace_version = "4.0";
    namespace_shared_library = "libgtk-4.so.1";
    namespace_c_identifier_prefixes = "Gtk";
    namespace_c_symbol_prefixes = "gtk" }

let test_repository : gir_repository =
  { repository_includes = [];
    repository_c_includes = [];
    repository_packages = [] }

(** Build a generation_context from an apply_result for type-mapping tests. *)
let make_ctx (result : Gir_gen_lib.Override_apply.apply_result) : generation_context =
  { namespace = test_namespace;
    repository = test_repository;
    classes = result.classes;
    interfaces = result.interfaces;
    enums = result.enums;
    bitfields = result.bitfields;
    records = result.records;
    module_groups = Hashtbl.create 0;
    current_cycle_classes = [];
    cross_references = StringMap.empty }

(** A gir_type that references GtkButton* (as returned by a button constructor). *)
let button_gir_type : gir_type =
  { name = "Button"; c_type = Some "GtkButton*"; nullable = false;
    transfer_ownership = TransferNone; array = None }

(** A gir_type that references GtkWidget* (survives override). *)
let widget_gir_type : gir_type =
  { name = "Widget"; c_type = Some "GtkWidget*"; nullable = false;
    transfer_ownership = TransferNone; array = None }

(* ========================================================================= *)
(* Overrides used across tests *)
(* ========================================================================= *)

let ignore_button_overrides =
  { library_name = "Gtk";
    classes =
      [ { class_name = "Button";
          class_action = Some Ignore;
          constructors = []; methods = []; properties = []; signals = [] } ];
    interfaces = []; records = []; enums = []; bitfields = []; functions = [] }

let ignore_create_overrides =
  { library_name = "Gtk";
    classes =
      [ { class_name = "Widget";
          class_action = None;
          constructors = [];
          methods = [ { component_name = "create"; action = Ignore } ];
          properties = []; signals = [] } ];
    interfaces = []; records = []; enums = []; bitfields = []; functions = [] }

let version_widget_overrides =
  { library_name = "Gtk";
    classes =
      [ { class_name = "Widget";
          class_action = Some (Set_version { vs_version = "4.10"; vs_namespace = None });
          constructors = []; methods = []; properties = []; signals = [] } ];
    interfaces = []; records = []; enums = []; bitfields = []; functions = [] }

(* ========================================================================= *)
(* Tests: ctx-level class filtering *)
(* ========================================================================= *)

(** Ignored class must be absent from generation_context.classes so that
    filtering.ml skips methods that reference it via find_type_mapping_for_gir_type. *)
let test_ignored_class_absent_from_ctx () =
  let result = parse_and_apply ignore_button_overrides in
  let ctx = make_ctx result in
  let button_in_ctx =
    List.exists (fun (c : gir_class) -> String.equal c.class_name "Button")
      ctx.classes
  in
  Alcotest.(check bool) "Button absent from ctx.classes" false button_in_ctx

(** Type-mapping lookup for the ignored class must return None.
    This is the key integration property: filtering.ml uses
    find_type_mapping_for_gir_type to decide whether to skip a method whose
    return/parameter type is the ignored class.  When Button is absent from ctx,
    the lookup returns None and those methods are skipped. *)
let test_type_mapping_returns_none_for_ignored_class () =
  let result = parse_and_apply ignore_button_overrides in
  let ctx = make_ctx result in
  let mapping =
    Gir_gen_lib.Type_mappings.find_type_mapping_for_gir_type ~ctx button_gir_type
  in
  Alcotest.(check bool) "type mapping for GtkButton* is None" true
    (Option.is_none mapping)

(** Type-mapping lookup for a surviving class must return Some.
    Verifies that the None above is due to the ignore, not a general failure. *)
let test_type_mapping_returns_some_for_surviving_class () =
  let result = parse_and_apply ignore_button_overrides in
  let ctx = make_ctx result in
  let mapping =
    Gir_gen_lib.Type_mappings.find_type_mapping_for_gir_type ~ctx widget_gir_type
  in
  Alcotest.(check bool) "type mapping for GtkWidget* is Some" true
    (Option.is_some mapping)

(* ========================================================================= *)
(* Tests: ctx-level method filtering *)
(* ========================================================================= *)

(** Ignored method must be absent from the surviving class's method list inside
    the generation_context.  This confirms that component-level overrides also
    propagate into the ctx that the generators use. *)
let test_ignored_method_absent_from_ctx () =
  let result = parse_and_apply ignore_create_overrides in
  let ctx = make_ctx result in
  let widget_opt =
    List.find_opt (fun (c : gir_class) -> String.equal c.class_name "Widget")
      ctx.classes
  in
  match widget_opt with
  | None -> Alcotest.fail "Widget absent from ctx (unexpected)"
  | Some widget ->
    let create_in_ctx =
      List.exists (fun (m : gir_method) -> String.equal m.method_name "create")
        widget.methods
    in
    Alcotest.(check bool) "Widget.create absent from ctx" false create_in_ctx;
    let show_in_ctx =
      List.exists (fun (m : gir_method) -> String.equal m.method_name "show")
        widget.methods
    in
    Alcotest.(check bool) "Widget.show present in ctx" true show_in_ctx

(* ========================================================================= *)
(* Tests: version override propagation *)
(* ========================================================================= *)

(** Entity-level version override must propagate into the class's version field
    inside the generation_context, which feeds into class-level C #if guards. *)
let test_version_override_propagates_to_ctx () =
  let result = parse_and_apply version_widget_overrides in
  let ctx = make_ctx result in
  let widget_opt =
    List.find_opt (fun (c : gir_class) -> String.equal c.class_name "Widget")
      ctx.classes
  in
  match widget_opt with
  | None -> Alcotest.fail "Widget absent from ctx (unexpected)"
  | Some widget ->
    Alcotest.(check (option string)) "Widget.version is Some 4.10"
      (Some "4.10") widget.version

(* ========================================================================= *)
(* Tests: references generation excludes ignored entities *)
(* ========================================================================= *)

(** The references generation path uses the same apply_overrides call.
    Verify that ignored entities are absent from the apply_result used for
    references, mirroring what generate_references does in gir_gen.ml. *)
let test_references_excludes_ignored_class () =
  let result = parse_and_apply ignore_button_overrides in
  (* References generation uses result.classes directly — Button must be absent *)
  let button_in_refs =
    List.exists (fun (c : gir_class) -> String.equal c.class_name "Button")
      result.classes
  in
  Alcotest.(check bool) "Button absent from references classes" false
    button_in_refs;
  (* Widget must still be present for valid references *)
  let widget_in_refs =
    List.exists (fun (c : gir_class) -> String.equal c.class_name "Widget")
      result.classes
  in
  Alcotest.(check bool) "Widget present in references classes" true
    widget_in_refs

(** Parse-based integration: parse the override sexp string, apply to GIR,
    build ctx, and check that the ignored class is absent from the type mapping.
    This exercises the full string-parse → apply → ctx path. *)
let test_sexp_parse_to_ctx_integration () =
  let override_sexp =
    {|(overrides
        (library "Gtk")
        (class Button (ignore))
      )|}
  in
  let overrides =
    match Gir_gen_lib.Override_parser.parse_overrides_from_string override_sexp with
    | Error e ->
        Alcotest.failf "Override parse failed: %s"
          (Gir_gen_lib.Override_parser.format_error e)
    | Ok ov -> ov
  in
  let result = parse_and_apply overrides in
  let ctx = make_ctx result in
  let button_absent =
    not (List.exists (fun (c : gir_class) -> String.equal c.class_name "Button")
      ctx.classes)
  in
  Alcotest.(check bool) "Button absent from ctx after sexp-parsed override" true
    button_absent;
  let mapping =
    Gir_gen_lib.Type_mappings.find_type_mapping_for_gir_type ~ctx button_gir_type
  in
  Alcotest.(check bool) "type mapping None for Button after sexp-parsed override"
    true (Option.is_none mapping)

(* ========================================================================= *)
(* Tests: empty overrides do not affect the ctx *)
(* ========================================================================= *)

let test_empty_overrides_preserve_all_classes () =
  let empty_overrides =
    { library_name = "Gtk";
      classes = []; interfaces = []; records = [];
      enums = []; bitfields = []; functions = [] }
  in
  let result = parse_and_apply empty_overrides in
  let ctx = make_ctx result in
  let class_count = List.length ctx.classes in
  Alcotest.(check int) "both classes present with empty overrides" 2 class_count;
  let button_mapping =
    Gir_gen_lib.Type_mappings.find_type_mapping_for_gir_type ~ctx button_gir_type
  in
  Alcotest.(check bool) "Button type mapping present with empty overrides" true
    (Option.is_some button_mapping)

(* ========================================================================= *)
(* Test suite *)
(* ========================================================================= *)

let test_suite =
  [ ( "integration: ignored class absent from ctx.classes",
      `Quick,
      test_ignored_class_absent_from_ctx );
    ( "integration: type mapping None for ignored class",
      `Quick,
      test_type_mapping_returns_none_for_ignored_class );
    ( "integration: type mapping Some for surviving class",
      `Quick,
      test_type_mapping_returns_some_for_surviving_class );
    ( "integration: ignored method absent from ctx class",
      `Quick,
      test_ignored_method_absent_from_ctx );
    ( "integration: version override propagates into ctx",
      `Quick,
      test_version_override_propagates_to_ctx );
    ( "integration: references generation excludes ignored class",
      `Quick,
      test_references_excludes_ignored_class );
    ( "integration: sexp parse → apply → ctx type mapping",
      `Quick,
      test_sexp_parse_to_ctx_integration );
    ( "integration: empty overrides preserve all classes",
      `Quick,
      test_empty_overrides_preserve_all_classes ) ]
