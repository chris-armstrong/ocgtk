(** The classes of {!Ocgraphene.Vec3}, {!Ocgraphene.Vec4}, defined together
    because they refer to each other. Each has a module of its own that
    re-exports it; use that module rather than this one. *)

(** The methods, signals and properties of a [graphene_vec3_t]. *)
class type vec3_t = object
  method dot : Raw.Vec3.t -> float
  method equal : Raw.Vec3.t -> bool
  method get_x : unit -> float
  method get_y : unit -> float
  method get_z : unit -> float
  method init : float -> float -> float -> Raw.Vec3.t
  method init_from_float : float array -> Raw.Vec3.t
  method init_from_vec3 : Raw.Vec3.t -> Raw.Vec3.t
  method length : unit -> float
  method near : Raw.Vec3.t -> float -> bool
  method as_vec3 : Raw.Vec3.t
end

(** The methods, signals and properties of a [graphene_vec4_t]. *)
and vec4_t = object
  method dot : Raw.Vec4.t -> float
  method equal : Raw.Vec4.t -> bool
  method get_w : unit -> float
  method get_x : unit -> float
  method get_y : unit -> float
  method get_z : unit -> float
  method init : float -> float -> float -> float -> Raw.Vec4.t
  method init_from_float : float array -> Raw.Vec4.t
  method init_from_vec2 : Raw.Vec2.t -> float -> float -> Raw.Vec4.t
  method init_from_vec3 : Raw.Vec3.t -> float -> Raw.Vec4.t
  method init_from_vec4 : Raw.Vec4.t -> Raw.Vec4.t
  method length : unit -> float
  method near : Raw.Vec4.t -> float -> bool
  method as_vec4 : Raw.Vec4.t
end

(** Wraps a layer 1 handle, {!Ocgraphene.Raw.Vec3.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [graphene_vec3_t], give one already wrapped. *)
class vec3 : Raw.Vec3.t -> vec3_t
(** Wraps a layer 1 handle, {!Ocgraphene.Raw.Vec4.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [graphene_vec4_t], give one already wrapped. *)

and vec4 : Raw.Vec4.t -> vec4_t

val alloc : unit -> vec3_t
val alloc : unit -> vec4_t
