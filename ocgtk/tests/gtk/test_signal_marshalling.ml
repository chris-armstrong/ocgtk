(** Runtime tests for the closure-marshal path in [ml_closure_marshal].

    Exercises multi-param dispatch, enum/flags dispatch, return copy-back,
    exception escape, and GC interaction via the [Gobject_test_helpers] helpers.
*)

open Alcotest
module Closure = Gobject.Closure
module Value = Gobject.Value
module Helpers = Gobject_test_helpers

(** {2 M1: multi-param dispatch with bool return (true)} *)

let test_mixed_params_bool_return_true () =
  let btn_obj = Ocgtk_gtk.Gtk.Wrappers.Button.new_ () in
  let int_captured = ref 0 in
  let str_captured = ref "" in
  let obj_captured = ref None in
  let closure =
    Closure.create (fun argv ->
        int_captured := Value.get_int (Closure.nth argv ~pos:0);
        str_captured := Value.get_string (Closure.nth argv ~pos:1);
        obj_captured := Value.get_object (Closure.nth argv ~pos:2);
        Value.set_boolean (Closure.result argv) true)
  in
  let result =
    Helpers.invoke_closure_mixed_return_bool closure 42 "hello" (Some btn_obj)
  in
  check bool "return value is true" true result;
  check int "int arg captured" 42 !int_captured;
  check string "string arg captured" "hello" !str_captured;
  check bool "obj arg captured as Some" true
    (match !obj_captured with Some _ -> true | None -> false)

(** {2 M2: multi-param dispatch with bool return (false)} *)

let test_mixed_params_bool_return_false () =
  let btn_obj = Ocgtk_gtk.Gtk.Wrappers.Button.new_ () in
  let closure =
    Closure.create (fun argv -> Value.set_boolean (Closure.result argv) false)
  in
  let result =
    Helpers.invoke_closure_mixed_return_bool closure 99 "world" (Some btn_obj)
  in
  check bool "return value is false" false result

(** {2 M3: void return with 0 params} *)

let test_void_return_0_params () =
  let called = ref false in
  let closure = Closure.create (fun _argv -> called := true) in
  Helpers.invoke_closure_void closure;
  check bool "closure was invoked" true !called

(** {2 M5: nullable GObject param} *)

let test_null_gobject_param () =
  let obj_captured = ref None in
  let closure =
    Closure.create (fun argv ->
        obj_captured := Value.get_object (Closure.nth argv ~pos:2);
        Value.set_boolean (Closure.result argv) true)
  in
  let result = Helpers.invoke_closure_mixed_return_bool closure 0 "" None in
  check bool "return value is true" true result;
  check bool "null object passed as None" true
    (match !obj_captured with None -> true | Some _ -> false)

(** {2 M5b: non-null GObject param preserves identity} *)

let test_non_null_gobject_param () =
  let btn_obj = Ocgtk_gtk.Gtk.Wrappers.Button.new_ () in
  let obj_captured = ref None in
  let closure =
    Closure.create (fun argv ->
        obj_captured := Value.get_object (Closure.nth argv ~pos:2);
        Value.set_boolean (Closure.result argv) true)
  in
  let result =
    Helpers.invoke_closure_mixed_return_bool closure 0 "test" (Some btn_obj)
  in
  check bool "return value is true" true result;
  check bool "non-null object received as Some" true
    (match !obj_captured with Some _ -> true | None -> false);
  check bool "object identity preserved via Gobject.same" true
    (match !obj_captured with
    | Some obj -> Gobject.same obj btn_obj
    | None -> false)

(** {2 M4: exception escape} *)

let test_exception_escape () =
  Helpers.reset_closure_exception_flag ();
  let closure =
    Closure.create (fun _argv -> raise (Failure "test exception"))
  in
  Helpers.invoke_closure_void closure;
  check bool "exception flag is set after escape" true
    (Helpers.check_closure_exception_flag ())

(** {2 M8: int return copy-back} *)

let test_int_return () =
  let closure =
    Closure.create (fun argv -> Value.set_int (Closure.result argv) 99)
  in
  let result = Helpers.invoke_closure_return_int closure in
  check int "int return is 99" 99 result

(** {2 M9: flags dispatch} *)

type test_flags = A | B | AB

let test_flags_of_int n =
  let flags = ref [] in
  if n land 1 <> 0 then flags := A :: !flags;
  if n land 2 <> 0 then flags := B :: !flags;
  (* Bit pattern 3 means bits 0 and 1 are set, representing A and B *)
  if n land 3 = 3 then flags := AB :: !flags;
  List.sort Stdlib.compare !flags

let test_flags_dispatch () =
  let flags_captured = ref [] in
  let closure =
    Closure.create (fun argv ->
        flags_captured :=
          test_flags_of_int (Value.get_flags_int (Closure.nth argv ~pos:0));
        Value.set_boolean (Closure.result argv) true)
  in
  let result = Helpers.invoke_closure_flags_return_bool closure 3 in
  check bool "return value is true" true result;
  let expected = List.sort Stdlib.compare [ A; B; AB ] in
  check int "flags list length" (List.length expected)
    (List.length !flags_captured)

(** {2 M6: GC safety} *)

let test_gc_safety () =
  let errors = ref 0 in
  let closures =
    Array.init 50 (fun i ->
        let expected = i + 1 in
        Closure.create (fun argv ->
            Value.set_int (Closure.result argv) expected))
  in
  Array.iteri
    (fun i closure ->
      let result = Helpers.invoke_closure_return_int closure in
      let expected = i + 1 in
      if Int.equal result expected |> not then errors := !errors + 1;
      if (i + 1) mod 10 = 0 then Gc.minor ())
    closures;
  Gc.minor ();
  Array.iteri
    (fun i closure ->
      let result = Helpers.invoke_closure_return_int closure in
      let expected = i + 1 in
      if Int.equal result expected |> not then errors := !errors + 1)
    closures;
  check int "no errors during GC" 0 !errors

let require_gtk = Gtk_test_helpers.require_gtk

let () =
  run "Signal Marshalling"
    [
      ( "multi_param",
        [
          test_case "mixed params bool return true" `Quick
            (require_gtk test_mixed_params_bool_return_true);
          test_case "mixed params bool return false" `Quick
            (require_gtk test_mixed_params_bool_return_false);
        ] );
      ( "void_and_nullable",
        [
          test_case "void return 0 params" `Quick
            (require_gtk test_void_return_0_params);
          test_case "null gobject param" `Quick
            (require_gtk test_null_gobject_param);
          test_case "non-null gobject param preserves identity" `Quick
            (require_gtk test_non_null_gobject_param);
        ] );
      ( "exception",
        [
          test_case "exception escape sets flag" `Quick
            (require_gtk test_exception_escape);
        ] );
      ( "flags",
        [ test_case "flags dispatch" `Quick (require_gtk test_flags_dispatch) ]
      );
      ( "int_return",
        [
          test_case "int return copy-back" `Quick (require_gtk test_int_return);
        ] );
      ("gc", [ test_case "gc safety" `Quick (require_gtk test_gc_safety) ]);
    ]
