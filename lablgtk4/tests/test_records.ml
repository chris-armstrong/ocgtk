open Alcotest

external alloc_border : unit -> Obj.t = "ml_test_alloc_border"
external alloc_requisition : unit -> Obj.t = "ml_test_alloc_requisition"
external alloc_tree_iter : unit -> Obj.t = "ml_test_alloc_tree_iter"
external alloc_text_iter : unit -> Obj.t = "ml_test_alloc_text_iter"
external alloc_bitset_iter : unit -> Obj.t = "ml_test_alloc_bitset_iter"

external reset_counters : unit -> unit = "ml_test_reset_record_counters"
external finalized_border : unit -> int = "ml_test_get_finalized_border"
external finalized_requisition : unit -> int = "ml_test_get_finalized_requisition"
external finalized_tree_iter : unit -> int = "ml_test_get_finalized_tree_iter"
external finalized_text_iter : unit -> int = "ml_test_get_finalized_text_iter"
external finalized_bitset_iter : unit -> int = "ml_test_get_finalized_bitset_iter"

let spin_collect ?(max_attempts = 10) expected counter =
  let rec loop attempts =
    Gc.full_major ();
    Gc.compact ();
    let seen = counter () in
    if seen >= expected || attempts = 0 then seen else loop (pred attempts)
  in
  loop max_attempts

let finalize_test name alloc counter =
  let n = 256 in
  let () =
    let values = Array.init n (fun _ -> alloc ()) in
    Sys.opaque_identity values |> ignore
  in
  let finalized = spin_collect n counter in
  check int (name ^ " finalized") n finalized

let test_suite () =
  reset_counters ();
  finalize_test "GtkBorder" alloc_border finalized_border;
  finalize_test "GtkRequisition" alloc_requisition finalized_requisition;
  finalize_test "GtkTreeIter" alloc_tree_iter finalized_tree_iter;
  finalize_test "GtkTextIter" alloc_text_iter finalized_text_iter;
  finalize_test "GtkBitsetIter" alloc_bitset_iter finalized_bitset_iter

let () = run "GIR record finalizers" [ ("finalizers", [ test_case "gc frees records" `Quick test_suite ]) ]
