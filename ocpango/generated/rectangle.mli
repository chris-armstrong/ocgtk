(** The [PangoRectangle] structure represents a rectangle.

    [PangoRectangle] is frequently used to represent the logical or ink extents
    of a single glyph or section of text. (See, for instance,
    [Pango.Font.get_glyph_extents].)

    Its methods, signals and properties are on {!class-type-rectangle_t}. The
    functions it is built on are in {!Ocpango.Raw.Rectangle}. *)

(** {b The methods, signals and properties of a [Rectangle].}

    The [PangoRectangle] structure represents a rectangle.

    [PangoRectangle] is frequently used to represent the logical or ink extents
    of a single glyph or section of text. (See, for instance,
    [Pango.Font.get_glyph_extents].) *)
class type rectangle_t = object
  method as_rectangle : Raw.Rectangle.t
end

class rectangle : Raw.Rectangle.t -> rectangle_t
(** Wraps a raw handle of {!Ocpango.Raw.Rectangle.t}. *)
