(** Expression evaluator for calculator

    Pure OCaml module for parsing and evaluating mathematical expressions.
    Supports +, -, *, / operators with correct precedence, parentheses,
    and automatic closing of unclosed parentheses when valid.
*)

val evaluate : string -> (float, string) result
(** Evaluate an expression string.
    
    Supports:
    - Numbers (integers and decimals)
    - Operators: +, -, *, / with correct precedence
    - Parentheses for grouping
    - Negative numbers (unary minus)
    - Whitespace is ignored
    - Auto-closes unclosed parentheses when valid
    
    Returns [Ok result] on success, [Error msg] on failure.
    Error cases include: division by zero, malformed expressions,
    invalid auto-close positions.
*)

val safe_evaluate : string -> (float, string) result
(** Like [evaluate] but catches all exceptions.
    
    Use this when evaluating user input to prevent crashes.
*)

val format_result : (float, string) result -> string
(** Format a result for display.
    
    - Integers are shown without decimal (e.g., "5" not "5.0")
    - Decimals are shown as-is
    - Errors show as "Error"
*)

val is_incomplete_expression : string -> bool
(** Check if an expression ends with an incomplete operator.
    
    Returns [true] if the expression is empty, whitespace-only,
    or ends with +, -, *, or /.
*)

val get_display_text : string -> string
(** Get display text for an expression.
    
    Returns the trimmed expression, or "0" if empty/whitespace.
*)
