(** Calculator state machine

    Manages the current expression, result display, and error state.
    Handles input validation and delegates expression evaluation to
    {!Calc_expr}. *)

type t
(** Abstract calculator state.

    Invariants:
    - [error = true] blocks all input except {!clear} and {!backspace}
    - After {!evaluate}, expression is set to the result value on success
      so that chained operations (e.g. [2+3=] then [*4=] yields [20]) work *)

val create : unit -> t
(** Initial state: empty expression, result "0", no error. *)

val append_char : t -> char -> t
(** Append a digit, operator, decimal point, or parenthesis.
    Returns state unchanged if:
    - In error state
    - Character is invalid
    - Leading operator other than minus
    Consecutive operators are replaced (last wins). *)

val backspace : t -> t
(** Remove the last character. In error state, acts like {!clear}. *)

val clear : unit -> t
(** Reset to initial state. *)

val evaluate : t -> t
(** Evaluate the current expression.
    Returns state unchanged if expression is incomplete (ends with operator)
    or already in error state. On success, sets both expression and result
    to the computed value. On failure, sets error flag. *)

val get_expression : t -> string
val get_result : t -> string
val is_error : t -> bool
val is_empty : t -> bool

val get_expression_display : t -> string
(** Expression text for UI. Returns "0" when empty. *)

val get_result_display : t -> string
(** Result text for UI. Returns "Error" in error state. *)
