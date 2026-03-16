(* GENERATED CODE - DO NOT EDIT *)
(* ScriptIter: ScriptIter *)

(** A `PangoScriptIter` is used to iterate through a string
and identify ranges in different scripts. *)
type t = [`script_iter] Gobject.obj

(** Create a new ScriptIter *)
external new_ : string -> int -> t = "ml_pango_script_iter_new"

(* Methods *)
(** Advances a `PangoScriptIter` to the next range.

If @iter is already at the end, it is left unchanged
and %FALSE is returned. *)
external next : t -> bool = "ml_pango_script_iter_next"

(** Gets information about the range to which @iter currently points.

The range is the set of locations p where *start <= p < *end.
(That is, it doesn't include the character stored at *end)

Note that while the type of the @script argument is declared
as `PangoScript`, as of Pango 1.18, this function simply returns
`GUnicodeScript` values. Callers must be prepared to handle unknown
values. *)
external get_range : t -> string * string * Pango_enums.script = "ml_pango_script_iter_get_range"

(** Frees a `PangoScriptIter`. *)
external free : t -> unit = "ml_pango_script_iter_free"

