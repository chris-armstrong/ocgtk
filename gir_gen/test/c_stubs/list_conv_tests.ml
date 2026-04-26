(* GList/GSList Conversion Tests - validates transfer-ownership handling *)

open Gir_gen_lib.Types
open Type_factory

let make_glist_return ?(nullable = false) ?(transfer_ownership = TransferNone)
    () =
  let elem = make_gir_type ~name:"GtkWidget" ~c_type:"GtkWidget*" () in
  let arr = make_gir_array ~array_name:"GLib.List" ~element_type:elem () in
  make_gir_type ~name:"GLib.List" ~c_type:"GList*" ~nullable ~array:arr
    ~transfer_ownership ()

let make_gslist_return ?(nullable = false) ?(transfer_ownership = TransferNone)
    () =
  let elem = make_gir_type ~name:"GtkWidget" ~c_type:"GtkWidget*" () in
  let arr = make_gir_array ~array_name:"GLib.SList" ~element_type:elem () in
  make_gir_type ~name:"GLib.SList" ~c_type:"GSList*" ~nullable ~array:arr
    ~transfer_ownership ()

(* ========================================================================= *)
(* GList Return Transfer Ownership Tests                                      *)
(* ========================================================================= *)

(* transfer-ownership=none: the list belongs to the callee.
   Calling g_list_free would corrupt the callee's internal state. *)
let test_glist_return_transfer_none () =
  let meth =
    make_gir_method ~method_name:"get_windows"
      ~c_identifier:"gtk_application_get_windows"
      ~return_type:(make_glist_return ~transfer_ownership:TransferNone ())
      ()
  in
  let func =
    Helpers.generate_and_find_c_method ~log_label:"GList transfer-none"
      ~c_type:"GtkApplication" ~class_name:"Application" meth
  in
  Alcotest.(check bool)
    "transfer-none GList return must NOT call g_list_free" false
    (C_ast.function_calls_function func "g_list_free")

(* transfer-ownership=container: caller owns the list nodes, not the elements.
   Must call g_list_free to free the list nodes. *)
let test_glist_return_transfer_container () =
  let meth =
    make_gir_method ~method_name:"get_cells"
      ~c_identifier:"gtk_cell_layout_get_cells"
      ~return_type:
        (make_glist_return ~transfer_ownership:TransferContainer ())
      ()
  in
  let func =
    Helpers.generate_and_find_c_method ~log_label:"GList transfer-container"
      ~c_type:"GtkCellLayout" ~class_name:"CellLayout" meth
  in
  Alcotest.(check bool)
    "transfer-container GList return must call g_list_free" true
    (C_ast.function_calls_function func "g_list_free")

(* transfer-ownership=full: caller owns both list nodes and elements.
   Must call g_list_free; element memory is handled by GObject finalizers. *)
let test_glist_return_transfer_full () =
  let meth =
    make_gir_method ~method_name:"get_items"
      ~c_identifier:"gtk_recent_manager_get_items"
      ~return_type:(make_glist_return ~transfer_ownership:TransferFull ())
      ()
  in
  let func =
    Helpers.generate_and_find_c_method ~log_label:"GList transfer-full"
      ~c_type:"GtkRecentManager" ~class_name:"RecentManager" meth
  in
  Alcotest.(check bool)
    "transfer-full GList return must call g_list_free" true
    (C_ast.function_calls_function func "g_list_free")

(* Same transfer-none check for GSList *)
let test_gslist_return_transfer_none () =
  let meth =
    make_gir_method ~method_name:"get_widgets"
      ~c_identifier:"gtk_size_group_get_widgets"
      ~return_type:(make_gslist_return ~transfer_ownership:TransferNone ())
      ()
  in
  let func =
    Helpers.generate_and_find_c_method ~log_label:"GSList transfer-none"
      ~c_type:"GtkSizeGroup" ~class_name:"SizeGroup" meth
  in
  Alcotest.(check bool)
    "transfer-none GSList return must NOT call g_slist_free" false
    (C_ast.function_calls_function func "g_slist_free")

let tests =
  [
    Alcotest.test_case "GList return transfer-none: no g_list_free" `Quick
      test_glist_return_transfer_none;
    Alcotest.test_case "GList return transfer-container: calls g_list_free"
      `Quick test_glist_return_transfer_container;
    Alcotest.test_case "GList return transfer-full: calls g_list_free" `Quick
      test_glist_return_transfer_full;
    Alcotest.test_case "GSList return transfer-none: no g_slist_free" `Quick
      test_gslist_return_transfer_none;
  ]
