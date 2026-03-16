(* GENERATED CODE - DO NOT EDIT *)
(* Point: Point *)

(** A point with two coordinates. *)
type t = [`point] Gobject.obj

(** Create a new Point *)
external alloc : unit -> t = "ml_graphene_point_alloc"

(* Methods *)
(** Stores the coordinates of the given #graphene_point_t into a
#graphene_vec2_t. *)
external to_vec2 : t -> Vec2.t = "ml_graphene_point_to_vec2"

(** Checks whether the two points @a and @b are within
the threshold of @epsilon. *)
external near : t -> t -> float -> bool = "ml_graphene_point_near"

(** Linearly interpolates the coordinates of @a and @b using the
given @factor. *)
external interpolate : t -> t -> float -> t = "ml_graphene_point_interpolate"

(** Initializes @p with the coordinates inside the given #graphene_vec2_t. *)
external init_from_vec2 : t -> Vec2.t -> t = "ml_graphene_point_init_from_vec2"

(** Initializes @p with the same coordinates of @src. *)
external init_from_point : t -> t -> t = "ml_graphene_point_init_from_point"

(** Initializes @p to the given @x and @y coordinates.

It's safe to call this function multiple times. *)
external init : t -> float -> float -> t = "ml_graphene_point_init"

(** Frees the resources allocated by graphene_point_alloc(). *)
external free : t -> unit = "ml_graphene_point_free"

(** Checks if the two points @a and @b point to the same
coordinates.

This function accounts for floating point fluctuations; if
you want to control the fuzziness of the match, you can use
graphene_point_near() instead. *)
external equal : t -> t -> bool = "ml_graphene_point_equal"

(** Computes the distance between @a and @b. *)
external distance : t -> t -> float * float * float = "ml_graphene_point_distance"

