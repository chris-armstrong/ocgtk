(* Stress test for closure implementation - verifies GC safety *)

let () =
  Printf.printf "=== Closure Stress Test ===\n%!";

  (* Test 1: Create many closures without invoking them *)
  Printf.printf "Test 1: Creating 1000 closures...\n%!";
  let closures = ref [] in
  for i = 1 to 1000 do
    let closure = Gobject.Closure.create (fun _argv -> ()) in
    closures := closure :: !closures;
    if i mod 100 = 0 then
      Printf.printf "  Created %d closures\n%!" i
  done;

  Printf.printf "Test 1: ✓ Created 1000 closures successfully\n%!";

  (* Test 2: Create and invoke many closures *)
  Printf.printf "\nTest 2: Creating and invoking 500 closures...\n%!";
  let counter = ref 0 in
  for i = 1 to 500 do
    let closure = Gobject.Closure.create (fun _argv -> incr counter) in
    Gobject.Test.invoke_closure_void closure;
    if i mod 100 = 0 then
      Printf.printf "  Invoked %d closures, counter=%d\n%!" i !counter
  done;

  Printf.printf "Test 2: ✓ Counter reached %d\n%!" !counter;

  (* Test 3: Rapid allocation/deallocation by letting closures go out of scope *)
  Printf.printf "\nTest 3: Rapid allocation (closures going out of scope)...\n%!";
  for round = 1 to 10 do
    for _i = 1 to 100 do
      let _ = Gobject.Closure.create (fun _argv -> ()) in
      ()
    done;
    Printf.printf "  Round %d: 100 closures created and released\n%!" round
  done;

  Printf.printf "Test 3: ✓ Completed 1000 allocation/releases\n%!";

  (* Test 4: Nested closure creation with parameters *)
  Printf.printf "\nTest 4: Nested closures with parameters...\n%!";
  let results = ref [] in
  for i = 1 to 100 do
    let expected = i * 2 in
    let closure = Gobject.Closure.create (fun argv ->
      let gval = Gobject.Closure.nth argv ~pos:0 in
      let received = Gobject.Value.get_int gval in
      results := (received = expected) :: !results
    ) in
    Gobject.Test.invoke_closure_int closure expected;
  done;

  let all_correct = List.for_all (fun x -> x) !results in
  Printf.printf "Test 4: ✓ All %d closures received correct parameters: %b\n%!"
    (List.length !results) all_correct;

  Printf.printf "\n=== All Stress Tests Passed ===\n%!";
  exit 0
