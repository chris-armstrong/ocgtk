(* Test closure behavior with explicit GC - for understanding limits *)

open Alcotest

(** Create 100 closures without explicit GC between iterations — verifies the
    default finalizer path works. *)
let test_without_gc () =
  let counter = ref 0 in
  for _i = 1 to 100 do
    let closure = Gobject.Closure.create (fun _argv -> incr counter) in
    Gobject.Test.invoke_closure_void closure
  done;
  check int "counter reached 100 without GC" 100 !counter

(** Create 10 closures with [Gc.minor()] after each invocation — exercises the
    finalizer path under GC pressure. *)
let test_with_minor_gc () =
  let counter = ref 0 in
  for _i = 1 to 10 do
    let closure = Gobject.Closure.create (fun _argv -> incr counter) in
    Gobject.Test.invoke_closure_void closure;
    Gc.minor ()
  done;
  check int "counter reached 10 with Gc.minor after each" 10 !counter

(** Create 50 closures with [Gc.minor()] every 10 iterations. *)
let test_with_delayed_gc () =
  let counter = ref 0 in
  for i = 1 to 50 do
    let closure = Gobject.Closure.create (fun _argv -> incr counter) in
    Gobject.Test.invoke_closure_void closure;
    if i mod 10 = 0 then Gc.minor ()
  done;
  check int "counter reached 50 with Gc.minor every 10" 50 !counter

let () =
  run "Closure + GC Interaction Test"
    [
      ( "gc",
        [
          test_case "100 closures without explicit GC" `Quick test_without_gc;
          test_case "10 closures with Gc.minor after each" `Quick
            test_with_minor_gc;
          test_case "50 closures with Gc.minor every 10" `Quick
            test_with_delayed_gc;
        ] );
    ]
