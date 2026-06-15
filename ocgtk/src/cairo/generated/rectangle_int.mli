(* GENERATED CODE - DO NOT EDIT *)
(* RectangleInt: RectangleInt *)

type t = [ `rectangle_int ] Gobject.obj

(* Methods *)

(* Record field accessors *)

(* Getters *)
external get_x : t -> int = "ml_cairo_rectangle_int_get_x"
external get_y : t -> int = "ml_cairo_rectangle_int_get_y"
external get_width : t -> int = "ml_cairo_rectangle_int_get_width"
external get_height : t -> int = "ml_cairo_rectangle_int_get_height"

(* Setters *)
external set_x : t -> int -> unit = "ml_cairo_rectangle_int_set_x"
external set_y : t -> int -> unit = "ml_cairo_rectangle_int_set_y"
external set_width : t -> int -> unit = "ml_cairo_rectangle_int_set_width"
external set_height : t -> int -> unit = "ml_cairo_rectangle_int_set_height"
external make : int -> int -> int -> int -> t = "ml_cairo_rectangle_int_make"
