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

let[@warning "-32"] string_of_token = function
  | Number f -> Printf.sprintf "Number(%.2f)" f
  | Plus -> "Plus"
  | Minus -> "Minus"
  | Multiply -> "Multiply"
  | Divide -> "Divide"
  | LParen -> "LParen"
  | RParen -> "RParen"
  | EOF -> "EOF"

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
        try
          let f = float_of_string num_str in
          Number f :: tokenize s end_pos
        with Failure _ -> raise (Parse_error ("Invalid number: " ^ num_str)))
    | c -> raise (Parse_error (Printf.sprintf "Unexpected character: %c" c))

let[@warning "-32"] tokenize_string s =
  try Ok (tokenize s 0) with Parse_error msg -> Error msg

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
    | _ ->
        raise (Parse_error "Unexpected token")
  in

  let ast = parse_expr () in
  expect EOF;
  ast

(* Check if auto-closing parentheses is valid at end of expression *)
let can_auto_close_parens tokens =
  let rec count_parens count tokens =
    match tokens with
    | [] -> count
    | LParen :: rest -> count_parens (count + 1) rest
    | RParen :: rest -> count_parens (count - 1) rest
    | _ :: rest -> count_parens count rest
  in
  let unclosed = count_parens 0 tokens in
  if unclosed <= 0 then Ok tokens (* No unclosed parens or already balanced *)
  else
    (* Check if we can auto-close *)
    let rec find_unclosed_pos count pos tokens =
      match tokens with
      | [] -> pos
      | LParen :: rest -> find_unclosed_pos (count + 1) (pos + 1) rest
      | RParen :: rest -> find_unclosed_pos (count - 1) (pos + 1) rest
      | _ :: rest -> find_unclosed_pos count (pos + 1) rest
    in
    let unclosed_pos = find_unclosed_pos 0 0 tokens in
    (* Check if position is valid for closing paren *)
    (* A paren can be closed after a number or a closing paren *)
    let rec check_valid_after pos tokens =
      match tokens with
      | [] -> false
      | _ :: rest when pos > 1 -> check_valid_after (pos - 1) rest
      | token :: _ when pos = 1 -> (
          match token with Number _ | RParen -> true | _ -> false)
      | _ -> false
    in
    if check_valid_after unclosed_pos tokens then
      (* Add closing parens *)
      let rec add_parens n tokens =
        if n = 0 then tokens else add_parens (n - 1) (tokens @ [ RParen ])
      in
      Ok (add_parens unclosed tokens)
    else Error "Cannot auto-close parentheses: invalid expression"

(* Evaluate expression AST using Result bind operators for cleaner code *)
let rec eval_expr expr =
  let open Result.Syntax in
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
      Ok (~-.v)

(* Main evaluation function *)
let evaluate s =
  if String.equal (String.trim s) "" then Error "Empty expression"
  else
    try
      let tokens = tokenize s 0 in
      (* Remove EOF for auto-close check *)
      let tokens_no_eof =
        List.filter (fun t -> not (equal_token t EOF)) tokens
      in
      (* Check and apply auto-close if needed *)
      match can_auto_close_parens tokens_no_eof with
      | Error e -> Error e
      | Ok tokens_with_parens ->
          (* Add EOF back *)
          let final_tokens = tokens_with_parens @ [ EOF ] in
          let ast = parse final_tokens in
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
