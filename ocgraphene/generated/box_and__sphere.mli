(** The classes of {!Ocgraphene.Box}, {!Ocgraphene.Sphere}, defined together
    because they refer to each other. Each has a module of its own that
    re-exports it; use that module rather than this one. *)

(** The methods, signals and properties of a [graphene_box_t]. *)
class type box_t = object
  method contains_box : Raw.Box.t -> bool
  method contains_point : Raw.Point3_d.t -> bool
  method equal : Raw.Box.t -> bool
  method get_depth : unit -> float
  method get_height : unit -> float
  method get_width : unit -> float
  method init : Raw.Point3_d.t option -> Raw.Point3_d.t option -> Raw.Box.t
  method init_from_box : Raw.Box.t -> Raw.Box.t
  method init_from_points : int -> Raw.Point3_d.t array -> Raw.Box.t
  method init_from_vec3 : Raw.Vec3.t option -> Raw.Vec3.t option -> Raw.Box.t
  method init_from_vectors : int -> Raw.Vec3.t array -> Raw.Box.t
  method as_box : Raw.Box.t
end

(** The methods, signals and properties of a [graphene_sphere_t]. *)
and sphere_t = object
  method contains_point : Raw.Point3_d.t -> bool
  method distance : Raw.Point3_d.t -> float
  method equal : Raw.Sphere.t -> bool
  method get_radius : unit -> float
  method init : Raw.Point3_d.t option -> float -> Raw.Sphere.t

  method init_from_points :
    int -> Raw.Point3_d.t array -> Raw.Point3_d.t option -> Raw.Sphere.t

  method init_from_vectors :
    int -> Raw.Vec3.t array -> Raw.Point3_d.t option -> Raw.Sphere.t

  method is_empty : unit -> bool
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
