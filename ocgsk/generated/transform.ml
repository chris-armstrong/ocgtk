class type transform_t = object
  (** {2:methods Methods} *)

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

  (** {2:conversions Conversions} *)

  method as_transform : Raw.Transform.t
end

(* High-level class for Transform *)
class transform (obj : Raw.Transform.t) : transform_t =
  object (self)
    method equal : Raw.Transform.t option -> bool =
      fun second -> Raw.Transform.equal obj second

    method get_category : unit -> Enums.transformcategory =
      fun () -> Raw.Transform.get_category obj

    method invert : unit -> Raw.Transform.t option =
      fun () -> Raw.Transform.invert obj

    method matrix : Ocgraphene.Matrix.matrix_t -> Raw.Transform.t =
      fun matrix ->
        let matrix = matrix#as_matrix in
        Raw.Transform.matrix obj matrix

    method matrix_2d :
        float ->
        float ->
        float ->
        float ->
        float ->
        float ->
        Raw.Transform.t option =
      fun xx yx xy yy dx dy -> Raw.Transform.matrix_2d obj xx yx xy yy dx dy

    method perspective : float -> Raw.Transform.t =
      fun depth -> Raw.Transform.perspective obj depth

    method ref : unit -> Raw.Transform.t option =
      fun () -> Raw.Transform.ref obj

    method rotate : float -> Raw.Transform.t option =
      fun angle -> Raw.Transform.rotate obj angle

    method rotate_3d : float -> Ocgraphene.Vec3.vec3_t -> Raw.Transform.t option
        =
      fun angle axis ->
        let axis = axis#as_vec3 in
        Raw.Transform.rotate_3d obj angle axis

    method scale : float -> float -> Raw.Transform.t option =
      fun factor_x factor_y -> Raw.Transform.scale obj factor_x factor_y

    method scale_3d : float -> float -> float -> Raw.Transform.t option =
      fun factor_x factor_y factor_z ->
        Raw.Transform.scale_3d obj factor_x factor_y factor_z

    method skew : float -> float -> Raw.Transform.t option =
      fun skew_x skew_y -> Raw.Transform.skew obj skew_x skew_y

    method to_string : unit -> string = fun () -> Raw.Transform.to_string obj

    method transform : Raw.Transform.t option -> Raw.Transform.t option =
      fun other -> Raw.Transform.transform obj other

    method translate : Ocgraphene.Point.point_t -> Raw.Transform.t option =
      fun point ->
        let point = point#as_point in
        Raw.Transform.translate obj point

    method translate_3d :
        Ocgraphene.Point3_d.point3_d_t -> Raw.Transform.t option =
      fun point ->
        let point = point#as_point3_d in
        Raw.Transform.translate_3d obj point

    method as_transform = obj
  end

let new_ () : transform_t = new transform (Raw.Transform.new_ ())
