open Containers
(** Expression tokenizer, parser, and evaluator

    Pure OCaml - no GTK dependency. Supports:
    - Tokenization of numbers, operators (+, -, *, /), parentheses
    - Recursive descent parser with correct operator precedence
    - Evaluation with parenthesis auto-close logic
    - Error handling for division by zero, malformed expressions *)

type token =
  | Number of float
  | Plus
  | Minus
  | Multiply
  | Divide
  | LParen
  | RParen
  | EOF
[@@deriving eq]

exception Parse_error of string

(* Tokenizer *)
let rec tokenize s pos =
  if pos >= String.length s then [ EOF ]
  else
    match s.[pos] with
    | ' ' | '\t' | '\n' | '\r' -> tokenize s (pos + 1)
    | '+' -> Plus :: tokenize s (pos + 1)
    | '-' -> Minus :: tokenize s (pos + 1)
    | '*' -> Multiply :: tokenize s (pos + 1)
    | '/' -> Divide :: tokenize s (pos + 1)
    | '(' -> LParen :: tokenize s (pos + 1)
    | ')' -> RParen :: tokenize s (pos + 1)
    | '0' .. '9' | '.' -> (
        let start = pos in
        let rec read_number i =
          if i >= String.length s then i
          else
            match s.[i] with '0' .. '9' | '.' -> read_number (i + 1) | _ -> i
        in
        let end_pos = read_number pos in
        let num_str = String.sub s start (end_pos - start) in
        match float_of_string_opt num_str with
        | Some f -> Number f :: tokenize s end_pos
        | None -> raise (Parse_error ("Invalid number: " ^ num_str)))
    | c -> raise (Parse_error (Printf.sprintf "Unexpected character: %c" c))

(* Parser - recursive descent with precedence
   Grammar:
   expr     := term ((+|-) term)*
   term     := factor (({|*|}|/) factor)*
   factor   := number | '(' expr ')' | (-) factor
*)

type expr =
  | Num of float
  | Add of expr * expr
  | Sub of expr * expr
  | Mul of expr * expr
  | Div of expr * expr
  | Neg of expr

let parse tokens =
  (* Convert to array for O(1) indexed access - avoids banned List.nth *)
  let tokens_arr = Array.of_list tokens in
  let len = Array.length tokens_arr in
  let pos = ref 0 in
  let current () = if !pos < len then tokens_arr.(!pos) else EOF in
  let advance () = pos := !pos + 1 in
  let expect token_type =
    if equal_token (current ()) token_type then advance ()
    else raise (Parse_error "Unexpected token")
  in

  let rec parse_expr () =
    let rec loop left =
      match current () with
      | Plus ->
          advance ();
          let right = parse_term () in
          loop (Add (left, right))
      | Minus ->
          advance ();
          let right = parse_term () in
          loop (Sub (left, right))
      | _ -> left
    in
    loop (parse_term ())
  and parse_term () =
    let rec loop left =
      match current () with
      | Multiply ->
          advance ();
          let right = parse_factor () in
          loop (Mul (left, right))
      | Divide ->
          advance ();
          let right = parse_factor () in
          loop (Div (left, right))
      | _ -> left
    in
    loop (parse_factor ())
  and parse_factor () =
    let tok = current () in
    match tok with
    | Number n ->
        advance ();
        Num n
    | LParen -> (
        advance ();
        let expr = parse_expr () in
        let after_expr = current () in
        match after_expr with
        | RParen ->
            advance ();
            expr
        | _ ->
            (* Unclosed paren - check if auto-close is valid *)
            let next = current () in
            if
              equal_token next EOF || equal_token next Plus
              || equal_token next Minus || equal_token next Multiply
              || equal_token next Divide
            then
              (* Valid to auto-close here *)
              expr
            else
              raise (Parse_error "Invalid position for parenthesis auto-close"))
    | Minus ->
        advance ();
        Neg (parse_factor ())
    | _ -> raise (Parse_error "Unexpected token")
  in

  let ast = parse_expr () in
  expect EOF;
  ast

(* Evaluate expression AST using Result bind operators for cleaner code *)
let rec eval_expr expr =
  let ( let* ) = Result.bind in
  match expr with
  | Num n -> Ok n
  | Add (l, r) ->
      let* lv = eval_expr l in
      let* rv = eval_expr r in
      Ok (lv +. rv)
  | Sub (l, r) ->
      let* lv = eval_expr l in
      let* rv = eval_expr r in
      Ok (lv -. rv)
  | Mul (l, r) ->
      let* lv = eval_expr l in
      let* rv = eval_expr r in
      Ok (lv *. rv)
  | Div (l, r) ->
      let* lv = eval_expr l in
      let* rv = eval_expr r in
      if Float.equal rv 0.0 then Error "Division by zero" else Ok (lv /. rv)
  | Neg e ->
      let* v = eval_expr e in
      Ok ~-.v

(* Main evaluation function *)
(* The parser handles auto-closing unclosed parentheses directly:
   when it encounters EOF instead of RParen after a valid sub-expression,
   it auto-closes. Invalid positions (e.g. "2*(3+") raise Parse_error. *)
let evaluate s =
  if String.equal (String.trim s) "" then Error "Empty expression"
  else
    try
      let tokens = tokenize s 0 in
      let ast = parse tokens in
      eval_expr ast
    with
    | Parse_error msg -> Error msg
    | Failure msg -> Error msg

(* Safe evaluation that catches all exceptions *)
let safe_evaluate s =
  try evaluate s
  with exn ->
    Error (Printf.sprintf "Evaluation error: %s" (Printexc.to_string exn))

(* Convenience function to format result *)
let format_result = function
  | Ok n ->
      let s = string_of_float n in
      (* Remove trailing .0 for integers *)
      if String.ends_with ~suffix:"." s then String.sub s 0 (String.length s - 1)
      else if String.ends_with ~suffix:".0" s then
        String.sub s 0 (String.length s - 2)
      else s
  | Error _ -> "Error"

(* Helper to check if expression ends with incomplete operator *)
let is_incomplete_expression s =
  let trimmed = String.trim s in
  if String.is_empty trimmed then true
  else
    let last_char = trimmed.[String.length trimmed - 1] in
    match last_char with '+' | '-' | '*' | '/' -> true | _ -> false

(* Get display text for incomplete expressions *)
let get_display_text expr =
  let trimmed = String.trim expr in
  if String.is_empty trimmed then "0" else trimmed
