(** A structure capable of holding a vector with two dimensions, x and y.

    Its methods, signals and properties are on {!class-type-vec2_t}. Its full
    description is under {!section-description}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgraphene.Raw.Vec2}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [Vec2].}

    A structure capable of holding a vector with two dimensions, x and y.

    The contents of the #graphene_vec2_t structure are private and should never
    be accessed directly. *)
class type vec2_t = object
  method dot : Raw.Vec2.t -> float
  (** Computes the dot product of the two given vectors. *)

  method equal : Raw.Vec2.t -> bool
  (** Checks whether the two given #graphene_vec2_t are equal. *)

  method get_x : unit -> float
  (** Retrieves the X component of the #graphene_vec2_t. *)

  method get_y : unit -> float
  (** Retrieves the Y component of the #graphene_vec2_t. *)

  method init : float -> float -> Raw.Vec2.t
  (** Initializes a #graphene_vec2_t using the given values.

      This function can be called multiple times. *)

  method init_from_float : float array -> Raw.Vec2.t
  (** Initializes [v] with the contents of the given array. *)

  method init_from_vec2 : Raw.Vec2.t -> Raw.Vec2.t
  (** Copies the contents of [src] into [v]. *)

  method length : unit -> float
  (** Computes the length of the given vector. *)

  method near : Raw.Vec2.t -> float -> bool
  (** Compares the two given #graphene_vec2_t vectors and checks whether their
      values are within the given [epsilon]. *)

  method as_vec2 : Raw.Vec2.t
end

class vec2 : Raw.Vec2.t -> vec2_t
(** Wraps a raw handle of {!Ocgraphene.Raw.Vec2.t}. *)

(** {1:description Description}

    A structure capable of holding a vector with two dimensions, x and y.

    The contents of the #graphene_vec2_t structure are private and should never
    be accessed directly. *)

(** {1:constructors Constructors} *)

val alloc : unit -> vec2_t
(** Allocates a new #graphene_vec2_t structure.

    The contents of the returned structure are undefined.

    Use graphene_vec2_init() to initialize the vector. *)
