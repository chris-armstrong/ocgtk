(* GENERATED CODE - DO NOT EDIT *)
(* Point3D: Point3D *)

(** A point with three components: X, Y, and Z. *)
type t = [`point3_d] Gobject.obj

(** Create a new Point3D *)
external alloc : unit -> t = "ml_graphene_point3d_alloc"

(* Methods *)
(** Stores the coordinates of a #graphene_point3d_t into a
#graphene_vec3_t. *)
external to_vec3 : t -> Vec3_and__vec4.Vec3.t = "ml_graphene_point3d_to_vec3"

(** Scales the coordinates of the given #graphene_point3d_t by
the given @factor. *)
external scale : t -> float -> t = "ml_graphene_point3d_scale"

(** Normalizes the coordinates of a #graphene_point3d_t using the
given viewport and clipping planes.

The coordinates of the resulting #graphene_point3d_t will be
in the [ -1, 1 ] range. *)
external normalize_viewport : t -> Rect.t -> float -> float -> t = "ml_graphene_point3d_normalize_viewport"

(** Computes the normalization of the vector represented by the
coordinates of the given #graphene_point3d_t. *)
external normalize : t -> t = "ml_graphene_point3d_normalize"

(** Checks whether the two points are near each other, within
an @epsilon factor. *)
external near : t -> t -> float -> bool = "ml_graphene_point3d_near"

(** Computes the length of the vector represented by the
coordinates of the given #graphene_point3d_t. *)
external length : t -> float = "ml_graphene_point3d_length"

(** Linearly interpolates each component of @a and @b using the
provided @factor, and places the result in @res. *)
external interpolate : t -> t -> float -> t = "ml_graphene_point3d_interpolate"

(** Initializes a #graphene_point3d_t using the components
of a #graphene_vec3_t. *)
external init_from_vec3 : t -> Vec3_and__vec4.Vec3.t -> t = "ml_graphene_point3d_init_from_vec3"

(** Initializes a #graphene_point3d_t using the coordinates of
another #graphene_point3d_t. *)
external init_from_point : t -> t -> t = "ml_graphene_point3d_init_from_point"

(** Initializes a #graphene_point3d_t with the given coordinates. *)
external init : t -> float -> float -> float -> t = "ml_graphene_point3d_init"

(** Frees the resources allocated via graphene_point3d_alloc(). *)
external free : t -> unit = "ml_graphene_point3d_free"

(** Checks whether two given points are equal. *)
external equal : t -> t -> bool = "ml_graphene_point3d_equal"

(** Computes the dot product of the two given #graphene_point3d_t. *)
external dot : t -> t -> float = "ml_graphene_point3d_dot"

(** Computes the distance between the two given #graphene_point3d_t. *)
external distance : t -> t -> float * Vec3_and__vec4.Vec3.t = "ml_graphene_point3d_distance"

(** Computes the cross product of the two given #graphene_point3d_t. *)
external cross : t -> t -> t = "ml_graphene_point3d_cross"

