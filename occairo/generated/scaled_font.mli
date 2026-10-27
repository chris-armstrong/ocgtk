(** Bindings for [cairo_scaled_font_t].

    Its methods, signals and properties are on {!class-type-scaled_font_t}. The
    functions it is built on are in {!Occairo.Raw.Scaled_font}. *)

(** The methods, signals and properties of a [cairo_scaled_font_t]. *)
class type scaled_font_t = object
  method as_scaled_font : Raw.Scaled_font.t
end

class scaled_font : Raw.Scaled_font.t -> scaled_font_t
(** Wraps a layer 1 handle, {!Occairo.Raw.Scaled_font.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [cairo_scaled_font_t], give one already wrapped. *)
