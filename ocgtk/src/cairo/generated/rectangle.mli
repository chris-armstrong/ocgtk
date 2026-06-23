(* GENERATED CODE - DO NOT EDIT *)
(* Rectangle: Rectangle *)

type t = [ `rectangle ] Gobject.obj

(* Methods *)

(* Record field accessors *)

(* Getters *)
external get_x : t -> float = "ml_cairo_rectangle_get_x"
external get_y : t -> float = "ml_cairo_rectangle_get_y"
external get_width : t -> float = "ml_cairo_rectangle_get_width"
external get_height : t -> float = "ml_cairo_rectangle_get_height"

(* Setters *)
external set_x : t -> float -> unit = "ml_cairo_rectangle_set_x"
external set_y : t -> float -> unit = "ml_cairo_rectangle_set_y"
external set_width : t -> float -> unit = "ml_cairo_rectangle_set_width"
external set_height : t -> float -> unit = "ml_cairo_rectangle_set_height"

external make : float -> float -> float -> float -> t
  = "ml_cairo_rectangle_make"

external get_type : unit -> Gobject.Type.t = "ml_cairo_rectangle_get_type"
