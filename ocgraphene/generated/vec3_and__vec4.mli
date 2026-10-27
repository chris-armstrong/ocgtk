(** The classes of {!Ocgraphene.Vec3}, {!Ocgraphene.Vec4}, defined together
    because they refer to each other. Each has a module of its own that
    re-exports it; use that module rather than this one. *)

(** The methods, signals and properties of a [graphene_vec3_t]. *)
class type vec3_t = object
  method dot : Raw.Vec3.t -> float
  (** Computes the dot product of the two given vectors. *)

  method equal : Raw.Vec3.t -> bool
  (** Checks whether the two given #graphene_vec3_t are equal. *)

  method get_x : unit -> float
  (** Retrieves the first component of the given vector [v]. *)

  method get_y : unit -> float
  (** Retrieves the second component of the given vector [v]. *)

  method get_z : unit -> float
  (** Retrieves the third component of the given vector [v]. *)

  method init : float -> float -> float -> Raw.Vec3.t
  (** Initializes a #graphene_vec3_t using the given values.

      This function can be called multiple times. *)

  method init_from_float : float array -> Raw.Vec3.t
  (** Initializes a #graphene_vec3_t with the values from an array. *)

  method init_from_vec3 : Raw.Vec3.t -> Raw.Vec3.t
  (** Initializes a #graphene_vec3_t with the values of another
      #graphene_vec3_t. *)

  method length : unit -> float
  (** Retrieves the length of the given vector [v]. *)

  method near : Raw.Vec3.t -> float -> bool
  (** Compares the two given #graphene_vec3_t vectors and checks whether their
      values are within the given [epsilon]. *)

  method as_vec3 : Raw.Vec3.t
end

(** The methods, signals and properties of a [graphene_vec4_t]. *)
and vec4_t = object
  method dot : Raw.Vec4.t -> float
  (** Computes the dot product of the two given vectors. *)

  method equal : Raw.Vec4.t -> bool
  (** Checks whether the two given #graphene_vec4_t are equal. *)

  method get_w : unit -> float
  (** Retrieves the value of the fourth component of the given #graphene_vec4_t.
  *)

  method get_x : unit -> float
  (** Retrieves the value of the first component of the given #graphene_vec4_t.
  *)

  method get_y : unit -> float
  (** Retrieves the value of the second component of the given #graphene_vec4_t.
  *)

  method get_z : unit -> float
  (** Retrieves the value of the third component of the given #graphene_vec4_t.
  *)

  method init : float -> float -> float -> float -> Raw.Vec4.t
  (** Initializes a #graphene_vec4_t using the given values.

      This function can be called multiple times. *)

  method init_from_float : float array -> Raw.Vec4.t
  (** Initializes a #graphene_vec4_t with the values inside the given array. *)

  method init_from_vec2 : Raw.Vec2.t -> float -> float -> Raw.Vec4.t
  (** Initializes a #graphene_vec4_t using the components of a #graphene_vec2_t
      and the values of [z] and [w]. *)

  method init_from_vec3 : Raw.Vec3.t -> float -> Raw.Vec4.t
  (** Initializes a #graphene_vec4_t using the components of a #graphene_vec3_t
      and the value of [w]. *)

  method init_from_vec4 : Raw.Vec4.t -> Raw.Vec4.t
  (** Initializes a #graphene_vec4_t using the components of another
      #graphene_vec4_t. *)

  method length : unit -> float
  (** Computes the length of the given #graphene_vec4_t. *)

  method near : Raw.Vec4.t -> float -> bool
  (** Compares the two given #graphene_vec4_t vectors and checks whether their
      values are within the given [epsilon]. *)

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
(** Allocates a new #graphene_vec3_t structure.

    The contents of the returned structure are undefined.

    Use graphene_vec3_init() to initialize the vector. *)

val alloc : unit -> vec4_t
(** Allocates a new #graphene_vec4_t structure.

    The contents of the returned structure are undefined.

    Use graphene_vec4_init() to initialize the vector. *)
