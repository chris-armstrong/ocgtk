(** Runtime tests for [Tree_path.get_indices_with_depth].

    This function was broken prior to phase-5 of the value-kinds-registry plan:
    the C stub returned a bare [int array] where OCaml expected
    [int array option], so calling [Array.length] on the result crashed. The fix
    regenerates the C stub with a NULL guard that returns [Val_none] /
    [Val_some] as required. *)

open Alcotest
open Ocgtk_gtk.Gtk
module Helpers = Gtk_test_helpers

let require_gtk = Helpers.require_gtk

(* Layer 1 bindings used in tests *)
let path_new = Wrappers.Tree_path.new_
let path_append = Wrappers.Tree_path.append_index
let get_indices_with_depth = Wrappers.Tree_path.get_indices_with_depth

(* ========== Empty path: expect (None, 0) ========== *)

(** A freshly allocated [GtkTreePath] has depth 0 and no indices. The C function
    [gtk_tree_path_get_indices_with_depth] returns NULL when the path is empty.
    After the fix the stub wraps that as [Val_none], so the OCaml caller
    receives [(None, 0)]. *)
let test_get_indices_with_depth_empty_path_returns_none () =
  let path = path_new () in
  let arr_opt, depth = get_indices_with_depth path in
  check int "empty path depth is 0" 0 depth;
  match arr_opt with
  | None -> ()
  | Some arr ->
      fail
        (Printf.sprintf
           "expected None for empty path but got Some(array of length %d)"
           (Array.length arr))

(* ========== Non-empty path: expect (Some [|i0; i1; ...|], depth) ========== *)

(** Append known indices to a path and verify that [get_indices_with_depth]
    returns [(Some arr, depth)] where [arr] reproduces the appended values and
    [depth] matches the number of components. *)
let test_get_indices_with_depth_non_empty_path_returns_some_array () =
  let path = path_new () in
  let expected = [| 3; 7; 11 |] in
  Array.iter (path_append path) expected;
  let arr_opt, depth = get_indices_with_depth path in
  check int "depth equals appended component count" (Array.length expected)
    depth;
  match arr_opt with
  | None -> fail "expected Some array for non-empty path but got None"
  | Some arr ->
      check int "array length matches depth" depth (Array.length arr);
      Array.iteri
        (fun i v ->
          check int
            (Printf.sprintf "arr[%d] = %d" i expected.(i))
            expected.(i) v)
        arr

(* ========== Test Suite ========== *)

let () =
  run "GtkTreePath get_indices_with_depth"
    [
      ( "Empty path",
        [
          test_case "empty path returns (None, 0)" `Quick
            (require_gtk test_get_indices_with_depth_empty_path_returns_none);
        ] );
      ( "Non-empty path",
        [
          test_case "non-empty path returns (Some array, depth)" `Quick
            (require_gtk
               test_get_indices_with_depth_non_empty_path_returns_some_array);
        ] );
    ]
