(** The [PangoRectangle] structure represents a rectangle.

    [PangoRectangle] is frequently used to represent the logical or ink extents
    of a single glyph or section of text. (See, for instance,
    [Pango.Font.get_glyph_extents].)

    Its methods, signals and properties are on {!class-type-rectangle_t}. The
    functions it is built on are in {!Ocpango.Raw.Rectangle}. *)

(** The methods, signals and properties of a [PangoRectangle]. *)
class type rectangle_t = object
  method as_rectangle : Raw.Rectangle.t
end

class rectangle : Raw.Rectangle.t -> rectangle_t
(** Wraps a layer 1 handle, {!Ocpango.Raw.Rectangle.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [PangoRectangle], give one already wrapped. *)
