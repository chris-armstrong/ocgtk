(** A structure capable of holding a vector with two dimensions, x and y.

    The contents of the #graphene_vec2_t structure are private and should never
    be accessed directly.

    Its methods, signals and properties are on {!class-type-vec2_t}. The
    functions it is built on are in {!Ocgraphene.Raw.Vec2}. *)

(** The methods, signals and properties of a [graphene_vec2_t]. *)
class type vec2_t = object
  method dot : Raw.Vec2.t -> float
  method equal : Raw.Vec2.t -> bool
  method get_x : unit -> float
  method get_y : unit -> float
  method init : float -> float -> Raw.Vec2.t
  method init_from_float : float array -> Raw.Vec2.t
  method init_from_vec2 : Raw.Vec2.t -> Raw.Vec2.t
  method length : unit -> float
  method near : Raw.Vec2.t -> float -> bool
  method as_vec2 : Raw.Vec2.t
end

class vec2 : Raw.Vec2.t -> vec2_t
(** Wraps a layer 1 handle, {!Ocgraphene.Raw.Vec2.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [graphene_vec2_t], give one already wrapped. *)

val alloc : unit -> vec2_t
