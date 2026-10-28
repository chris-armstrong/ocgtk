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

(* High-level class for Point *)
class point (obj : Raw.Point.t) : point_t =
  object (self)
    method equal : Raw.Point.t -> bool = fun b -> Raw.Point.equal obj b

    method init : float -> float -> Raw.Point.t =
      fun x y -> Raw.Point.init obj x y

    method init_from_point : Raw.Point.t -> Raw.Point.t =
      fun src -> Raw.Point.init_from_point obj src

    method init_from_vec2 : Raw.Vec2.t -> Raw.Point.t =
      fun src -> Raw.Point.init_from_vec2 obj src

    method near : Raw.Point.t -> float -> bool =
      fun b epsilon -> Raw.Point.near obj b epsilon

    method as_point = obj
  end

let alloc () : point_t = new point (Raw.Point.alloc ())
