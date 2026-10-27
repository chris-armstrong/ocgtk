(** A point with two coordinates.

    Its methods, signals and properties are on {!class-type-point_t}. The
    functions it is built on are in {!Ocgraphene.Raw.Point}. *)

(** The methods, signals and properties of a [graphene_point_t]. *)
class type point_t = object
  method equal : Raw.Point.t -> bool
  (** Checks if the two points [a] and [b] point to the same coordinates.

      This function accounts for floating point fluctuations; if you want to
      control the fuzziness of the match, you can use graphene_point_near()
      instead. *)

  method init : float -> float -> Raw.Point.t
  (** Initializes [p] to the given [x] and [y] coordinates.

      It's safe to call this function multiple times. *)

  method init_from_point : Raw.Point.t -> Raw.Point.t
  (** Initializes [p] with the same coordinates of [src]. *)

  method init_from_vec2 : Raw.Vec2.t -> Raw.Point.t
  (** Initializes [p] with the coordinates inside the given #graphene_vec2_t. *)

  method near : Raw.Point.t -> float -> bool
  (** Checks whether the two points [a] and [b] are within the threshold of
      [epsilon]. *)

  method as_point : Raw.Point.t
end

class point : Raw.Point.t -> point_t
(** Wraps a layer 1 handle, {!Ocgraphene.Raw.Point.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [graphene_point_t], give one already wrapped. *)

val alloc : unit -> point_t
