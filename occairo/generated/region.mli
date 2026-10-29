(** Bindings for [Region].

    Its methods, signals and properties are on {!class-type-region_t}. Its
    constructors are under {!section-constructors}. The functions it is built on
    are in {!Occairo.Raw.Region}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [Region].} *)
class type region_t = object
  (** {2:conversions Conversions} *)

  method as_region : Raw.Region.t
end

class region : Raw.Region.t -> region_t
(** Wraps a raw handle of {!Occairo.Raw.Region.t}. *)

(** {1:constructors Constructors} *)

(** This class is not instantiated directly - it is used as a return value by
    methods on other classes. *)
