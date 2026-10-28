(** Bindings for [Context].

    Its methods, signals and properties are on {!class-type-context_t}. Its
    constructors are under {!section-constructors}. The functions it is built on
    are in {!Occairo.Raw.Context}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [Context].} *)
class type context_t = object
  (** {2:conversions Conversions} *)

  method as_context : Raw.Context.t
end

class context : Raw.Context.t -> context_t
(** Wraps a raw handle of {!Occairo.Raw.Context.t}. *)

(** {1:constructors Constructors} *)

(** This class is not instantiated directly - it is used as a return value by
    methods on other classes. *)
