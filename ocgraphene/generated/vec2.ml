class type vec2_t = object
  (** {2:methods Methods} *)

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

  (** {2:conversions Conversions} *)

  method as_vec2 : Raw.Vec2.t
end

(* High-level class for Vec2 *)
class vec2 (obj : Raw.Vec2.t) : vec2_t =
  object (self)
    method dot : Raw.Vec2.t -> float = fun b -> Raw.Vec2.dot obj b
    method equal : Raw.Vec2.t -> bool = fun v2 -> Raw.Vec2.equal obj v2
    method get_x : unit -> float = fun () -> Raw.Vec2.get_x obj
    method get_y : unit -> float = fun () -> Raw.Vec2.get_y obj

    method init : float -> float -> Raw.Vec2.t =
      fun x y -> Raw.Vec2.init obj x y

    method init_from_float : float array -> Raw.Vec2.t =
      fun src -> Raw.Vec2.init_from_float obj src

    method init_from_vec2 : Raw.Vec2.t -> Raw.Vec2.t =
      fun src -> Raw.Vec2.init_from_vec2 obj src

    method length : unit -> float = fun () -> Raw.Vec2.length obj

    method near : Raw.Vec2.t -> float -> bool =
      fun v2 epsilon -> Raw.Vec2.near obj v2 epsilon

    method as_vec2 = obj
  end

let alloc () : vec2_t = new vec2 (Raw.Vec2.alloc ())
