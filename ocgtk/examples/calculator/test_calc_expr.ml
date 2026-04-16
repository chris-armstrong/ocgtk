(** Unit tests for calc_expr.ml using Alcotest

    Run with: dune runtest examples/calculator *)

open Containers
open Calc_core
open Calc_expr

(* Alcotest testable for float with tolerance *)
let float_eq ~eps a b = Float.(abs (a -. b) < eps)

let testable_float =
  Alcotest.testable
    (fun fmt f -> Format.fprintf fmt "%f" f)
    (float_eq ~eps:0.0001)

(* Helper to check Ok result *)
let check_ok expected s =
  match evaluate s with
  | Ok v -> v
  | Error msg ->
      Alcotest.fail
        (Printf.sprintf "Expected Ok %f for '%s' but got Error: %s" expected s
           msg)

(* Helper to check Error result *)
let check_error s =
  match evaluate s with
  | Ok v ->
      Alcotest.fail (Printf.sprintf "Expected Error for '%s' but got Ok %f" s v)
  | Error _ -> ()

(* Basic arithmetic tests *)
let test_basic_addition () =
  Alcotest.(check testable_float) "2+3" 5.0 (check_ok 5.0 "2+3");
  Alcotest.(check testable_float) "5+5" 10.0 (check_ok 10.0 "5+5");
  Alcotest.(check testable_float) "0+1" 1.0 (check_ok 1.0 "0+1")

let test_basic_subtraction () =
  Alcotest.(check testable_float) "5-2" 3.0 (check_ok 3.0 "5-2");
  Alcotest.(check testable_float) "5-5" 0.0 (check_ok 0.0 "5-5");
  Alcotest.(check testable_float) "2-3" (-1.0) (check_ok (-1.0) "2-3")

let test_basic_multiplication () =
  Alcotest.(check testable_float) "2*3" 6.0 (check_ok 6.0 "2*3");
  Alcotest.(check testable_float) "0*5" 0.0 (check_ok 0.0 "0*5");
  Alcotest.(check testable_float) "3*5" 15.0 (check_ok 15.0 "3*5")

let test_basic_division () =
  Alcotest.(check testable_float) "6/3" 2.0 (check_ok 2.0 "6/3");
  Alcotest.(check testable_float) "5/2" 2.5 (check_ok 2.5 "5/2");
  Alcotest.(check testable_float) "1/2" 0.5 (check_ok 0.5 "1/2")

(* Operator precedence *)
let test_precedence () =
  Alcotest.(check testable_float) "2+3*4" 14.0 (check_ok 14.0 "2+3*4");
  Alcotest.(check testable_float) "2*3+4" 10.0 (check_ok 10.0 "2*3+4");
  Alcotest.(check testable_float) "10-2*3" 4.0 (check_ok 4.0 "10-2*3");
  Alcotest.(check testable_float) "12/2-0" 6.0 (check_ok 6.0 "12/2-0");
  Alcotest.(check testable_float) "8/2*3" 12.0 (check_ok 12.0 "8/2*3");
  Alcotest.(check testable_float) "2+3*4-4" 10.0 (check_ok 10.0 "2+3*4-4")

(* Parentheses *)
let test_parentheses () =
  Alcotest.(check testable_float) "(2+3)*4" 20.0 (check_ok 20.0 "(2+3)*4");
  Alcotest.(check testable_float) "2*(3+4)-4" 10.0 (check_ok 10.0 "2*(3+4)-4");
  Alcotest.(check testable_float) "((2+3))" 5.0 (check_ok 5.0 "((2+3))");
  Alcotest.(check testable_float) "(8)" 8.0 (check_ok 8.0 "(8)");
  Alcotest.(check testable_float) "((2+2))" 4.0 (check_ok 4.0 "((2+2))")

(* Auto-close parentheses *)
let test_auto_close_parens () =
  Alcotest.(check testable_float) "2*(3+4" 14.0 (check_ok 14.0 "2*(3+4");
  Alcotest.(check testable_float) "(2+3*2" 8.0 (check_ok 8.0 "(2+3*2");
  Alcotest.(check testable_float) "(2+3)*4" 20.0 (check_ok 20.0 "(2+3)*4")

(* Division by zero *)
let test_division_by_zero () =
  check_error "10/0";
  check_error "5/(2-2)";
  check_error "1/0.0"

(* Empty and invalid expressions *)
let test_empty_expression () =
  check_error "";
  check_error "   ";
  check_error "+"

(* Invalid auto-close *)
let test_invalid_auto_close () =
  check_error "2*(3+";
  check_error "(2+3*)";
  check_error "2*("

(* Decimals *)
let test_decimals () =
  Alcotest.(check testable_float) "3.14*2" 6.28 (check_ok 6.28 "3.14*2");
  Alcotest.(check testable_float) "0.5" 0.5 (check_ok 0.5 "0.5");
  Alcotest.(check testable_float) "0.5*2" 1.0 (check_ok 1.0 "0.5*2");
  Alcotest.(check testable_float) "1.1+2.2" 3.3 (check_ok 3.3 "1.1+2.2")

(* Whitespace tolerance *)
let test_whitespace () =
  Alcotest.(check testable_float) "  2 + 3  " 5.0 (check_ok 5.0 "  2 + 3  ");
  Alcotest.(check testable_float) "2 +3" 5.0 (check_ok 5.0 "2 +3");
  Alcotest.(check testable_float) "2+ 3" 5.0 (check_ok 5.0 "2+ 3");
  Alcotest.(check testable_float)
    " 2 + 3 * 4 " 14.0
    (check_ok 14.0 " 2 + 3 * 4 ")

(* Negative numbers *)
let test_negative_numbers () =
  Alcotest.(check testable_float) "-5" (-5.0) (check_ok (-5.0) "-5");
  Alcotest.(check testable_float) "2+(-5)" (-3.0) (check_ok (-3.0) "2+(-5)");
  Alcotest.(check testable_float) "5+(-2)" 3.0 (check_ok 3.0 "5+(-2)");
  Alcotest.(check testable_float) "-2*-3" 6.0 (check_ok 6.0 "-2*-3")

(* Edge cases *)
let test_edge_cases () =
  Alcotest.(check testable_float) "0" 0.0 (check_ok 0.0 "0");
  Alcotest.(check testable_float) "0+0" 0.0 (check_ok 0.0 "0+0");
  Alcotest.(check testable_float) "1" 1.0 (check_ok 1.0 "1");
  Alcotest.(check testable_float) "100" 100.0 (check_ok 100.0 "100");
  Alcotest.(check testable_float) "1000/1" 1000.0 (check_ok 1000.0 "1000/1")

(* Format result tests *)
let test_format_result () =
  Alcotest.(check string) "integer" "5" (format_result (Ok 5.0));
  Alcotest.(check string) "decimal" "5.5" (format_result (Ok 5.5));
  Alcotest.(check string) "zero" "0" (format_result (Ok 0.0));
  Alcotest.(check string) "error" "Error" (format_result (Error "test"));
  Alcotest.(check string) "pi" "3.14159" (format_result (Ok 3.14159))

(* Incomplete expression detection *)
let test_incomplete_expression () =
  Alcotest.(check bool) "empty" true (is_incomplete_expression "");
  Alcotest.(check bool) "whitespace only" true (is_incomplete_expression "   ");
  Alcotest.(check bool) "ends with +" true (is_incomplete_expression "2+");
  Alcotest.(check bool) "ends with *" true (is_incomplete_expression "2*");
  Alcotest.(check bool) "complete number" false (is_incomplete_expression "2");
  Alcotest.(check bool) "complete expr" false (is_incomplete_expression "2+3")

(* Get display text *)
let test_get_display_text () =
  Alcotest.(check string) "empty" "0" (get_display_text "");
  Alcotest.(check string) "whitespace" "0" (get_display_text "   ");
  Alcotest.(check string) "expression" "2+3" (get_display_text "2+3")

(* Multiple unclosed parentheses *)
let test_multiple_unclosed_parens () =
  Alcotest.(check testable_float) "((2+3" 5.0 (check_ok 5.0 "((2+3");
  Alcotest.(check testable_float) "(((1+2)+3" 6.0 (check_ok 6.0 "(((1+2)+3");
  Alcotest.(check testable_float) "(2*(3+4" 14.0 (check_ok 14.0 "(2*(3+4")

(* Deeply nested expressions *)
let test_deeply_nested () =
  Alcotest.(check testable_float)
    "3 levels" 9.0
    (check_ok 9.0 "((1+2)+(3+4))-1");
  Alcotest.(check testable_float)
    "4 levels" 10.0
    (check_ok 10.0 "(((1+2)+3)+4)");
  Alcotest.(check testable_float)
    "mixed" 21.0
    (check_ok 21.0 "(1+(2+(3+(4+5+6))))")

(* Safe evaluate - catches exceptions *)
let test_safe_evaluate () =
  Alcotest.(check testable_float)
    "valid expr" 5.0
    (match safe_evaluate "2+3" with
    | Ok v -> v
    | Error _ -> Alcotest.fail "should succeed");
  Alcotest.(check testable_float)
    "auto-close" 14.0
    (match safe_evaluate "2*(3+4" with
    | Ok v -> v
    | Error _ -> Alcotest.fail "should auto-close");
  check_error ""

(* Test suite *)
let () =
  Alcotest.run "calc_expr"
    [
      ( "basic-addition",
        [ Alcotest.test_case "basic addition" `Quick test_basic_addition ] );
      ( "basic-subtraction",
        [ Alcotest.test_case "basic subtraction" `Quick test_basic_subtraction ]
      );
      ( "basic-multiplication",
        [
          Alcotest.test_case "basic multiplication" `Quick
            test_basic_multiplication;
        ] );
      ( "basic-division",
        [ Alcotest.test_case "basic division" `Quick test_basic_division ] );
      ( "operator-precedence",
        [ Alcotest.test_case "operator precedence" `Quick test_precedence ] );
      ( "parentheses",
        [ Alcotest.test_case "parentheses" `Quick test_parentheses ] );
      ( "auto-close-parens",
        [
          Alcotest.test_case "auto-close parentheses" `Quick
            test_auto_close_parens;
        ] );
      ( "division-by-zero",
        [ Alcotest.test_case "division by zero" `Quick test_division_by_zero ]
      );
      ( "empty-expression",
        [ Alcotest.test_case "empty expression" `Quick test_empty_expression ]
      );
      ( "invalid-auto-close",
        [
          Alcotest.test_case "invalid auto-close" `Quick test_invalid_auto_close;
        ] );
      ("decimals", [ Alcotest.test_case "decimals" `Quick test_decimals ]);
      ( "whitespace",
        [ Alcotest.test_case "whitespace tolerance" `Quick test_whitespace ] );
      ( "negative-numbers",
        [ Alcotest.test_case "negative numbers" `Quick test_negative_numbers ]
      );
      ("edge-cases", [ Alcotest.test_case "edge cases" `Quick test_edge_cases ]);
      ( "format-result",
        [ Alcotest.test_case "format result" `Quick test_format_result ] );
      ( "incomplete-expression",
        [
          Alcotest.test_case "incomplete expression" `Quick
            test_incomplete_expression;
        ] );
      ( "get-display-text",
        [ Alcotest.test_case "get display text" `Quick test_get_display_text ]
      );
      ( "multiple-unclosed-parens",
        [
          Alcotest.test_case "multiple unclosed parens" `Quick
            test_multiple_unclosed_parens;
        ] );
      ( "deeply-nested",
        [
          Alcotest.test_case "deeply nested expressions" `Quick
            test_deeply_nested;
        ] );
      ( "safe-evaluate",
        [ Alcotest.test_case "safe evaluate" `Quick test_safe_evaluate ] );
    ]
