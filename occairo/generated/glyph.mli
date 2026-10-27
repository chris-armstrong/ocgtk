(** Bindings for [cairo_glyph_t].

    Its methods, signals and properties are on {!class-type-glyph_t}. The
    functions it is built on are in {!Occairo.Raw.Glyph}. *)

(** The methods, signals and properties of a [cairo_glyph_t]. *)
class type glyph_t = object
  method as_glyph : Raw.Glyph.t
end

class glyph : Raw.Glyph.t -> glyph_t
(** Wraps a layer 1 handle, {!Occairo.Raw.Glyph.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [cairo_glyph_t], give one already wrapped. *)
