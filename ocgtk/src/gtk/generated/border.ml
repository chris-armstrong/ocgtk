(* GENERATED CODE - DO NOT EDIT *)
(* Border: Border *)

(** Specifies a border around a rectangular area.

    Each side can have a different width. *)

type t = [ `border ] Gobject.obj

external new_ : unit -> t = "ml_gtk_border_new"
(** Create a new Border *)

(* Methods *)

external get_type : unit -> Gobject.Type.t = "ml_gtk_border_get_type"
