(** Describes a 3D transform.

    Unlike [graphene_matrix_t], [GskTransform] retains the steps in how a
    transform was constructed, and allows inspecting them. It is modeled after
    the way CSS describes transforms.

    [GskTransform] objects are immutable and cannot be changed after creation.
    This means code can safely expose them as properties of objects without
    having to worry about others changing them.

    Its methods, signals and properties are on {!class-type-transform_t}. The
    functions it is built on are in {!Ocgsk.Raw.Transform}. *)

(** The methods, signals and properties of a [GskTransform]. *)
class type transform_t = object
  method equal : Raw.Transform.t option -> bool
  (** Checks two transforms for equality. *)

  method get_category : unit -> Enums.transformcategory
  (** Returns the category this transform belongs to. *)

  method invert : unit -> Raw.Transform.t option
  (** Inverts the given transform.

      If [self] is not invertible, [NULL] is returned. Note that inverting
      [NULL] also returns [NULL], which is the correct inverse of [NULL]. If you
      need to differentiate between those cases, you should check [self] is not
      [NULL] before calling this function.

      This function consumes [self]. Use [Gsk.Transform.ref] first if you want
      to keep it around. *)

  method matrix : Ocgraphene.Matrix.matrix_t -> Raw.Transform.t
  (** Multiplies [next] with the given [matrix].

      This function consumes [next]. Use [Gsk.Transform.ref] first if you want
      to keep it around. *)

  method matrix_2d :
    float -> float -> float -> float -> float -> float -> Raw.Transform.t option
  (** Multiplies [next] with the matrix \[ xx yx x0; xy yy y0; 0 0 1 \].

      The result of calling [Gsk.Transform.to_2d] on the returned
      [Gsk.Transform] should match the input passed to this function.

      This function consumes [next]. Use [Gsk.Transform.ref] first if you want
      to keep it around. *)

  method perspective : float -> Raw.Transform.t
  (** Applies a perspective projection transform.

      This transform scales points in X and Y based on their Z value, scaling
      points with positive Z values away from the origin, and those with
      negative Z values towards the origin. Points on the z=0 plane are
      unchanged.

      This function consumes [next]. Use [Gsk.Transform.ref] first if you want
      to keep it around. *)

  method ref : unit -> Raw.Transform.t option
  (** Acquires a reference on the given transform. *)

  method rotate : float -> Raw.Transform.t option
  (** Rotates [next] by an angle around the Z axis.

      The rotation happens around the origin point of (0, 0).

      This function consumes [next]. Use [Gsk.Transform.ref] first if you want
      to keep it around. *)

  method rotate_3d : float -> Ocgraphene.Vec3.vec3_t -> Raw.Transform.t option
  (** Rotates [next] [angle] degrees around [axis].

      For a rotation in 2D space, use [Gsk.Transform.rotate]

      This function consumes [next]. Use [Gsk.Transform.ref] first if you want
      to keep it around. *)

  method scale : float -> float -> Raw.Transform.t option
  (** Scales [next] in 2-dimensional space by the given factors.

      Use [Gsk.Transform.scale_3d] to scale in all 3 dimensions.

      This function consumes [next]. Use [Gsk.Transform.ref] first if you want
      to keep it around. *)

  method scale_3d : float -> float -> float -> Raw.Transform.t option
  (** Scales [next] by the given factors.

      This function consumes [next]. Use [Gsk.Transform.ref] first if you want
      to keep it around. *)

  method skew : float -> float -> Raw.Transform.t option
  (** Applies a skew transform.

      This function consumes [next]. Use [Gsk.Transform.ref] first if you want
      to keep it around. *)

  method to_string : unit -> string
  (** Converts the transform into a human-readable string.

      The resulting string can be parsed with [Gsk.Transform.parse].

      This is a wrapper around [Gsk.Transform.print]. *)

  method transform : Raw.Transform.t option -> Raw.Transform.t option
  (** Applies all the operations from [other] to [next].

      This function consumes [next]. Use [Gsk.Transform.ref] first if you want
      to keep it around. *)

  method translate : Ocgraphene.Point.point_t -> Raw.Transform.t option
  (** Translates [next] in 2-dimensional space by [point].

      This function consumes [next]. Use [Gsk.Transform.ref] first if you want
      to keep it around. *)

  method translate_3d : Ocgraphene.Point3_d.point3_d_t -> Raw.Transform.t option
  (** Translates [next] by [point].

      This function consumes [next]. Use [Gsk.Transform.ref] first if you want
      to keep it around. *)

  method as_transform : Raw.Transform.t
end

class transform : Raw.Transform.t -> transform_t
(** Wraps a layer 1 handle, {!Ocgsk.Raw.Transform.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GskTransform], give one already wrapped. *)

val new_ : unit -> transform_t
