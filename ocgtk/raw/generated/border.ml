(* GENERATED CODE - DO NOT EDIT *)
(* Border: Border *)

(** Specifies a border around a rectangular area.

    Each side can have a different width.

    The class built on this module is in {!Ocgtk.Border}. *)

type t = [ `border ] Gobject.obj

external gtype : unit -> Gobject.Type.t = "ml_gtk_border_get_type"

external new_ : unit -> t = "ml_gtk_border_new"
(** Allocates a new [GtkBorder] struct and initializes its elements to zero. *)

(* Methods *)
