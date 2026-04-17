(* GENERATED CODE - DO NOT EDIT *)
(* Combined modules for cyclic dependencies *)

module rec Vec3 : sig
  type t = [`vec3] Gobject.obj

  (** Create a new Vec3 *)
  external alloc : unit -> t = "ml_graphene_vec3_alloc"

  (* Methods *)
  (** Copies the components of a #graphene_vec3_t into the given array. *)
  external to_float : t -> float array = "ml_graphene_vec3_to_float"

  (** Subtracts from each component of the first operand @a the
  corresponding component of the second operand @b and places
  each result into the components of @res. *)
  external subtract : t -> t -> t = "ml_graphene_vec3_subtract"

  (** Multiplies all components of the given vector with the given scalar @factor. *)
  external scale : t -> float -> t = "ml_graphene_vec3_scale"

  (** Normalizes the given #graphene_vec3_t. *)
  external normalize : t -> t = "ml_graphene_vec3_normalize"

  (** Negates the given #graphene_vec3_t. *)
  external negate : t -> t = "ml_graphene_vec3_negate"

  (** Compares the two given #graphene_vec3_t vectors and checks
  whether their values are within the given @epsilon. *)
  external near : t -> t -> float -> bool = "ml_graphene_vec3_near"

  (** Multiplies each component of the two given vectors. *)
  external multiply : t -> t -> t = "ml_graphene_vec3_multiply"

  (** Compares each component of the two given vectors and creates a
  vector that contains the minimum values. *)
  external min : t -> t -> t = "ml_graphene_vec3_min"

  (** Compares each component of the two given vectors and creates a
  vector that contains the maximum values. *)
  external max : t -> t -> t = "ml_graphene_vec3_max"

  (** Retrieves the length of the given vector @v. *)
  external length : t -> float = "ml_graphene_vec3_length"

  (** Linearly interpolates @v1 and @v2 using the given @factor. *)
  external interpolate : t -> t -> float -> t = "ml_graphene_vec3_interpolate"

  (** Initializes a #graphene_vec3_t with the values of another
  #graphene_vec3_t. *)
  external init_from_vec3 : t -> t -> t = "ml_graphene_vec3_init_from_vec3"

  (** Initializes a #graphene_vec3_t with the values from an array. *)
  external init_from_float : t -> float array -> t = "ml_graphene_vec3_init_from_float"

  (** Initializes a #graphene_vec3_t using the given values.

  This function can be called multiple times. *)
  external init : t -> float -> float -> float -> t = "ml_graphene_vec3_init"

  (** Retrieves the third component of the given vector @v. *)
  external get_z : t -> float = "ml_graphene_vec3_get_z"

  (** Retrieves the second component of the given vector @v. *)
  external get_y : t -> float = "ml_graphene_vec3_get_y"

  (** Converts a #graphene_vec3_t in a #graphene_vec4_t using @w as
  the value of the fourth component of the resulting vector. *)
  external get_xyzw : t -> float -> Vec4.t = "ml_graphene_vec3_get_xyzw"

  (** Converts a #graphene_vec3_t in a #graphene_vec4_t using 1.0
  as the value for the fourth component of the resulting vector. *)
  external get_xyz1 : t -> Vec4.t = "ml_graphene_vec3_get_xyz1"

  (** Converts a #graphene_vec3_t in a #graphene_vec4_t using 0.0
  as the value for the fourth component of the resulting vector. *)
  external get_xyz0 : t -> Vec4.t = "ml_graphene_vec3_get_xyz0"

  (** Creates a #graphene_vec3_t that contains the first two components of
  the given #graphene_vec3_t, and the third component set to 0. *)
  external get_xy0 : t -> t = "ml_graphene_vec3_get_xy0"

  (** Creates a #graphene_vec2_t that contains the first and second
  components of the given #graphene_vec3_t. *)
  external get_xy : t -> Vec2.t = "ml_graphene_vec3_get_xy"

  (** Retrieves the first component of the given vector @v. *)
  external get_x : t -> float = "ml_graphene_vec3_get_x"

  (** Frees the resources allocated by @v *)
  external free : t -> unit = "ml_graphene_vec3_free"

  (** Checks whether the two given #graphene_vec3_t are equal. *)
  external equal : t -> t -> bool = "ml_graphene_vec3_equal"

  (** Computes the dot product of the two given vectors. *)
  external dot : t -> t -> float = "ml_graphene_vec3_dot"

  (** Divides each component of the first operand @a by the corresponding
  component of the second operand @b, and places the results into the
  vector @res. *)
  external divide : t -> t -> t = "ml_graphene_vec3_divide"

  (** Computes the cross product of the two given vectors. *)
  external cross : t -> t -> t = "ml_graphene_vec3_cross"

  (** Adds each component of the two given vectors. *)
  external add : t -> t -> t = "ml_graphene_vec3_add"


end = struct
  type t = [`vec3] Gobject.obj

  (** Create a new Vec3 *)
  external alloc : unit -> t = "ml_graphene_vec3_alloc"

  (* Methods *)
  (** Copies the components of a #graphene_vec3_t into the given array. *)
  external to_float : t -> float array = "ml_graphene_vec3_to_float"

  (** Subtracts from each component of the first operand @a the
  corresponding component of the second operand @b and places
  each result into the components of @res. *)
  external subtract : t -> t -> t = "ml_graphene_vec3_subtract"

  (** Multiplies all components of the given vector with the given scalar @factor. *)
  external scale : t -> float -> t = "ml_graphene_vec3_scale"

  (** Normalizes the given #graphene_vec3_t. *)
  external normalize : t -> t = "ml_graphene_vec3_normalize"

  (** Negates the given #graphene_vec3_t. *)
  external negate : t -> t = "ml_graphene_vec3_negate"

  (** Compares the two given #graphene_vec3_t vectors and checks
  whether their values are within the given @epsilon. *)
  external near : t -> t -> float -> bool = "ml_graphene_vec3_near"

  (** Multiplies each component of the two given vectors. *)
  external multiply : t -> t -> t = "ml_graphene_vec3_multiply"

  (** Compares each component of the two given vectors and creates a
  vector that contains the minimum values. *)
  external min : t -> t -> t = "ml_graphene_vec3_min"

  (** Compares each component of the two given vectors and creates a
  vector that contains the maximum values. *)
  external max : t -> t -> t = "ml_graphene_vec3_max"

  (** Retrieves the length of the given vector @v. *)
  external length : t -> float = "ml_graphene_vec3_length"

  (** Linearly interpolates @v1 and @v2 using the given @factor. *)
  external interpolate : t -> t -> float -> t = "ml_graphene_vec3_interpolate"

  (** Initializes a #graphene_vec3_t with the values of another
  #graphene_vec3_t. *)
  external init_from_vec3 : t -> t -> t = "ml_graphene_vec3_init_from_vec3"

  (** Initializes a #graphene_vec3_t with the values from an array. *)
  external init_from_float : t -> float array -> t = "ml_graphene_vec3_init_from_float"

  (** Initializes a #graphene_vec3_t using the given values.

  This function can be called multiple times. *)
  external init : t -> float -> float -> float -> t = "ml_graphene_vec3_init"

  (** Retrieves the third component of the given vector @v. *)
  external get_z : t -> float = "ml_graphene_vec3_get_z"

  (** Retrieves the second component of the given vector @v. *)
  external get_y : t -> float = "ml_graphene_vec3_get_y"

  (** Converts a #graphene_vec3_t in a #graphene_vec4_t using @w as
  the value of the fourth component of the resulting vector. *)
  external get_xyzw : t -> float -> Vec4.t = "ml_graphene_vec3_get_xyzw"

  (** Converts a #graphene_vec3_t in a #graphene_vec4_t using 1.0
  as the value for the fourth component of the resulting vector. *)
  external get_xyz1 : t -> Vec4.t = "ml_graphene_vec3_get_xyz1"

  (** Converts a #graphene_vec3_t in a #graphene_vec4_t using 0.0
  as the value for the fourth component of the resulting vector. *)
  external get_xyz0 : t -> Vec4.t = "ml_graphene_vec3_get_xyz0"

  (** Creates a #graphene_vec3_t that contains the first two components of
  the given #graphene_vec3_t, and the third component set to 0. *)
  external get_xy0 : t -> t = "ml_graphene_vec3_get_xy0"

  (** Creates a #graphene_vec2_t that contains the first and second
  components of the given #graphene_vec3_t. *)
  external get_xy : t -> Vec2.t = "ml_graphene_vec3_get_xy"

  (** Retrieves the first component of the given vector @v. *)
  external get_x : t -> float = "ml_graphene_vec3_get_x"

  (** Frees the resources allocated by @v *)
  external free : t -> unit = "ml_graphene_vec3_free"

  (** Checks whether the two given #graphene_vec3_t are equal. *)
  external equal : t -> t -> bool = "ml_graphene_vec3_equal"

  (** Computes the dot product of the two given vectors. *)
  external dot : t -> t -> float = "ml_graphene_vec3_dot"

  (** Divides each component of the first operand @a by the corresponding
  component of the second operand @b, and places the results into the
  vector @res. *)
  external divide : t -> t -> t = "ml_graphene_vec3_divide"

  (** Computes the cross product of the two given vectors. *)
  external cross : t -> t -> t = "ml_graphene_vec3_cross"

  (** Adds each component of the two given vectors. *)
  external add : t -> t -> t = "ml_graphene_vec3_add"


end

and Vec4
 : sig
  type t = [`vec4] Gobject.obj

  (** Create a new Vec4 *)
  external alloc : unit -> t = "ml_graphene_vec4_alloc"

  (* Methods *)
  (** Stores the components of the given #graphene_vec4_t into an array
  of floating point values. *)
  external to_float : t -> float array = "ml_graphene_vec4_to_float"

  (** Subtracts from each component of the first operand @a the
  corresponding component of the second operand @b and places
  each result into the components of @res. *)
  external subtract : t -> t -> t = "ml_graphene_vec4_subtract"

  (** Multiplies all components of the given vector with the given scalar @factor. *)
  external scale : t -> float -> t = "ml_graphene_vec4_scale"

  (** Normalizes the given #graphene_vec4_t. *)
  external normalize : t -> t = "ml_graphene_vec4_normalize"

  (** Negates the given #graphene_vec4_t. *)
  external negate : t -> t = "ml_graphene_vec4_negate"

  (** Compares the two given #graphene_vec4_t vectors and checks
  whether their values are within the given @epsilon. *)
  external near : t -> t -> float -> bool = "ml_graphene_vec4_near"

  (** Multiplies each component of the two given vectors. *)
  external multiply : t -> t -> t = "ml_graphene_vec4_multiply"

  (** Compares each component of the two given vectors and creates a
  vector that contains the minimum values. *)
  external min : t -> t -> t = "ml_graphene_vec4_min"

  (** Compares each component of the two given vectors and creates a
  vector that contains the maximum values. *)
  external max : t -> t -> t = "ml_graphene_vec4_max"

  (** Computes the length of the given #graphene_vec4_t. *)
  external length : t -> float = "ml_graphene_vec4_length"

  (** Linearly interpolates @v1 and @v2 using the given @factor. *)
  external interpolate : t -> t -> float -> t = "ml_graphene_vec4_interpolate"

  (** Initializes a #graphene_vec4_t using the components of
  another #graphene_vec4_t. *)
  external init_from_vec4 : t -> t -> t = "ml_graphene_vec4_init_from_vec4"

  (** Initializes a #graphene_vec4_t using the components of a
  #graphene_vec3_t and the value of @w. *)
  external init_from_vec3 : t -> Vec3.t -> float -> t = "ml_graphene_vec4_init_from_vec3"

  (** Initializes a #graphene_vec4_t using the components of a
  #graphene_vec2_t and the values of @z and @w. *)
  external init_from_vec2 : t -> Vec2.t -> float -> float -> t = "ml_graphene_vec4_init_from_vec2"

  (** Initializes a #graphene_vec4_t with the values inside the given array. *)
  external init_from_float : t -> float array -> t = "ml_graphene_vec4_init_from_float"

  (** Initializes a #graphene_vec4_t using the given values.

  This function can be called multiple times. *)
  external init : t -> float -> float -> float -> float -> t = "ml_graphene_vec4_init"

  (** Retrieves the value of the third component of the given #graphene_vec4_t. *)
  external get_z : t -> float = "ml_graphene_vec4_get_z"

  (** Retrieves the value of the second component of the given #graphene_vec4_t. *)
  external get_y : t -> float = "ml_graphene_vec4_get_y"

  (** Creates a #graphene_vec3_t that contains the first three components
  of the given #graphene_vec4_t. *)
  external get_xyz : t -> Vec3.t = "ml_graphene_vec4_get_xyz"

  (** Creates a #graphene_vec2_t that contains the first two components
  of the given #graphene_vec4_t. *)
  external get_xy : t -> Vec2.t = "ml_graphene_vec4_get_xy"

  (** Retrieves the value of the first component of the given #graphene_vec4_t. *)
  external get_x : t -> float = "ml_graphene_vec4_get_x"

  (** Retrieves the value of the fourth component of the given #graphene_vec4_t. *)
  external get_w : t -> float = "ml_graphene_vec4_get_w"

  (** Frees the resources allocated by @v *)
  external free : t -> unit = "ml_graphene_vec4_free"

  (** Checks whether the two given #graphene_vec4_t are equal. *)
  external equal : t -> t -> bool = "ml_graphene_vec4_equal"

  (** Computes the dot product of the two given vectors. *)
  external dot : t -> t -> float = "ml_graphene_vec4_dot"

  (** Divides each component of the first operand @a by the corresponding
  component of the second operand @b, and places the results into the
  vector @res. *)
  external divide : t -> t -> t = "ml_graphene_vec4_divide"

  (** Adds each component of the two given vectors. *)
  external add : t -> t -> t = "ml_graphene_vec4_add"


end = struct
  type t = [`vec4] Gobject.obj

  (** Create a new Vec4 *)
  external alloc : unit -> t = "ml_graphene_vec4_alloc"

  (* Methods *)
  (** Stores the components of the given #graphene_vec4_t into an array
  of floating point values. *)
  external to_float : t -> float array = "ml_graphene_vec4_to_float"

  (** Subtracts from each component of the first operand @a the
  corresponding component of the second operand @b and places
  each result into the components of @res. *)
  external subtract : t -> t -> t = "ml_graphene_vec4_subtract"

  (** Multiplies all components of the given vector with the given scalar @factor. *)
  external scale : t -> float -> t = "ml_graphene_vec4_scale"

  (** Normalizes the given #graphene_vec4_t. *)
  external normalize : t -> t = "ml_graphene_vec4_normalize"

  (** Negates the given #graphene_vec4_t. *)
  external negate : t -> t = "ml_graphene_vec4_negate"

  (** Compares the two given #graphene_vec4_t vectors and checks
  whether their values are within the given @epsilon. *)
  external near : t -> t -> float -> bool = "ml_graphene_vec4_near"

  (** Multiplies each component of the two given vectors. *)
  external multiply : t -> t -> t = "ml_graphene_vec4_multiply"

  (** Compares each component of the two given vectors and creates a
  vector that contains the minimum values. *)
  external min : t -> t -> t = "ml_graphene_vec4_min"

  (** Compares each component of the two given vectors and creates a
  vector that contains the maximum values. *)
  external max : t -> t -> t = "ml_graphene_vec4_max"

  (** Computes the length of the given #graphene_vec4_t. *)
  external length : t -> float = "ml_graphene_vec4_length"

  (** Linearly interpolates @v1 and @v2 using the given @factor. *)
  external interpolate : t -> t -> float -> t = "ml_graphene_vec4_interpolate"

  (** Initializes a #graphene_vec4_t using the components of
  another #graphene_vec4_t. *)
  external init_from_vec4 : t -> t -> t = "ml_graphene_vec4_init_from_vec4"

  (** Initializes a #graphene_vec4_t using the components of a
  #graphene_vec3_t and the value of @w. *)
  external init_from_vec3 : t -> Vec3.t -> float -> t = "ml_graphene_vec4_init_from_vec3"

  (** Initializes a #graphene_vec4_t using the components of a
  #graphene_vec2_t and the values of @z and @w. *)
  external init_from_vec2 : t -> Vec2.t -> float -> float -> t = "ml_graphene_vec4_init_from_vec2"

  (** Initializes a #graphene_vec4_t with the values inside the given array. *)
  external init_from_float : t -> float array -> t = "ml_graphene_vec4_init_from_float"

  (** Initializes a #graphene_vec4_t using the given values.

  This function can be called multiple times. *)
  external init : t -> float -> float -> float -> float -> t = "ml_graphene_vec4_init"

  (** Retrieves the value of the third component of the given #graphene_vec4_t. *)
  external get_z : t -> float = "ml_graphene_vec4_get_z"

  (** Retrieves the value of the second component of the given #graphene_vec4_t. *)
  external get_y : t -> float = "ml_graphene_vec4_get_y"

  (** Creates a #graphene_vec3_t that contains the first three components
  of the given #graphene_vec4_t. *)
  external get_xyz : t -> Vec3.t = "ml_graphene_vec4_get_xyz"

  (** Creates a #graphene_vec2_t that contains the first two components
  of the given #graphene_vec4_t. *)
  external get_xy : t -> Vec2.t = "ml_graphene_vec4_get_xy"

  (** Retrieves the value of the first component of the given #graphene_vec4_t. *)
  external get_x : t -> float = "ml_graphene_vec4_get_x"

  (** Retrieves the value of the fourth component of the given #graphene_vec4_t. *)
  external get_w : t -> float = "ml_graphene_vec4_get_w"

  (** Frees the resources allocated by @v *)
  external free : t -> unit = "ml_graphene_vec4_free"

  (** Checks whether the two given #graphene_vec4_t are equal. *)
  external equal : t -> t -> bool = "ml_graphene_vec4_equal"

  (** Computes the dot product of the two given vectors. *)
  external dot : t -> t -> float = "ml_graphene_vec4_dot"

  (** Divides each component of the first operand @a by the corresponding
  component of the second operand @b, and places the results into the
  vector @res. *)
  external divide : t -> t -> t = "ml_graphene_vec4_divide"

  (** Adds each component of the two given vectors. *)
  external add : t -> t -> t = "ml_graphene_vec4_add"


end
