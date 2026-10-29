(** Bindings for [Pattern].

    Its methods, signals and properties are on {!class-type-pattern_t}. Its
    constructors are under {!section-constructors}. The functions it is built on
    are in {!Occairo.Raw.Pattern}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [Pattern].} *)
class type pattern_t = object
  (** {2:conversions Conversions} *)

  method as_pattern : Raw.Pattern.t
end

class pattern : Raw.Pattern.t -> pattern_t
(** Wraps a raw handle of {!Occairo.Raw.Pattern.t}. *)

(** {1:constructors Constructors} *)

(** This class is not instantiated directly - it is used as a return value by
    methods on other classes. *)
