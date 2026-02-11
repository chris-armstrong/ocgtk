(* GENERATED CODE - DO NOT EDIT *)
(* Vec2: Vec2 *)

(** A structure capable of holding a vector with two dimensions, x and y.

The contents of the #graphene_vec2_t structure are private and should
never be accessed directly. *)
type t = [`vec2] Gobject.obj

(** Create a new Vec2 *)
external alloc : unit -> t = "ml_graphene_vec2_alloc"

(* Methods *)
(** Stores the components of @v into an array. *)
external to_float : t -> float array = "ml_graphene_vec2_to_float"

(** Subtracts from each component of the first operand @a the
corresponding component of the second operand @b and places
each result into the components of @res. *)
external subtract : t -> t -> t = "ml_graphene_vec2_subtract"

(** Multiplies all components of the given vector with the given scalar @factor. *)
external scale : t -> float -> t = "ml_graphene_vec2_scale"

(** Computes the normalized vector for the given vector @v. *)
external normalize : t -> t = "ml_graphene_vec2_normalize"

(** Negates the given #graphene_vec2_t. *)
external negate : t -> t = "ml_graphene_vec2_negate"

(** Compares the two given #graphene_vec2_t vectors and checks
whether their values are within the given @epsilon. *)
external near : t -> t -> float -> bool = "ml_graphene_vec2_near"

(** Multiplies each component of the two passed vectors and places
each result into the components of @res. *)
external multiply : t -> t -> t = "ml_graphene_vec2_multiply"

(** Compares the two given vectors and places the minimum
values of each component into @res. *)
external min : t -> t -> t = "ml_graphene_vec2_min"

(** Compares the two given vectors and places the maximum
values of each component into @res. *)
external max : t -> t -> t = "ml_graphene_vec2_max"

(** Computes the length of the given vector. *)
external length : t -> float = "ml_graphene_vec2_length"

(** Linearly interpolates @v1 and @v2 using the given @factor. *)
external interpolate : t -> t -> float -> t = "ml_graphene_vec2_interpolate"

(** Copies the contents of @src into @v. *)
external init_from_vec2 : t -> t -> t = "ml_graphene_vec2_init_from_vec2"

(** Initializes @v with the contents of the given array. *)
external init_from_float : t -> float array -> t = "ml_graphene_vec2_init_from_float"

(** Initializes a #graphene_vec2_t using the given values.

This function can be called multiple times. *)
external init : t -> float -> float -> t = "ml_graphene_vec2_init"

(** Retrieves the Y component of the #graphene_vec2_t. *)
external get_y : t -> float = "ml_graphene_vec2_get_y"

(** Retrieves the X component of the #graphene_vec2_t. *)
external get_x : t -> float = "ml_graphene_vec2_get_x"

(** Frees the resources allocated by @v *)
external free : t -> unit = "ml_graphene_vec2_free"

(** Checks whether the two given #graphene_vec2_t are equal. *)
external equal : t -> t -> bool = "ml_graphene_vec2_equal"

(** Computes the dot product of the two given vectors. *)
external dot : t -> t -> float = "ml_graphene_vec2_dot"

(** Divides each component of the first operand @a by the corresponding
component of the second operand @b, and places the results into the
vector @res. *)
external divide : t -> t -> t = "ml_graphene_vec2_divide"

(** Adds each component of the two passed vectors and places
each result into the components of @res. *)
external add : t -> t -> t = "ml_graphene_vec2_add"

