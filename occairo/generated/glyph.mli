(** Bindings for [Glyph].

    Its methods, signals and properties are on {!class-type-glyph_t}. The
    functions it is built on are in {!Occairo.Raw.Glyph}. *)

(** The methods, signals and properties of a [Glyph]. *)
class type glyph_t = object
  method as_glyph : Raw.Glyph.t
end

class glyph : Raw.Glyph.t -> glyph_t
(** Wraps a raw handle of {!Occairo.Raw.Glyph.t}. *)
