(** Bindings for [Surface].

    Its methods, signals and properties are on {!class-type-surface_t}. The
    functions it is built on are in {!Occairo.Raw.Surface}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [Surface].} *)
class type surface_t = object
  (** {2:conversions Conversions} *)

  method as_surface : Raw.Surface.t
end

class surface : Raw.Surface.t -> surface_t
(** Wraps a raw handle of {!Occairo.Raw.Surface.t}. *)
