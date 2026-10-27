(** A size.

    Its methods, signals and properties are on {!class-type-size_t}. Its
    constructors are under {!section-constructors}. The functions it is built on
    are in {!Ocgraphene.Raw.Size}. *)

(** The methods, signals and properties of a [graphene_size_t]. *)
class type size_t = object
  method equal : Raw.Size.t -> bool
  (** Checks whether the two give #graphene_size_t are equal. *)

  method init : float -> float -> Raw.Size.t
  (** Initializes a #graphene_size_t using the given [width] and [height]. *)

  method init_from_size : Raw.Size.t -> Raw.Size.t
  (** Initializes a #graphene_size_t using the width and height of the given
      [src]. *)

  method as_size : Raw.Size.t
end

class size : Raw.Size.t -> size_t
(** Wraps a layer 1 handle, {!Ocgraphene.Raw.Size.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [graphene_size_t], give one already wrapped. *)

(** {2:constructors Constructors} *)

val alloc : unit -> size_t
(** Allocates a new #graphene_size_t.

    The contents of the returned value are undefined. *)
