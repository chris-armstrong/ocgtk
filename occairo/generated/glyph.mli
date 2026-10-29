(** Bindings for [Glyph].

    Its methods, signals and properties are on {!class-type-glyph_t}. Its
    constructors are under {!section-constructors}. The functions it is built on
    are in {!Occairo.Raw.Glyph}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [Glyph].} *)
class type glyph_t = object
  (** {2:conversions Conversions} *)

  method as_glyph : Raw.Glyph.t
end

class glyph : Raw.Glyph.t -> glyph_t
(** Wraps a raw handle of {!Occairo.Raw.Glyph.t}. *)

(** {1:constructors Constructors} *)

(** This class is not instantiated directly - it is used as a return value by
    methods on other classes. *)
