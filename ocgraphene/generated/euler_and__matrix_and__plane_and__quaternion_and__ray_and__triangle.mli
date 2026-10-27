(** The classes of {!Ocgraphene.Euler}, {!Ocgraphene.Matrix},
    {!Ocgraphene.Plane}, {!Ocgraphene.Quaternion}, {!Ocgraphene.Ray},
    {!Ocgraphene.Triangle}, defined together because they refer to each other.
    Each has a module of its own that re-exports it; use that module rather than
    this one. *)

(** The methods, signals and properties of a [graphene_euler_t]. *)
class type euler_t = object
  method equal : Raw.Euler.t -> bool
  (** Checks if two #graphene_euler_t are equal. *)

  method get_alpha : unit -> float
  (** Retrieves the first component of the Euler angle vector, depending on the
      order of rotation.

      See also: graphene_euler_get_x() *)

  method get_beta : unit -> float
  (** Retrieves the second component of the Euler angle vector, depending on the
      order of rotation.

      See also: graphene_euler_get_y() *)

  method get_gamma : unit -> float
  (** Retrieves the third component of the Euler angle vector, depending on the
      order of rotation.

      See also: graphene_euler_get_z() *)

  method get_order : unit -> Enums.eulerorder
  (** Retrieves the order used to apply the rotations described in the
      #graphene_euler_t structure, when converting to and from other structures,
      like #graphene_quaternion_t and #graphene_matrix_t.

      This function does not return the [GRAPHENE_EULER_ORDER_DEFAULT]
      enumeration value; it will return the effective order of rotation instead.
  *)

  method get_x : unit -> float
  (** Retrieves the rotation angle on the X axis, in degrees. *)

  method get_y : unit -> float
  (** Retrieves the rotation angle on the Y axis, in degrees. *)

  method get_z : unit -> float
  (** Retrieves the rotation angle on the Z axis, in degrees. *)

  method init : float -> float -> float -> Raw.Euler.t
  (** Initializes a #graphene_euler_t using the given angles.

      The order of the rotations is [GRAPHENE_EULER_ORDER_DEFAULT]. *)

  method init_from_euler : Raw.Euler.t option -> Raw.Euler.t
  (** Initializes a #graphene_euler_t using the angles and order of another
      #graphene_euler_t.

      If the #graphene_euler_t [src] is [NULL], this function is equivalent to
      calling graphene_euler_init() with all angles set to 0. *)

  method init_from_matrix :
    Raw.Matrix.t option -> Enums.eulerorder -> Raw.Euler.t
  (** Initializes a #graphene_euler_t using the given rotation matrix.

      If the #graphene_matrix_t [m] is [NULL], the #graphene_euler_t will be
      initialized with all angles set to 0. *)

  method init_from_quaternion :
    Raw.Quaternion.t option -> Enums.eulerorder -> Raw.Euler.t
  (** Initializes a #graphene_euler_t using the given normalized quaternion.

      If the #graphene_quaternion_t [q] is [NULL], the #graphene_euler_t will be
      initialized with all angles set to 0. *)

  method init_from_radians :
    float -> float -> float -> Enums.eulerorder -> Raw.Euler.t
  (** Initializes a #graphene_euler_t using the given angles and order of
      rotation. *)

  method init_from_vec3 : Raw.Vec3.t option -> Enums.eulerorder -> Raw.Euler.t
  (** Initializes a #graphene_euler_t using the angles contained in a
      #graphene_vec3_t.

      If the #graphene_vec3_t [v] is [NULL], the #graphene_euler_t will be
      initialized with all angles set to 0. *)

  method init_with_order :
    float -> float -> float -> Enums.eulerorder -> Raw.Euler.t
  (** Initializes a #graphene_euler_t with the given angles and [order]. *)

  method as_euler : Raw.Euler.t
end

(** The methods, signals and properties of a [graphene_matrix_t]. *)
and matrix_t = object
  method determinant : unit -> float
  (** Computes the determinant of the given matrix. *)

  method equal : Raw.Matrix.t -> bool
  (** Checks whether the two given #graphene_matrix_t matrices are equal. *)

  method equal_fast : Raw.Matrix.t -> bool
  (** Checks whether the two given #graphene_matrix_t matrices are byte-by-byte
      equal.

      While this function is faster than graphene_matrix_equal(), it can also
      return false negatives, so it should be used in conjuction with either
      graphene_matrix_equal() or graphene_matrix_near(). For instance:

      {[
        if (graphene_matrix_equal_fast (a, b))
          {
            // matrices are definitely the same
          }
        else
          {
            if (graphene_matrix_equal (a, b))
              // matrices contain the same values within an epsilon of FLT_EPSILON
            else if (graphene_matrix_near (a, b, 0.0001))
              // matrices contain the same values within an epsilon of 0.0001
            else
              // matrices are not equal
          }
      ]} *)

  method get_value : int -> int -> float
  (** Retrieves the value at the given [row] and [col] index. *)

  method get_x_scale : unit -> float
  (** Retrieves the scaling factor on the X axis in [m]. *)

  method get_x_translation : unit -> float
  (** Retrieves the translation component on the X axis from [m]. *)

  method get_y_scale : unit -> float
  (** Retrieves the scaling factor on the Y axis in [m]. *)

  method get_y_translation : unit -> float
  (** Retrieves the translation component on the Y axis from [m]. *)

  method get_z_scale : unit -> float
  (** Retrieves the scaling factor on the Z axis in [m]. *)

  method get_z_translation : unit -> float
  (** Retrieves the translation component on the Z axis from [m]. *)

  method init_from_2d :
    float -> float -> float -> float -> float -> float -> Raw.Matrix.t
  (** Initializes a #graphene_matrix_t from the values of an affine
      transformation matrix.

      The arguments map to the following matrix layout:

      {[
        ⎛ xx  yx ⎞   ⎛  a   b  0 ⎞
        ⎜ xy  yy ⎟ = ⎜  c   d  0 ⎟
        ⎝ x0  y0 ⎠   ⎝ tx  ty  1 ⎠
      ]}

      This function can be used to convert between an affine matrix type from
      other libraries and a #graphene_matrix_t. *)

  method init_from_float : float array -> Raw.Matrix.t
  (** Initializes a #graphene_matrix_t with the given array of floating point
      values. *)

  method init_from_matrix : Raw.Matrix.t -> Raw.Matrix.t
  (** Initializes a #graphene_matrix_t using the values of the given matrix. *)

  method init_from_vec4 :
    Raw.Vec4.t -> Raw.Vec4.t -> Raw.Vec4.t -> Raw.Vec4.t -> Raw.Matrix.t
  (** Initializes a #graphene_matrix_t with the given four row vectors. *)

  method init_frustum :
    float -> float -> float -> float -> float -> float -> Raw.Matrix.t
  (** Initializes a #graphene_matrix_t compatible with #graphene_frustum_t.

      See also: graphene_frustum_init_from_matrix() *)

  method init_identity : unit -> Raw.Matrix.t
  (** Initializes a #graphene_matrix_t with the identity matrix. *)

  method init_look_at : Raw.Vec3.t -> Raw.Vec3.t -> Raw.Vec3.t -> Raw.Matrix.t
  [@@ocaml.doc
    "Initializes a #graphene_matrix_t so that it positions the \"camera\"\n\
     at the given [eye] coordinates towards an object at the [center]\n\
     coordinates. The top of the camera is aligned to the direction\n\
     of the [up] vector.\n\n\
     Before the transform, the camera is assumed to be placed at the\n\
     origin, looking towards the negative Z axis, with the top side of\n\
     the camera facing in the direction of the Y axis and the right\n\
     side in the direction of the X axis.\n\n\
     In theory, one could use [m] to transform a model of such a camera\n\
     into world-space. However, it is more common to use the inverse of\n\
     [m] to transform another object from world coordinates to the view\n\
     coordinates of the camera. Typically you would then apply the\n\
     camera projection transform to get from view to screen\n\
     coordinates."]

  method init_ortho :
    float -> float -> float -> float -> float -> float -> Raw.Matrix.t
  (** Initializes a #graphene_matrix_t with an orthographic projection. *)

  method init_perspective : float -> float -> float -> float -> Raw.Matrix.t
  (** Initializes a #graphene_matrix_t with a perspective projection. *)

  method init_rotate : float -> Raw.Vec3.t -> Raw.Matrix.t
  (** Initializes [m] to represent a rotation of [angle] degrees on the axis
      represented by the [axis] vector. *)

  method init_scale : float -> float -> float -> Raw.Matrix.t
  (** Initializes a #graphene_matrix_t with the given scaling factors. *)

  method init_skew : float -> float -> Raw.Matrix.t
  (** Initializes a #graphene_matrix_t with a skew transformation with the given
      factors. *)

  method init_translate : Raw.Point3_d.t -> Raw.Matrix.t
  (** Initializes a #graphene_matrix_t with a translation to the given
      coordinates. *)

  method is_2d : unit -> bool
  (** Checks whether the given #graphene_matrix_t is compatible with an a 2D
      affine transformation matrix. *)

  method is_backface_visible : unit -> bool
  (** Checks whether a #graphene_matrix_t has a visible back face. *)

  method is_identity : unit -> bool
  (** Checks whether the given #graphene_matrix_t is the identity matrix. *)

  method is_singular : unit -> bool
  (** Checks whether a matrix is singular. *)

  method near : Raw.Matrix.t -> float -> bool
  (** Compares the two given #graphene_matrix_t matrices and checks whether
      their values are within the given [epsilon] of each other. *)

  method print : unit -> unit
  (** Prints the contents of a matrix to the standard error stream.

      This function is only useful for debugging; there are no guarantees made
      on the format of the output. *)

  method rotate : float -> Raw.Vec3.t -> unit
  (** Adds a rotation transformation to [m], using the given [angle] and [axis]
      vector.

      This is the equivalent of calling graphene_matrix_init_rotate() and then
      multiplying the matrix [m] with the rotation matrix. *)

  method rotate_euler : Raw.Euler.t -> unit
  (** Adds a rotation transformation to [m], using the given #graphene_euler_t.
  *)

  method rotate_quaternion : Raw.Quaternion.t -> unit
  (** Adds a rotation transformation to [m], using the given
      #graphene_quaternion_t.

      This is the equivalent of calling graphene_quaternion_to_matrix() and then
      multiplying [m] with the rotation matrix. *)

  method rotate_x : float -> unit
  (** Adds a rotation transformation around the X axis to [m], using the given
      [angle].

      See also: graphene_matrix_rotate() *)

  method rotate_y : float -> unit
  (** Adds a rotation transformation around the Y axis to [m], using the given
      [angle].

      See also: graphene_matrix_rotate() *)

  method rotate_z : float -> unit
  (** Adds a rotation transformation around the Z axis to [m], using the given
      [angle].

      See also: graphene_matrix_rotate() *)

  method scale : float -> float -> float -> unit
  (** Adds a scaling transformation to [m], using the three given factors.

      This is the equivalent of calling graphene_matrix_init_scale() and then
      multiplying the matrix [m] with the scale matrix. *)

  method skew_xy : float -> unit
  (** Adds a skew of [factor] on the X and Y axis to the given matrix. *)

  method skew_xz : float -> unit
  (** Adds a skew of [factor] on the X and Z axis to the given matrix. *)

  method skew_yz : float -> unit
  (** Adds a skew of [factor] on the Y and Z axis to the given matrix. *)

  method translate : Raw.Point3_d.t -> unit
  (** Adds a translation transformation to [m] using the coordinates of the
      given #graphene_point3d_t.

      This is the equivalent of calling graphene_matrix_init_translate() and
      then multiplying [m] with the translation matrix. *)

  method as_matrix : Raw.Matrix.t
end

(** The methods, signals and properties of a [graphene_plane_t]. *)
and plane_t = object
  method distance : Raw.Point3_d.t -> float
  (** Computes the distance of [point] from a #graphene_plane_t. *)

  method equal : Raw.Plane.t -> bool
  (** Checks whether the two given #graphene_plane_t are equal. *)

  method get_constant : unit -> float
  (** Retrieves the distance along the normal vector of the given
      #graphene_plane_t from the origin. *)

  method init : Raw.Vec3.t option -> float -> Raw.Plane.t
  (** Initializes the given #graphene_plane_t using the given [normal] vector
      and [constant] values. *)

  method init_from_plane : Raw.Plane.t -> Raw.Plane.t
  (** Initializes the given #graphene_plane_t using the normal vector and
      constant of another #graphene_plane_t. *)

  method init_from_point : Raw.Vec3.t -> Raw.Point3_d.t -> Raw.Plane.t
  (** Initializes the given #graphene_plane_t using the given normal vector and
      an arbitrary co-planar point. *)

  method init_from_points :
    Raw.Point3_d.t -> Raw.Point3_d.t -> Raw.Point3_d.t -> Raw.Plane.t
  (** Initializes the given #graphene_plane_t using the 3 provided co-planar
      points.

      The winding order is counter-clockwise, and determines which direction the
      normal vector will point. *)

  method init_from_vec4 : Raw.Vec4.t -> Raw.Plane.t
  (** Initializes the given #graphene_plane_t using the components of the given
      #graphene_vec4_t vector. *)

  method as_plane : Raw.Plane.t
end

(** The methods, signals and properties of a [graphene_quaternion_t]. *)
and quaternion_t = object
  method dot : Raw.Quaternion.t -> float
  (** Computes the dot product of two #graphene_quaternion_t. *)

  method equal : Raw.Quaternion.t -> bool
  (** Checks whether the given quaternions are equal. *)

  method init : float -> float -> float -> float -> Raw.Quaternion.t
  (** Initializes a #graphene_quaternion_t using the given four values. *)

  method init_from_angle_vec3 : float -> Raw.Vec3.t -> Raw.Quaternion.t
  (** Initializes a #graphene_quaternion_t using an [angle] on a specific
      [axis]. *)

  method init_from_angles : float -> float -> float -> Raw.Quaternion.t
  (** Initializes a #graphene_quaternion_t using the values of the Euler angles
      on each axis.

      See also: graphene_quaternion_init_from_euler() *)

  method init_from_euler : Raw.Euler.t -> Raw.Quaternion.t
  (** Initializes a #graphene_quaternion_t using the given #graphene_euler_t. *)

  method init_from_matrix : Raw.Matrix.t -> Raw.Quaternion.t
  (** Initializes a #graphene_quaternion_t using the rotation components of a
      transformation matrix. *)

  method init_from_quaternion : Raw.Quaternion.t -> Raw.Quaternion.t
  (** Initializes a #graphene_quaternion_t with the values from [src]. *)

  method init_from_radians : float -> float -> float -> Raw.Quaternion.t
  (** Initializes a #graphene_quaternion_t using the values of the Euler angles
      on each axis.

      See also: graphene_quaternion_init_from_euler() *)

  method init_from_vec4 : Raw.Vec4.t -> Raw.Quaternion.t
  (** Initializes a #graphene_quaternion_t with the values from [src]. *)

  method init_identity : unit -> Raw.Quaternion.t
  (** Initializes a #graphene_quaternion_t using the identity transformation. *)

  method as_quaternion : Raw.Quaternion.t
end

(** The methods, signals and properties of a [graphene_ray_t]. *)
and ray_t = object
  method equal : Raw.Ray.t -> bool
  (** Checks whether the two given #graphene_ray_t are equal. *)

  method get_distance_to_plane : Raw.Plane.t -> float
  (** Computes the distance of the origin of the given #graphene_ray_t from the
      given plane.

      If the ray does not intersect the plane, this function returns [INFINITY].
  *)

  method get_distance_to_point : Raw.Point3_d.t -> float
  (** Computes the distance of the closest approach between the given
      #graphene_ray_t [r] and the point [p].

      The closest approach to a ray from a point is the distance between the
      point and the projection of the point on the ray itself. *)

  method init : Raw.Point3_d.t option -> Raw.Vec3.t option -> Raw.Ray.t
  (** Initializes the given #graphene_ray_t using the given [origin] and
      [direction] values. *)

  method init_from_ray : Raw.Ray.t -> Raw.Ray.t
  (** Initializes the given #graphene_ray_t using the origin and direction
      values of another #graphene_ray_t. *)

  method init_from_vec3 : Raw.Vec3.t option -> Raw.Vec3.t option -> Raw.Ray.t
  (** Initializes the given #graphene_ray_t using the given vectors. *)

  method intersects_box : Raw.Box.t -> bool
  (** Checks whether the given #graphene_ray_t [r] intersects the given
      #graphene_box_t [b].

      See also: graphene_ray_intersect_box() *)

  method intersects_sphere : Raw.Sphere.t -> bool
  (** Checks if the given #graphene_ray_t [r] intersects the given
      #graphene_sphere_t [s].

      See also: graphene_ray_intersect_sphere() *)

  method intersects_triangle : Raw.Triangle.t -> bool
  (** Checks whether the given #graphene_ray_t [r] intersects the given
      #graphene_triangle_t [b].

      See also: graphene_ray_intersect_triangle() *)

  method as_ray : Raw.Ray.t
end

(** The methods, signals and properties of a [graphene_triangle_t]. *)
and triangle_t = object
  method contains_point : Raw.Point3_d.t -> bool
  (** Checks whether the given triangle [t] contains the point [p]. *)

  method equal : Raw.Triangle.t -> bool
  (** Checks whether the two given #graphene_triangle_t are equal. *)

  method get_area : unit -> float
  (** Computes the area of the given #graphene_triangle_t. *)

  method init_from_float :
    float array -> float array -> float array -> Raw.Triangle.t
  (** Initializes a #graphene_triangle_t using the three given arrays of
      floating point values, each representing the coordinates of a point in 3D
      space. *)

  method init_from_point3d :
    Raw.Point3_d.t option ->
    Raw.Point3_d.t option ->
    Raw.Point3_d.t option ->
    Raw.Triangle.t
  (** Initializes a #graphene_triangle_t using the three given 3D points. *)

  method init_from_vec3 :
    Raw.Vec3.t option ->
    Raw.Vec3.t option ->
    Raw.Vec3.t option ->
    Raw.Triangle.t
  (** Initializes a #graphene_triangle_t using the three given vectors. *)

  method as_triangle : Raw.Triangle.t
end

(** Wraps a layer 1 handle, {!Ocgraphene.Raw.Euler.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [graphene_euler_t], give one already wrapped. *)
class euler : Raw.Euler.t -> euler_t
(** Wraps a layer 1 handle, {!Ocgraphene.Raw.Matrix.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [graphene_matrix_t], give one already wrapped. *)

and matrix : Raw.Matrix.t -> matrix_t
(** Wraps a layer 1 handle, {!Ocgraphene.Raw.Plane.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [graphene_plane_t], give one already wrapped. *)

and plane : Raw.Plane.t -> plane_t
(** Wraps a layer 1 handle, {!Ocgraphene.Raw.Quaternion.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [graphene_quaternion_t], give one already wrapped. *)

and quaternion : Raw.Quaternion.t -> quaternion_t
(** Wraps a layer 1 handle, {!Ocgraphene.Raw.Ray.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [graphene_ray_t], give one already wrapped. *)

and ray : Raw.Ray.t -> ray_t
(** Wraps a layer 1 handle, {!Ocgraphene.Raw.Triangle.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [graphene_triangle_t], give one already wrapped. *)

and triangle : Raw.Triangle.t -> triangle_t

val alloc : unit -> euler_t
(** Allocates a new #graphene_euler_t.

    The contents of the returned structure are undefined. *)

val alloc : unit -> matrix_t
(** Allocates a new #graphene_matrix_t. *)

val alloc : unit -> quaternion_t
(** Allocates a new #graphene_quaternion_t.

    The contents of the returned value are undefined. *)

val alloc : unit -> ray_t
(** Allocates a new #graphene_ray_t structure.

    The contents of the returned structure are undefined. *)

val alloc : unit -> plane_t
(** Allocates a new #graphene_plane_t structure.

    The contents of the returned structure are undefined. *)

val alloc : unit -> triangle_t
(** Allocates a new #graphene_triangle_t.

    The contents of the returned structure are undefined. *)
