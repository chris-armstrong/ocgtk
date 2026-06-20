(* GENERATED CODE - DO NOT EDIT *)
(* Border: Border *)

type t = [ `border ] Gobject.obj
(** A struct that specifies a border around a rectangular area.

    Each side can have different width. *)

external new_ : unit -> t = "ml_gtk_border_new"
(** Create a new Border *)

(* Methods *)

(* Record field accessors *)

(* Getters *)
external get_left : t -> Int16.t = "ml_gtk_border_get_left"
external get_right : t -> Int16.t = "ml_gtk_border_get_right"
external get_top : t -> Int16.t = "ml_gtk_border_get_top"
external get_bottom : t -> Int16.t = "ml_gtk_border_get_bottom"

(* Setters *)
external set_left : t -> Int16.t -> unit = "ml_gtk_border_set_left"
external set_right : t -> Int16.t -> unit = "ml_gtk_border_set_right"
external set_top : t -> Int16.t -> unit = "ml_gtk_border_set_top"
external set_bottom : t -> Int16.t -> unit = "ml_gtk_border_set_bottom"

external make : Int16.t -> Int16.t -> Int16.t -> Int16.t -> t
  = "ml_gtk_border_make"

external get_type : unit -> Gobject.Type.t = "ml_gtk_border_get_type"
