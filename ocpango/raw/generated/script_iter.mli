(* GENERATED CODE - DO NOT EDIT *)
(* ScriptIter: ScriptIter *)

(** A [PangoScriptIter] is used to iterate through a string and identify ranges
    in different scripts.

    The class built on this module is in {!Ocpango.Script_iter}. *)

type t = [ `script_iter ] Gobject.obj

external gtype : unit -> Gobject.Type.t = "ml_pango_script_iter_get_type"

external new_ : string -> int -> t = "ml_pango_script_iter_new"
(** Create a new [PangoScriptIter], used to break a string of Unicode text into
    runs by Unicode script.

    No copy is made of [text], so the caller needs to make sure it remains valid
    until the iterator is freed with [Pango.ScriptIter.free]. *)

(* Methods *)

external next : t -> bool = "ml_pango_script_iter_next"
(** Advances a [PangoScriptIter] to the next range.

    If [iter] is already at the end, it is left unchanged and [false] is
    returned. *)
