(** Calculator state machine

    Manages the current expression, result display, and error state. Handles
    input validation and delegates expression evaluation to Calc_expr. *)

type t = {
  expression : string;
  result : string;
  error : bool;
  just_evaluated : bool;
}

let create () =
  { expression = ""; result = "0"; error = false; just_evaluated = false }

(** Check if a character is an operator. *)
let is_operator = function '+' | '-' | '*' | '/' -> true | _ -> false

(** Check if a character is a valid expression character. *)
let is_valid_char = function
  | '0' .. '9' | '+' | '-' | '*' | '/' | '.' | '(' | ')' -> true
  | _ -> false

(** Get the last character of a string, if any. *)
let last_char_opt s =
  if String.equal s "" then None else Some s.[String.length s - 1]

(** Check if the current number token (after the last operator/paren) already
    contains a decimal point. Prevents inputs like 1.2.3. *)
let has_decimal_in_current_number expr =
  let len = String.length expr in
  let rec find_start i =
    if i < 0 then 0
    else
      match expr.[i] with
      | '+' | '-' | '*' | '/' | '(' -> i + 1
      | _ -> find_start (i - 1)
  in
  let start = find_start (len - 1) in
  String.contains (String.sub expr start (len - start)) '.'

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
    | _, '.' when has_decimal_in_current_number t.expression ->
        (* Prevent a second decimal in the same number token. *)
        Some "Decimal already in current number"
    | Some _last_c, ('0' .. '9' | '(' | ')' | '.') -> None
    | Some _, ('+' | '-' | '*' | '/') -> None
    | _ -> None

let append_char t c =
  (* After evaluate: digits/decimal/parens start fresh, operators chain *)
  let t =
    if t.just_evaluated then
      if is_operator c then { t with just_evaluated = false }
      else { t with expression = ""; just_evaluated = false }
    else t
  in
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
    if String.equal trimmed "" then { t with result = "0" }
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
          if error then
            { t with result = result_str; error; just_evaluated = false }
          else
            {
              expression = result_str;
              result = result_str;
              error;
              just_evaluated = true;
            }

let get_expression t = t.expression
let get_result t = t.result
let is_error t = t.error
let is_empty t = String.equal t.expression ""

(** Get the display text for the expression row. Returns the expression or "0"
    if empty. *)
let get_expression_display t =
  if String.equal t.expression "" then "0" else t.expression

(** Get the display text for the result row. Returns the result or "0" if
    empty/no evaluation yet. *)
let get_result_display t = if is_error t then "Error" else t.result
