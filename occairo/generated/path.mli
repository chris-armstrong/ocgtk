(** Bindings for [Path].

    Its methods, signals and properties are on {!class-type-path_t}. Its
    constructors are under {!section-constructors}. The functions it is built on
    are in {!Occairo.Raw.Path}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [Path].} *)
class type path_t = object
  (** {2:conversions Conversions} *)

  method as_path : Raw.Path.t
end

class path : Raw.Path.t -> path_t
(** Wraps a raw handle of {!Occairo.Raw.Path.t}. *)

(** {1:constructors Constructors} *)

(** This class is not instantiated directly - it is used as a return value by
    methods on other classes. *)
