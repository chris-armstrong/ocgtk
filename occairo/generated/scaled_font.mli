(** Bindings for [ScaledFont].

    Its methods, signals and properties are on {!class-type-scaled_font_t}. Its
    constructors are under {!section-constructors}. The functions it is built on
    are in {!Occairo.Raw.Scaled_font}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [ScaledFont].} *)
class type scaled_font_t = object
  (** {2:conversions Conversions} *)

  method as_scaled_font : Raw.Scaled_font.t
end

class scaled_font : Raw.Scaled_font.t -> scaled_font_t
(** Wraps a raw handle of {!Occairo.Raw.Scaled_font.t}. *)

(** {1:constructors Constructors} *)

(** This class is not instantiated directly - it is used as a return value by
    methods on other classes. *)
