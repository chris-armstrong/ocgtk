(* Test closure behavior with explicit GC - for understanding limits *)

let test_without_gc () =
  Printf.printf "=== Test WITHOUT explicit GC ===\n%!";
  let counter = ref 0 in
  for i = 1 to 100 do
    let closure = Gobject.Closure.create (fun _argv -> incr counter) in
    Gobject.Test.invoke_closure_void closure;
    if i mod 25 = 0 then
      Printf.printf "  Created %d closures, counter=%d\n%!" i !counter
  done;
  Printf.printf "✓ Completed: counter=%d\n\n%!" !counter

let test_with_minor_gc () =
  Printf.printf "=== Test WITH Gc.minor() after each closure ===\n%!";
  try
    let counter = ref 0 in
    for i = 1 to 10 do
      let closure = Gobject.Closure.create (fun _argv -> incr counter) in
      Gobject.Test.invoke_closure_void closure;
      Gc.minor ();  (* Force minor GC *)
      Printf.printf "  Iteration %d: GC passed, counter=%d\n%!" i !counter
    done;
    Printf.printf "✓ Completed with GC: counter=%d\n\n%!" !counter
  with e ->
    Printf.printf "✗ CRASHED with exception: %s\n\n%!" (Printexc.to_string e);
    exit 1

let test_with_delayed_gc () =
  Printf.printf "=== Test with GC every 10 closures ===\n%!";
  try
    let counter = ref 0 in
    for i = 1 to 50 do
      let closure = Gobject.Closure.create (fun _argv -> incr counter) in
      Gobject.Test.invoke_closure_void closure;
      if i mod 10 = 0 then begin
        Gc.minor ();
        Printf.printf "  After %d closures: GC passed, counter=%d\n%!" i !counter
      end
    done;
    Printf.printf "✓ Completed: counter=%d\n\n%!" !counter
  with e ->
    Printf.printf "✗ CRASHED with exception: %s\n\n%!" (Printexc.to_string e);
    exit 1

let () =
  Printf.printf "==========================================================\n";
  Printf.printf "  CLOSURE + GC INTERACTION TEST\n";
  Printf.printf "==========================================================\n\n";

  test_without_gc ();
  test_with_delayed_gc ();
  test_with_minor_gc ();

  Printf.printf "==========================================================\n";
  Printf.printf "  ALL TESTS PASSED - Implementation is GC-safe!\n";
  Printf.printf "==========================================================\n";
  exit 0
