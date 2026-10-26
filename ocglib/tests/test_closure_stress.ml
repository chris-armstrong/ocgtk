(* Stress test for closure implementation - verifies GC safety *)

open Alcotest

(** Create many closures without invoking them — exercises GC pressure on
    closure creation without signal dispatch. *)
let test_create_1000_closures () =
  let n = 1000 in
  let closures = ref [] in
  for _i = 1 to n do
    let closure = Gobject.Closure.create (fun _argv -> ()) in
    closures := closure :: !closures
  done;
  check int "created 1000 closures" n (List.length !closures)

(** Create and invoke 500 closures, each incrementing a counter. Exercises the
    closure invocation path end-to-end without GC pressure between iterations.
*)
let test_create_and_invoke_500_closures () =
  let n = 500 in
  let counter = ref 0 in
  for _i = 1 to n do
    let closure = Gobject.Closure.create (fun _argv -> incr counter) in
    Gobject_test_helpers.invoke_closure_void closure
  done;
  check int "invoked 500 closures" n !counter

(** Rapid alloc/drop: 1000 closures go out of scope in batches of 100. No
    explicit GC — exercises the finalizer driven by normal minor/major
    collections. *)
let test_rapid_alloc_drop_1000 () =
  for _round = 1 to 10 do
    for _i = 1 to 100 do
      let _ = Gobject.Closure.create (fun _argv -> ()) in
      ()
    done
  done;
  check pass "completed 1000 allocation/releases" () ()

(** Nested closures with parameters: create 100 closures each taking an int
    parameter, invoke them, and verify the received value matches. *)
let test_nested_closures_with_parameters () =
  let results = ref [] in
  for i = 1 to 100 do
    let expected = i * 2 in
    let closure =
      Gobject.Closure.create (fun argv ->
          let gval = Gobject.Closure.nth argv ~pos:0 in
          let received = Gobject.Value.get_int gval in
          results := (received = expected) :: !results)
    in
    Gobject_test_helpers.invoke_closure_int closure expected
  done;
  let all_correct = List.for_all (fun x -> x) !results in
  check bool "all nested closures received correct parameters" true all_correct

let () =
  run "Closure Stress Test"
    [
      ( "stress",
        [
          test_case "create 1000 closures" `Slow test_create_1000_closures;
          test_case "create and invoke 500 closures" `Slow
            test_create_and_invoke_500_closures;
          test_case "rapid alloc/drop 1000" `Slow test_rapid_alloc_drop_1000;
          test_case "nested closures with parameters" `Slow
            test_nested_closures_with_parameters;
        ] );
    ]
