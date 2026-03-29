open Containers
(** Calculator state machine

    Manages the current expression, result display, and error state.
    Handles input validation and delegates expression evaluation to Calc_expr. *)

type t = {
  expression : string;
  result : string;
  error : bool;
}

let create () = { expression = ""; result = "0"; error = false }

(** Check if a character is an operator. *)
let is_operator = function '+' | '-' | '*' | '/' -> true | _ -> false

(** Check if a character is a digit. *)
let is_digit = function '0' .. '9' -> true | _ -> false

(** Check if a character is a valid expression character. *)
let is_valid_char c =
  let open Char in
  is_digit c || is_operator c || equal c '.' || equal c '(' || equal c ')'

(** Get the last character of a string, if any. *)
let last_char_opt s =
  if String.is_empty s then None else Some s.[String.length s - 1]

(** Check if character is a closing parenthesis. *)
let is_rparen = function ')' -> true | _ -> false

(** Validate if we can append the given character to the current expression.
    Returns Some error_message if invalid, None if valid. *)
let validate_append t c =
  if t.error then
    (* After error, only clear is allowed. *)
    Some "Error state - clear required"
  else if not (is_valid_char c) then
    (* Invalid character for calculator. *)
    Some "Invalid character"
  else
    let last = last_char_opt t.expression in
    match (last, c) with
    | None, ('+' | '*' | '/') ->
        (* Leading operators (except minus) not allowed. *)
        Some "Cannot start with operator"
    | Some last_c, ('+' | '-' | '*' | '/') when is_operator last_c ->
        (* Consecutive operators - replace is allowed, handled in append. *)
        None
    | Some _last_c, ('0' .. '9' | '(' | ')' | '.') -> None
    | Some _, ('+' | '-' | '*' | '/') -> None
    | _ -> None

let append_char t c =
  match validate_append t c with
  | Some _error ->
      (* If invalid, return state unchanged. *)
      t
  | None ->
      let last = last_char_opt t.expression in
      let new_expr =
        match (last, c) with
        | Some last_c, _ when is_operator last_c && is_operator c ->
            (* Replace last operator with new one. *)
            let len = String.length t.expression in
            String.sub t.expression 0 (len - 1) ^ String.make 1 c
        | _ -> t.expression ^ String.make 1 c
      in
      { t with expression = new_expr }

let backspace t =
  if t.error then
    (* In error state, backspace acts like clear. *)
    create ()
  else
    let len = String.length t.expression in
    if len = 0 then t
    else
      let new_expr = String.sub t.expression 0 (len - 1) in
      { t with expression = new_expr }

let clear () = create ()

let evaluate t =
  if t.error then
    (* Already in error state. *)
    t
  else
    let trimmed = String.trim t.expression in
    if String.is_empty trimmed then { t with result = "0" }
    else
      (* Check for incomplete expression (ends with operator). *)
      let last_c = last_char_opt trimmed in
      match last_c with
      | Some c when is_operator c ->
          (* Incomplete expression - don't evaluate. *)
          t
      | _ ->
          (* Evaluate using calc_expr. *)
          let result_str =
            match Calc_expr.safe_evaluate trimmed with
            | Ok n -> Calc_expr.format_result (Ok n)
            | Error _ -> "Error"
          in
          let error = String.equal result_str "Error" in
          if error then { t with result = result_str; error }
          else { expression = result_str; result = result_str; error }

let get_expression t = t.expression

let get_result t = t.result
let is_error t = t.error
let is_empty t = String.is_empty t.expression

(** Get the display text for the expression row.
    Returns the expression or "0" if empty. *)
let get_expression_display t =
  if String.is_empty t.expression then "0" else t.expression

(** Get the display text for the result row.
    Returns the result or "0" if empty/no evaluation yet. *)
let get_result_display t = if is_error t then "Error" else t.result
