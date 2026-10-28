(** Bindings for [ScaledFont].

    Its methods, signals and properties are on {!class-type-scaled_font_t}. The
    functions it is built on are in {!Occairo.Raw.Scaled_font}. *)

(** {b The methods, signals and properties of a [ScaledFont].} *)
class type scaled_font_t = object
  method as_scaled_font : Raw.Scaled_font.t
end

class scaled_font : Raw.Scaled_font.t -> scaled_font_t
(** Wraps a raw handle of {!Occairo.Raw.Scaled_font.t}. *)
