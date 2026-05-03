(* Layer 2: Signal_marshaller unit tests.
   Verifies that Signal_marshaller.classify maps GIR types to the correct
   Supported/Unsupported result, ocaml_type string, and getter/setter
   expression substrings.  Tests use Type_factory to build gir_type and
   generation_context values directly — no GIR XML parsing. *)

open Containers
open Gir_gen_lib.Types

(* ========================================================================= *)
(* Assertion helpers                                                          *)
(* ========================================================================= *)

(** [assert_supported ~label result f] fails the test if [result] is
    [Unsupported], otherwise calls [f] with the marshaller. *)
let assert_supported ~label result f =
  match result with
  | Gir_gen_lib.Generate.Signal_marshaller.Unsupported reason ->
      Alcotest.failf "%s: expected Supported but got Unsupported %S" label
        reason
  | Gir_gen_lib.Generate.Signal_marshaller.Supported m -> f m

(** [assert_unsupported ~label result expected_substring] fails if
    [result] is [Supported] or if the reason does not contain
    [expected_substring]. *)
let assert_unsupported ~label result expected_substring =
  match result with
  | Gir_gen_lib.Generate.Signal_marshaller.Supported m ->
      Alcotest.failf "%s: expected Unsupported but got Supported {type=%S}"
        label m.ocaml_type
  | Gir_gen_lib.Generate.Signal_marshaller.Unsupported reason ->
      if not (String.mem ~sub:expected_substring reason) then
        Alcotest.failf
          "%s: Unsupported reason %S does not contain expected substring %S"
          label reason expected_substring

(** Check that [expr] contains [expected_substring]. *)
let assert_expr_contains ~label ~field expr expected_substring =
  if not (String.mem ~sub:expected_substring expr) then
    Alcotest.failf
      "%s: %s %S does not contain expected substring %S"
      label field expr expected_substring

(* ========================================================================= *)
(* Shared test context builders                                               *)
(* ========================================================================= *)

(** Base Gtk-namespace context with no entities. *)
let gtk_ctx () =
  Type_factory.make_generation_context
    ~namespace:
      (Type_factory.make_gir_namespace ~namespace_name:"Gtk"
         ~namespace_version:"4.0"
         ~namespace_shared_library:"libgtk-4.so.1"
         ~namespace_c_identifier_prefixes:"Gtk"
         ~namespace_c_symbol_prefixes:"gtk" ())
    ()

(** Gtk context with Orientation enum. *)
let gtk_ctx_with_orientation () =
  let orientation_enum =
    Type_factory.make_gir_enum ~enum_name:"Orientation"
      ~enum_c_type:"GtkOrientation"
      ~members:
        [
          Type_factory.make_gir_enum_member ~member_name:"HORIZONTAL"
            ~member_value:0 ~c_identifier:"GTK_ORIENTATION_HORIZONTAL" ();
          Type_factory.make_gir_enum_member ~member_name:"VERTICAL"
            ~member_value:1 ~c_identifier:"GTK_ORIENTATION_VERTICAL" ();
        ]
      ()
  in
  Type_factory.make_generation_context
    ~namespace:
      (Type_factory.make_gir_namespace ~namespace_name:"Gtk"
         ~namespace_version:"4.0"
         ~namespace_shared_library:"libgtk-4.so.1"
         ~namespace_c_identifier_prefixes:"Gtk"
         ~namespace_c_symbol_prefixes:"gtk" ())
    ~enums:[ orientation_enum ] ()

(** Gtk context with a cross-namespace Gdk.ModifierType bitfield. *)
let gtk_ctx_with_gdk_modifiertype () =
  let gdk_entities =
    StringMap.empty
    |> StringMap.add "ModifierType"
         (Type_factory.make_cross_reference_entity ~cr_name:"ModifierType"
            ~cr_type:(Type_factory.make_cross_reference_type `Bitfield)
            ~cr_c_type:"GdkModifierType" ())
  in
  let cross_refs =
    Type_factory.make_cross_reference_map
      [ Helpers.make_ncr "Gdk" gdk_entities ]
  in
  { (gtk_ctx ()) with cross_references = cross_refs }

(** Gtk context with a GtkWidget class. *)
let gtk_ctx_with_widget () =
  Type_factory.make_generation_context
    ~namespace:
      (Type_factory.make_gir_namespace ~namespace_name:"Gtk"
         ~namespace_version:"4.0"
         ~namespace_shared_library:"libgtk-4.so.1"
         ~namespace_c_identifier_prefixes:"Gtk"
         ~namespace_c_symbol_prefixes:"gtk" ())
    ~classes:
      [
        Type_factory.make_gir_class ~class_name:"Widget" ~c_type:"GtkWidget" ();
      ]
    ()

(** Gtk context with a cross-namespace Gio.File class. *)
let gtk_ctx_with_gio_file () =
  let gio_entities =
    StringMap.empty
    |> StringMap.add "File"
         (Type_factory.make_cross_reference_entity ~cr_name:"File"
            ~cr_type:(Type_factory.make_cross_reference_type `Interface)
            ~cr_c_type:"GFile*" ())
  in
  let cross_refs =
    Type_factory.make_cross_reference_map
      [ Helpers.make_ncr "Gio" gio_entities ]
  in
  { (gtk_ctx ()) with cross_references = cross_refs }

(** Gtk context with a TextIter record (boxed). *)
let gtk_ctx_with_textiter () =
  Type_factory.make_generation_context
    ~namespace:
      (Type_factory.make_gir_namespace ~namespace_name:"Gtk"
         ~namespace_version:"4.0"
         ~namespace_shared_library:"libgtk-4.so.1"
         ~namespace_c_identifier_prefixes:"Gtk"
         ~namespace_c_symbol_prefixes:"gtk" ())
    ~records:
      [
        Type_factory.make_gir_record ~record_name:"TextIter"
          ~c_type:"GtkTextIter" ();
      ]
    ()

let classify = Gir_gen_lib.Generate.Signal_marshaller.classify

(* ========================================================================= *)
(* Test cases                                                                 *)
(* ========================================================================= *)

let test_gboolean_maps_to_bool () =
  let ctx = gtk_ctx () in
  let gir_type = Type_factory.make_gir_type ~name:"gboolean" ~c_type:"gboolean" () in
  let result = classify ~ctx ~gir_type in
  assert_supported ~label:"gboolean" result @@ fun m ->
  Alcotest.(check string) "ocaml_type" "bool" m.ocaml_type;
  assert_expr_contains ~label:"gboolean" ~field:"getter_expr"
    m.getter_expr "Gobject.Value.get_boolean"

let test_gint_maps_to_int () =
  let ctx = gtk_ctx () in
  let gir_type = Type_factory.make_gir_type ~name:"gint" ~c_type:"gint" () in
  let result = classify ~ctx ~gir_type in
  assert_supported ~label:"gint" result @@ fun m ->
  Alcotest.(check string) "ocaml_type" "int" m.ocaml_type;
  assert_expr_contains ~label:"gint" ~field:"getter_expr"
    m.getter_expr "Gobject.Value.get_int"

let test_guint_maps_to_int () =
  let ctx = gtk_ctx () in
  let gir_type = Type_factory.make_gir_type ~name:"guint" ~c_type:"guint" () in
  let result = classify ~ctx ~gir_type in
  assert_supported ~label:"guint" result @@ fun m ->
  Alcotest.(check string) "ocaml_type" "int" m.ocaml_type;
  assert_expr_contains ~label:"guint" ~field:"getter_expr"
    m.getter_expr "Gobject.Value.get_uint"

let test_gint64_maps_to_int64 () =
  let ctx = gtk_ctx () in
  let gir_type = Type_factory.make_gir_type ~name:"gint64" ~c_type:"gint64" () in
  let result = classify ~ctx ~gir_type in
  assert_supported ~label:"gint64" result @@ fun m ->
  Alcotest.(check string) "ocaml_type" "Int64.t" m.ocaml_type;
  assert_expr_contains ~label:"gint64" ~field:"getter_expr"
    m.getter_expr "Gobject.Value.get_int64"

let test_gdouble_maps_to_float () =
  let ctx = gtk_ctx () in
  let gir_type = Type_factory.make_gir_type ~name:"gdouble" ~c_type:"gdouble" () in
  let result = classify ~ctx ~gir_type in
  assert_supported ~label:"gdouble" result @@ fun m ->
  Alcotest.(check string) "ocaml_type" "float" m.ocaml_type;
  assert_expr_contains ~label:"gdouble" ~field:"getter_expr"
    m.getter_expr "Gobject.Value.get_double"

let test_utf8_maps_to_string () =
  let ctx = gtk_ctx () in
  let gir_type =
    Type_factory.make_gir_type ~name:"utf8" ~c_type:"const gchar*" ()
  in
  let result = classify ~ctx ~gir_type in
  assert_supported ~label:"utf8" result @@ fun m ->
  Alcotest.(check string) "ocaml_type" "string" m.ocaml_type;
  assert_expr_contains ~label:"utf8" ~field:"getter_expr"
    m.getter_expr "Gobject.Value.get_string"

let test_same_ns_enum_orientation () =
  let ctx = gtk_ctx_with_orientation () in
  let gir_type =
    Type_factory.make_gir_type ~name:"Orientation" ~c_type:"GtkOrientation" ()
  in
  let result = classify ~ctx ~gir_type in
  assert_supported ~label:"Orientation enum" result @@ fun m ->
  Alcotest.(check string) "ocaml_type" "Gtk_enums.orientation" m.ocaml_type;
  assert_expr_contains ~label:"Orientation enum" ~field:"getter_expr"
    m.getter_expr "Gobject.Value.get_enum_int";
  assert_expr_contains ~label:"Orientation enum" ~field:"getter_expr"
    m.getter_expr "Gtk_enums.orientation_of_int"

let test_cross_ns_bitfield_modifiertype () =
  let ctx = gtk_ctx_with_gdk_modifiertype () in
  let gir_type =
    Type_factory.make_gir_type ~name:"Gdk.ModifierType"
      ~c_type:"GdkModifierType" ()
  in
  let result = classify ~ctx ~gir_type in
  assert_supported ~label:"Gdk.ModifierType bitfield" result @@ fun m ->
  Alcotest.(check string) "ocaml_type"
    "Ocgtk_gdk.Gdk_enums.modifiertype" m.ocaml_type;
  assert_expr_contains ~label:"Gdk.ModifierType bitfield" ~field:"getter_expr"
    m.getter_expr "Gobject.Value.get_flags_int";
  assert_expr_contains ~label:"Gdk.ModifierType bitfield" ~field:"getter_expr"
    m.getter_expr "Ocgtk_gdk.Gdk_enums.modifiertype_of_int"

let test_glib_variant_maps_to_gvariant () =
  let ctx = gtk_ctx () in
  let gir_type =
    Type_factory.make_gir_type ~name:"GLib.Variant" ~c_type:"GVariant*" ()
  in
  let result = classify ~ctx ~gir_type in
  assert_supported ~label:"GLib.Variant" result @@ fun m ->
  Alcotest.(check string) "ocaml_type" "Gvariant.t" m.ocaml_type;
  assert_expr_contains ~label:"GLib.Variant" ~field:"getter_expr"
    m.getter_expr "Gobject.Value.get_variant"

let test_same_ns_gobject_class () =
  let ctx = gtk_ctx_with_widget () in
  let gir_type =
    Type_factory.make_gir_type ~name:"Widget" ~c_type:"GtkWidget*" ()
  in
  let result = classify ~ctx ~gir_type in
  assert_supported ~label:"GtkWidget class" result @@ fun m ->
  Alcotest.(check string) "ocaml_type" "Gtk.Widget.t Gobject.obj" m.ocaml_type;
  assert_expr_contains ~label:"GtkWidget class" ~field:"getter_expr"
    m.getter_expr "Gobject.Value.get_object"

let test_cross_ns_gobject_gio_file () =
  let ctx = gtk_ctx_with_gio_file () in
  let gir_type =
    Type_factory.make_gir_type ~name:"Gio.File" ~c_type:"GFile*" ()
  in
  let result = classify ~ctx ~gir_type in
  assert_supported ~label:"Gio.File interface" result @@ fun m ->
  Alcotest.(check string) "ocaml_type"
    "Ocgtk_gio.Gio.File.t Gobject.obj" m.ocaml_type;
  assert_expr_contains ~label:"Gio.File interface" ~field:"getter_expr"
    m.getter_expr "Gobject.Value.get_object"

let test_garray_is_unsupported () =
  let ctx = gtk_ctx () in
  let array_info =
    Type_factory.make_gir_array
      ~element_type:(Type_factory.make_gir_type ~name:"gint" ())
      ()
  in
  let gir_type =
    Type_factory.make_gir_type ~name:"GLib.Array" ~c_type:"GArray*"
      ~array:array_info ()
  in
  let result = classify ~ctx ~gir_type in
  assert_unsupported ~label:"GLib.Array" result "GArray not yet supported"

let test_boxed_textiter_is_unsupported () =
  let ctx = gtk_ctx_with_textiter () in
  let gir_type =
    Type_factory.make_gir_type ~name:"TextIter" ~c_type:"GtkTextIter*" ()
  in
  let result = classify ~ctx ~gir_type in
  assert_unsupported ~label:"Gtk.TextIter boxed" result "TextIter"

let test_callback_type_is_unsupported () =
  let ctx = gtk_ctx () in
  (* A type whose name contains "Func" (case-insensitive) is treated as a
     callback by the classifier. *)
  let gir_type =
    Type_factory.make_gir_type ~name:"DestroyFunc" ~c_type:"GDestroyNotify" ()
  in
  let result = classify ~ctx ~gir_type in
  assert_unsupported ~label:"callback type" result "Milestone 4"

let test_void_none_return () =
  let ctx = gtk_ctx () in
  let gir_type = Type_factory.make_gir_type ~name:"none" ~c_type:"void" () in
  let result = classify ~ctx ~gir_type in
  assert_supported ~label:"void/none return" result @@ fun m ->
  Alcotest.(check string) "ocaml_type" "unit" m.ocaml_type

(* ========================================================================= *)
(* Test suite                                                                 *)
(* ========================================================================= *)

let tests =
  [
    Alcotest.test_case "gboolean maps to bool" `Quick
      test_gboolean_maps_to_bool;
    Alcotest.test_case "gint maps to int" `Quick test_gint_maps_to_int;
    Alcotest.test_case "guint maps to int (get_uint)" `Quick
      test_guint_maps_to_int;
    Alcotest.test_case "gint64 maps to Int64.t" `Quick
      test_gint64_maps_to_int64;
    Alcotest.test_case "gdouble maps to float" `Quick
      test_gdouble_maps_to_float;
    Alcotest.test_case "utf8 maps to string" `Quick test_utf8_maps_to_string;
    Alcotest.test_case "same-ns enum Orientation -> Gtk_enums.orientation"
      `Quick test_same_ns_enum_orientation;
    Alcotest.test_case
      "cross-ns bitfield Gdk.ModifierType -> Ocgtk_gdk.Gdk_enums.modifiertype"
      `Quick test_cross_ns_bitfield_modifiertype;
    Alcotest.test_case "GLib.Variant maps to Gvariant.t" `Quick
      test_glib_variant_maps_to_gvariant;
    Alcotest.test_case "same-ns GObject Widget -> Gtk.Widget.t Gobject.obj"
      `Quick test_same_ns_gobject_class;
    Alcotest.test_case
      "cross-ns GObject Gio.File -> Ocgtk_gio.Gio.File.t Gobject.obj" `Quick
      test_cross_ns_gobject_gio_file;
    Alcotest.test_case "GLib.Array is Unsupported" `Quick
      test_garray_is_unsupported;
    Alcotest.test_case "Gtk.TextIter boxed is Unsupported" `Quick
      test_boxed_textiter_is_unsupported;
    Alcotest.test_case "callback type is Unsupported (Milestone 4)" `Quick
      test_callback_type_is_unsupported;
    Alcotest.test_case "void/none return maps to unit" `Quick
      test_void_none_return;
  ]
