(* GENERATED CODE - DO NOT EDIT *)
(* Combined classes for cyclic dependencies *)

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

class vec3 (obj : Raw.Vec3.t) : vec3_t =
  object (self)
    method dot : Raw.Vec3.t -> float = fun b -> Raw.Vec3.dot obj b
    method equal : Raw.Vec3.t -> bool = fun v2 -> Raw.Vec3.equal obj v2
    method get_x : unit -> float = fun () -> Raw.Vec3.get_x obj
    method get_y : unit -> float = fun () -> Raw.Vec3.get_y obj
    method get_z : unit -> float = fun () -> Raw.Vec3.get_z obj

    method init : float -> float -> float -> Raw.Vec3.t =
      fun x y z -> Raw.Vec3.init obj x y z

    method init_from_float : float array -> Raw.Vec3.t =
      fun src -> Raw.Vec3.init_from_float obj src

    method init_from_vec3 : Raw.Vec3.t -> Raw.Vec3.t =
      fun src -> Raw.Vec3.init_from_vec3 obj src

    method length : unit -> float = fun () -> Raw.Vec3.length obj

    method near : Raw.Vec3.t -> float -> bool =
      fun v2 epsilon -> Raw.Vec3.near obj v2 epsilon

    method as_vec3 = obj
  end

and vec4 (obj : Raw.Vec4.t) : vec4_t =
  object (self)
    method dot : Raw.Vec4.t -> float = fun b -> Raw.Vec4.dot obj b
    method equal : Raw.Vec4.t -> bool = fun v2 -> Raw.Vec4.equal obj v2
    method get_w : unit -> float = fun () -> Raw.Vec4.get_w obj
    method get_x : unit -> float = fun () -> Raw.Vec4.get_x obj
    method get_y : unit -> float = fun () -> Raw.Vec4.get_y obj
    method get_z : unit -> float = fun () -> Raw.Vec4.get_z obj

    method init : float -> float -> float -> float -> Raw.Vec4.t =
      fun x y z w -> Raw.Vec4.init obj x y z w

    method init_from_float : float array -> Raw.Vec4.t =
      fun src -> Raw.Vec4.init_from_float obj src

    method init_from_vec2 : Raw.Vec2.t -> float -> float -> Raw.Vec4.t =
      fun src z w -> Raw.Vec4.init_from_vec2 obj src z w

    method init_from_vec3 : Raw.Vec3.t -> float -> Raw.Vec4.t =
      fun src w -> Raw.Vec4.init_from_vec3 obj src w

    method init_from_vec4 : Raw.Vec4.t -> Raw.Vec4.t =
      fun src -> Raw.Vec4.init_from_vec4 obj src

    method length : unit -> float = fun () -> Raw.Vec4.length obj

    method near : Raw.Vec4.t -> float -> bool =
      fun v2 epsilon -> Raw.Vec4.near obj v2 epsilon

    method as_vec4 = obj
  end

let alloc () : vec3_t = new vec3 (Raw.Vec3.alloc ())
let alloc () : vec4_t = new vec4 (Raw.Vec4.alloc ())
