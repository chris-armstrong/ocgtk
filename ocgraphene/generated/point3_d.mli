(** A point with three components: X, Y, and Z.

    Its methods, signals and properties are on {!class-type-point3_d_t}. The
    functions it is built on are in {!Ocgraphene.Raw.Point3_d}. *)

(** The methods, signals and properties of a [graphene_point3d_t]. *)
class type point3_d_t = object
  method dot : Raw.Point3_d.t -> float
  method equal : Raw.Point3_d.t -> bool
  method init : float -> float -> float -> Raw.Point3_d.t
  method init_from_point : Raw.Point3_d.t -> Raw.Point3_d.t
  method init_from_vec3 : Raw.Vec3.t -> Raw.Point3_d.t
  method length : unit -> float
  method near : Raw.Point3_d.t -> float -> bool
  method as_point3_d : Raw.Point3_d.t
end

class point3_d : Raw.Point3_d.t -> point3_d_t
(** Wraps a layer 1 handle, {!Ocgraphene.Raw.Point3_d.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [graphene_point3d_t], give one already wrapped. *)

val alloc : unit -> point3_d_t
