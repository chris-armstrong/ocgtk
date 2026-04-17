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

(** Frees a `PangoScriptIter`. *)
external free : t -> unit = "ml_pango_script_iter_free"

