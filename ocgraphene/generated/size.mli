(** A size.

    Its methods, signals and properties are on {!class-type-size_t}. The
    functions it is built on are in {!Ocgraphene.Raw.Size}. *)

(** The methods, signals and properties of a [graphene_size_t]. *)
class type size_t = object
  method equal : Raw.Size.t -> bool
  method init : float -> float -> Raw.Size.t
  method init_from_size : Raw.Size.t -> Raw.Size.t
  method as_size : Raw.Size.t
end

class size : Raw.Size.t -> size_t
(** Wraps a layer 1 handle, {!Ocgraphene.Raw.Size.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [graphene_size_t], give one already wrapped. *)

val alloc : unit -> size_t
