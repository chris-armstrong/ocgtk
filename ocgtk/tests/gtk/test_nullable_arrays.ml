(** Runtime tests for the four phase-5 nullable length-linked array out-param
    bindings beyond [Tree_path.get_indices_with_depth] (covered separately in
    [test_tree_path.ml]).

    Phase 5 of the value-kinds-registry plan added a NULL guard to the C-stub
    array emitter so a NULL return from a nullable length-linked array out param
    materialises as [None] in OCaml rather than crashing on [Array.length] of an
    invalid pointer. The generator unit tests ([record_macro_tests]) cover the
    emitter; these tests exercise the generated C stubs end-to-end against real
    GTK objects.

    Coverage strategy: each binding has a setter that takes [_ array option]
    (or, for [Drop_target.set_gtypes], with a length parameter). We drive a
    [Some]/[None] round trip and assert the get matches. Default-value
    assertions are deliberately avoided: GTK is free to seed defaults (e.g.
    [Icon_theme] inherits a system search path) and the contract under test is
    that the [option] wrapping deserialises correctly in both branches, not that
    the default is any specific value.

    Alert_dialog.get_buttons is not exercised here: GtkAlertDialog has no
    introspectable constructor (gtk_alert_dialog_new is varargs) and
    [g_type_from_name] cannot retrieve the GType until something forces
    registration. Adding a one-line C stub for [gtk_alert_dialog_get_type] would
    be the clean path; left as follow-up so this PR stays test-only. The
    [set_buttons]/[get_buttons] codegen path is identical to the other three
    bindings, so coverage is sufficient. *)

open Alcotest
open Ocgtk_gtk.Gtk
module Helpers = Gtk_test_helpers

let require_gtk = Helpers.require_gtk

(* ========== Drop_target.get_gtypes : t -> int array option * Gsize.t ========== *)

let test_drop_target_get_gtypes_set_none_round_trips () =
  (* Constructing with a placeholder GType then clearing it via
     [set_gtypes None 0] is the only way to land in the None branch:
     [gtk_drop_target_new] seeds the internal types list from its argument. *)
  let dt = Wrappers.Drop_target.new_ (Gobject.Type.from_name "gchararray") [] in
  Wrappers.Drop_target.set_gtypes dt None Gsize.zero;
  let arr_opt, n = Wrappers.Drop_target.get_gtypes dt in
  check int "count is 0 after set_gtypes None" 0 (Gsize.to_int n);
  match arr_opt with
  | None -> ()
  | Some arr ->
      fail
        (Printf.sprintf
           "expected None after set_gtypes None but got Some(array of length \
            %d)"
           (Array.length arr))

let test_drop_target_get_gtypes_set_some_round_trips () =
  let dt = Wrappers.Drop_target.new_ (Gobject.Type.from_name "gchararray") [] in
  let g_string = Gobject.Type.from_name "gchararray" in
  let g_int = Gobject.Type.from_name "gint" in
  let expected = [| g_string; g_int |] in
  Wrappers.Drop_target.set_gtypes dt (Some expected)
    (Gsize.of_int (Array.length expected));
  let arr_opt, n = Wrappers.Drop_target.get_gtypes dt in
  check int "count matches set" (Array.length expected) (Gsize.to_int n);
  match arr_opt with
  | None -> fail "expected Some after set_gtypes Some but got None"
  | Some arr ->
      check int "array length matches count" (Gsize.to_int n) (Array.length arr);
      Array.iteri
        (fun i v -> check int (Printf.sprintf "gtypes[%d]" i) expected.(i) v)
        arr

(* ========== Icon_theme.get_search_path : t -> string array option ========== *)

let test_icon_theme_get_search_path_set_none_round_trips () =
  let theme = Wrappers.Icon_theme.new_ () in
  Wrappers.Icon_theme.set_search_path theme None;
  match Wrappers.Icon_theme.get_search_path theme with
  | None -> ()
  | Some arr ->
      fail
        (Printf.sprintf
           "expected None after set_search_path None but got Some(array of \
            length %d)"
           (Array.length arr))

let test_icon_theme_get_search_path_set_some_round_trips () =
  let theme = Wrappers.Icon_theme.new_ () in
  let expected = [| "/tmp/icons-a"; "/tmp/icons-b" |] in
  Wrappers.Icon_theme.set_search_path theme (Some expected);
  match Wrappers.Icon_theme.get_search_path theme with
  | None -> fail "expected Some after set_search_path Some but got None"
  | Some arr ->
      check int "search path length matches" (Array.length expected)
        (Array.length arr);
      Array.iteri
        (fun i v ->
          check string (Printf.sprintf "search_path[%d]" i) expected.(i) v)
        arr

(* ========== Icon_theme.get_resource_path : t -> string array option ========== *)

let test_icon_theme_get_resource_path_set_none_round_trips () =
  let theme = Wrappers.Icon_theme.new_ () in
  Wrappers.Icon_theme.set_resource_path theme None;
  match Wrappers.Icon_theme.get_resource_path theme with
  | None -> ()
  | Some arr ->
      fail
        (Printf.sprintf
           "expected None after set_resource_path None but got Some(array of \
            length %d)"
           (Array.length arr))

let test_icon_theme_get_resource_path_set_some_round_trips () =
  let theme = Wrappers.Icon_theme.new_ () in
  let expected = [| "/org/example/icons"; "/org/example/more-icons" |] in
  Wrappers.Icon_theme.set_resource_path theme (Some expected);
  match Wrappers.Icon_theme.get_resource_path theme with
  | None -> fail "expected Some after set_resource_path Some but got None"
  | Some arr ->
      check int "resource path length matches" (Array.length expected)
        (Array.length arr);
      Array.iteri
        (fun i v ->
          check string (Printf.sprintf "resource_path[%d]" i) expected.(i) v)
        arr

(* ========== Test Suite ========== *)

let () =
  run "Phase-5 nullable array out-params"
    [
      ( "Drop_target.get_gtypes",
        [
          test_case "set None round trips to None" `Quick
            (require_gtk test_drop_target_get_gtypes_set_none_round_trips);
          test_case "set Some round trips to Some" `Quick
            (require_gtk test_drop_target_get_gtypes_set_some_round_trips);
        ] );
      ( "Icon_theme.get_search_path",
        [
          test_case "set None round trips to None" `Quick
            (require_gtk test_icon_theme_get_search_path_set_none_round_trips);
          test_case "set Some round trips to Some" `Quick
            (require_gtk test_icon_theme_get_search_path_set_some_round_trips);
        ] );
      ( "Icon_theme.get_resource_path",
        [
          test_case "set None round trips to None" `Quick
            (require_gtk test_icon_theme_get_resource_path_set_none_round_trips);
          test_case "set Some round trips to Some" `Quick
            (require_gtk test_icon_theme_get_resource_path_set_some_round_trips);
        ] );
    ]
