(** Represents a request of a screen object in a given orientation.

    These are primarily used in container implementations when allocating a
    natural size for children. See [distribute_natural_allocation].

    Its methods, signals and properties are on {!class-type-requested_size_t}.
    The functions it is built on are in {!Ocgtk.Raw.Requested_size}. *)

(** The methods, signals and properties of a [GtkRequestedSize]. *)
class type requested_size_t = object
  method as_requested_size : Raw.Requested_size.t
end

class requested_size : Raw.Requested_size.t -> requested_size_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Requested_size.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [GtkRequestedSize], give one already wrapped. *)
