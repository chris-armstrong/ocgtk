(* GENERATED CODE - DO NOT EDIT *)
(* Border: Border *)

(** A struct that specifies a border around a rectangular area.

Each side can have different width. *)
type t = [`border] Gobject.obj

(** Create a new Border *)
external new_ : unit -> t = "ml_gtk_border_new"

(** Frees a `GtkBorder`. *)
external free : t -> unit = "ml_gtk_border_free"

(** Copies a `GtkBorder`. *)
external copy : t -> t = "ml_gtk_border_copy"

