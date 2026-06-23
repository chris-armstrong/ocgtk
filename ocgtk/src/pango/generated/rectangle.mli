(* GENERATED CODE - DO NOT EDIT *)
(* Rectangle: Rectangle *)

type t = [ `rectangle ] Gobject.obj
(** The `PangoRectangle` structure represents a rectangle.

    `PangoRectangle` is frequently used to represent the logical or ink extents
    of a single glyph or section of text. (See, for instance,
    [method@Pango.Font.get_glyph_extents].) *)

(* Methods *)

(* Record field accessors *)

(* Getters *)
external get_x : t -> int = "ml_pango_rectangle_get_x"
external get_y : t -> int = "ml_pango_rectangle_get_y"
external get_width : t -> int = "ml_pango_rectangle_get_width"
external get_height : t -> int = "ml_pango_rectangle_get_height"

(* Setters *)
external set_x : t -> int -> unit = "ml_pango_rectangle_set_x"
external set_y : t -> int -> unit = "ml_pango_rectangle_set_y"
external set_width : t -> int -> unit = "ml_pango_rectangle_set_width"
external set_height : t -> int -> unit = "ml_pango_rectangle_set_height"
external make : int -> int -> int -> int -> t = "ml_pango_rectangle_make"
