(* CLI interface tests *)

open Printf
open Helpers

(* ========================================================================= *)
(* Test Cases *)
(* ========================================================================= *)

let test_help_output () =
  let tools_dir = get_tools_dir () in
  let cmd = sprintf "%s/gir_gen/gir_gen.exe generate --help 2>&1" tools_dir in
  let ic = Unix.open_process_in cmd in
  let output = Buffer.create 1024 in
  (try
     while true do
       Buffer.add_string output (input_line ic);
       Buffer.add_char output '\n'
     done
   with End_of_file -> ());
  let _ = Unix.close_process_in ic in
  let help_text = Buffer.contents output in
  assert_contains "Help should mention filter option" help_text "--filter";
  assert_contains "Help should mention GIR_FILE argument" help_text "GIR_FILE";
  assert_contains "Help should show examples" help_text "EXAMPLES"

(* ========================================================================= *)
(* Test Suite *)
(* ========================================================================= *)

let tests = [ Alcotest.test_case "Help output" `Quick test_help_output ]
