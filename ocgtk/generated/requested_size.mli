(** Represents a request of a screen object in a given orientation.

    These are primarily used in container implementations when allocating a
    natural size for children. See [distribute_natural_allocation].

    Its methods, signals and properties are on {!class-type-requested_size_t}.
    The functions it is built on are in {!Ocgtk.Raw.Requested_size}. *)

(** The methods, signals and properties of a [RequestedSize]. *)
class type requested_size_t = object
  method as_requested_size : Raw.Requested_size.t
end

class requested_size : Raw.Requested_size.t -> requested_size_t
(** Wraps a raw handle of {!Ocgtk.Raw.Requested_size.t}. *)
