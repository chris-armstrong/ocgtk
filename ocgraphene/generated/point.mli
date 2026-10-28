(** A point with two coordinates.

    Its methods, signals and properties are on {!class-type-point_t}. Its
    constructors are under {!section-constructors}. The functions it is built on
    are in {!Ocgraphene.Raw.Point}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [Point].}

    A point with two coordinates. *)
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
(** Wraps a raw handle of {!Ocgraphene.Raw.Point.t}. *)

(** {1:constructors Constructors} *)

val alloc : unit -> point_t
(** Allocates a new #graphene_point_t structure.

    The coordinates of the returned point are (0, 0).

    It's possible to chain this function with graphene_point_init() or
    graphene_point_init_from_point(), e.g.:

    {[
      graphene_point_t *
      point_new (float x, float y)
      {
        return graphene_point_init (graphene_point_alloc (), x, y);
      }

      graphene_point_t *
      point_copy (const graphene_point_t *p)
      {
        return graphene_point_init_from_point (graphene_point_alloc (), p);
      }
    ]} *)
