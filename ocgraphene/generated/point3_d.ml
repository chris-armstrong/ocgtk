class type point3_d_t = object
  method dot : Raw.Point3_d.t -> float
  (** Computes the dot product of the two given #graphene_point3d_t. *)

  method equal : Raw.Point3_d.t -> bool
  (** Checks whether two given points are equal. *)

  method init : float -> float -> float -> Raw.Point3_d.t
  (** Initializes a #graphene_point3d_t with the given coordinates. *)

  method init_from_point : Raw.Point3_d.t -> Raw.Point3_d.t
  (** Initializes a #graphene_point3d_t using the coordinates of another
      #graphene_point3d_t. *)

  method init_from_vec3 : Raw.Vec3.t -> Raw.Point3_d.t
  (** Initializes a #graphene_point3d_t using the components of a
      #graphene_vec3_t. *)

  method length : unit -> float
  (** Computes the length of the vector represented by the coordinates of the
      given #graphene_point3d_t. *)

  method near : Raw.Point3_d.t -> float -> bool
  (** Checks whether the two points are near each other, within an [epsilon]
      factor. *)

  method as_point3_d : Raw.Point3_d.t
end

(* High-level class for Point3D *)
class point3_d (obj : Raw.Point3_d.t) : point3_d_t =
  object (self)
    method dot : Raw.Point3_d.t -> float = fun b -> Raw.Point3_d.dot obj b
    method equal : Raw.Point3_d.t -> bool = fun b -> Raw.Point3_d.equal obj b

    method init : float -> float -> float -> Raw.Point3_d.t =
      fun x y z -> Raw.Point3_d.init obj x y z

    method init_from_point : Raw.Point3_d.t -> Raw.Point3_d.t =
      fun src -> Raw.Point3_d.init_from_point obj src

    method init_from_vec3 : Raw.Vec3.t -> Raw.Point3_d.t =
      fun v -> Raw.Point3_d.init_from_vec3 obj v

    method length : unit -> float = fun () -> Raw.Point3_d.length obj

    method near : Raw.Point3_d.t -> float -> bool =
      fun b epsilon -> Raw.Point3_d.near obj b epsilon

    method as_point3_d = obj
  end

let alloc () : point3_d_t = new point3_d (Raw.Point3_d.alloc ())
