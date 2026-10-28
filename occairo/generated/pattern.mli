(** Bindings for [Pattern].

    Its methods, signals and properties are on {!class-type-pattern_t}. The
    functions it is built on are in {!Occairo.Raw.Pattern}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [Pattern].} *)
class type pattern_t = object
  method as_pattern : Raw.Pattern.t
end

class pattern : Raw.Pattern.t -> pattern_t
(** Wraps a raw handle of {!Occairo.Raw.Pattern.t}. *)
