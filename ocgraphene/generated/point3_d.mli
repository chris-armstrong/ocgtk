(** A point with three components: X, Y, and Z.

    Its methods, signals and properties are on {!class-type-point3_d_t}. Its
    constructors are under {!section-constructors}. The functions it is built on
    are in {!Ocgraphene.Raw.Point3_d}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [Point3D].}

    A point with three components: X, Y, and Z. *)
class type point3_d_t = object
  (** {2:methods Methods} *)

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

  (** {2:conversions Conversions} *)

  method as_point3_d : Raw.Point3_d.t
end

class point3_d : Raw.Point3_d.t -> point3_d_t
(** Wraps a raw handle of {!Ocgraphene.Raw.Point3_d.t}. *)

(** {1:constructors Constructors} *)

val alloc : unit -> point3_d_t
(** Allocates a #graphene_point3d_t structure. *)
