(** The classes of {!Ocgraphene.Box}, {!Ocgraphene.Sphere}, defined together
    because they refer to each other. Each has a module of its own that
    re-exports it; use that module rather than this one. *)

(** The methods, signals and properties of a [graphene_box_t]. *)
class type box_t = object
  method contains_box : Raw.Box.t -> bool
  (** Checks whether the #graphene_box_t [a] contains the given #graphene_box_t
      [b]. *)

  method contains_point : Raw.Point3_d.t -> bool
  (** Checks whether [box] contains the given [point]. *)

  method equal : Raw.Box.t -> bool
  (** Checks whether the two given boxes are equal. *)

  method get_depth : unit -> float
  (** Retrieves the size of the [box] on the Z axis. *)

  method get_height : unit -> float
  (** Retrieves the size of the [box] on the Y axis. *)

  method get_width : unit -> float
  (** Retrieves the size of the [box] on the X axis. *)

  method init : Raw.Point3_d.t option -> Raw.Point3_d.t option -> Raw.Box.t
  (** Initializes the given #graphene_box_t with two vertices. *)

  method init_from_box : Raw.Box.t -> Raw.Box.t
  (** Initializes the given #graphene_box_t with the vertices of another
      #graphene_box_t. *)

  method init_from_points : int -> Raw.Point3_d.t array -> Raw.Box.t
  (** Initializes the given #graphene_box_t with the given array of vertices.

      If [n_points] is 0, the returned box is initialized with
      graphene_box_empty(). *)

  method init_from_vec3 : Raw.Vec3.t option -> Raw.Vec3.t option -> Raw.Box.t
  (** Initializes the given #graphene_box_t with two vertices stored inside
      #graphene_vec3_t. *)

  method init_from_vectors : int -> Raw.Vec3.t array -> Raw.Box.t
  (** Initializes the given #graphene_box_t with the given array of vertices.

      If [n_vectors] is 0, the returned box is initialized with
      graphene_box_empty(). *)

  method as_box : Raw.Box.t
end

(** The methods, signals and properties of a [graphene_sphere_t]. *)
and sphere_t = object
  method contains_point : Raw.Point3_d.t -> bool
  (** Checks whether the given [point] is contained in the volume of a
      #graphene_sphere_t. *)

  method distance : Raw.Point3_d.t -> float
  (** Computes the distance of the given [point] from the surface of a
      #graphene_sphere_t. *)

  method equal : Raw.Sphere.t -> bool
  (** Checks whether two #graphene_sphere_t are equal. *)

  method get_radius : unit -> float
  (** Retrieves the radius of a #graphene_sphere_t. *)

  method init : Raw.Point3_d.t option -> float -> Raw.Sphere.t
  (** Initializes the given #graphene_sphere_t with the given [center] and
      [radius]. *)

  method init_from_points :
    int -> Raw.Point3_d.t array -> Raw.Point3_d.t option -> Raw.Sphere.t
  (** Initializes the given #graphene_sphere_t using the given array of 3D
      coordinates so that the sphere includes them.

      The center of the sphere can either be specified, or will be center of the
      3D volume that encompasses all [points]. *)

  method init_from_vectors :
    int -> Raw.Vec3.t array -> Raw.Point3_d.t option -> Raw.Sphere.t
  (** Initializes the given #graphene_sphere_t using the given array of 3D
      coordinates so that the sphere includes them.

      The center of the sphere can either be specified, or will be center of the
      3D volume that encompasses all [vectors]. *)

  method is_empty : unit -> bool
  (** Checks whether the sphere has a zero radius. *)

  method as_sphere : Raw.Sphere.t
end

(** Wraps a layer 1 handle, {!Ocgraphene.Raw.Box.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [graphene_box_t], give one already wrapped. *)
class box : Raw.Box.t -> box_t
(** Wraps a layer 1 handle, {!Ocgraphene.Raw.Sphere.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [graphene_sphere_t], give one already wrapped. *)

and sphere : Raw.Sphere.t -> sphere_t

val alloc : unit -> box_t
val alloc : unit -> sphere_t
