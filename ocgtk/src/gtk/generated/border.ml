(* GENERATED CODE - DO NOT EDIT *)
(* Border: Border *)

(** A struct that specifies a border around a rectangular area.

Each side can have different width. *)
type t = [`border] Gobject.obj

(** Create a new Border *)
external new_ : unit -> t = "ml_gtk_border_new"

(* Methods *)

external get_type : unit -> Gobject.Type.t = "ml_gtk_border_get_type"
