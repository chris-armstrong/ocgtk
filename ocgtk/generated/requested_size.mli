(** Represents a request of a screen object in a given orientation.

    Its methods, signals and properties are on {!class-type-requested_size_t}.
    Its full description is under {!section-description}. Its constructors are
    under {!section-constructors}. The functions it is built on are in
    {!Ocgtk.Raw.Requested_size}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [RequestedSize].}

    Represents a request of a screen object in a given orientation.

    These are primarily used in container implementations when allocating a
    natural size for children. See [distribute_natural_allocation]. *)
class type requested_size_t = object
  (** {2:conversions Conversions} *)

  method as_requested_size : Raw.Requested_size.t
end

class requested_size : Raw.Requested_size.t -> requested_size_t
(** Wraps a raw handle of {!Ocgtk.Raw.Requested_size.t}. *)

(** {1:description Description}

    Represents a request of a screen object in a given orientation.

    These are primarily used in container implementations when allocating a
    natural size for children. See [distribute_natural_allocation]. *)

(** {1:constructors Constructors} *)

(** This class is not instantiated directly - it is used as a return value by
    methods on other classes. *)
