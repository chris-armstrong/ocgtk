(** The classes of {!Ocgdk.Cicp_params}, {!Ocgdk.Color_state}, defined together
    because they refer to each other. Each has a module of its own that
    re-exports it; use that module rather than this one. *)

(** The methods, signals and properties of a [GdkCicpParams]. *)
class type cicp_params_t = object
  method build_color_state : unit -> (Raw.Color_state.t, GError.t) result
  (** Creates a new [GdkColorState] object for the cicp parameters in [self].

      Note that this may fail if the cicp parameters in [self] are not supported
      by GTK. In that case, [NULL] is returned, and [error] is set with an error
      message that can be presented to the user. *)

  method get_color_primaries : unit -> int
  (** Returns the value of the color-primaries property of [self]. *)

  method get_matrix_coefficients : unit -> int
  (** Gets the matrix-coefficients property of [self]. *)

  method get_range : unit -> Enums.cicprange
  (** Gets the range property of [self]. *)

  method get_transfer_function : unit -> int
  (** Gets the transfer-function property of [self]. *)

  method set_color_primaries : int -> unit
  (** Sets the color-primaries property of [self]. *)

  method set_matrix_coefficients : int -> unit
  (** [self] a [GdkCicpParams] Sets the matrix-coefficients property of [self].
  *)

  method set_range : Enums.cicprange -> unit
  (** Sets the range property of [self] *)

  method set_transfer_function : int -> unit
  (** Sets the transfer-function property of [self]. *)

  method as_cicp_params : Raw.Cicp_params.t
end

(** The methods, signals and properties of a [GdkColorState]. *)
and color_state_t = object
  method create_cicp_params : unit -> cicp_params_t option
  (** Create a [Gdk.CicpParams] representing the colorstate.

      It is not guaranteed that every [GdkColorState] can be represented with
      Cicp parameters. If that is the case, this function returns [NULL]. *)

  method equal : Raw.Color_state.t -> bool
  (** Compares two [GdkColorStates] for equality.

      Note that this function is not guaranteed to be perfect and two objects
      describing the same color state may compare not equal. However, different
      color states will never compare equal. *)

  method equivalent : Raw.Color_state.t -> bool
  (** Compares two [GdkColorStates] for equivalence.

      Two objects that represent the same color state should be equivalent, even
      though they may not be equal in the sense of [Gdk.ColorState.equal]. *)

  method ref : unit -> Raw.Color_state.t
  (** Increase the reference count of [self]. *)

  method as_color_state : Raw.Color_state.t
end

(** Wraps a layer 1 handle, {!Ocgdk.Raw.Cicp_params.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [GdkCicpParams], give one already wrapped. *)
class cicp_params : Raw.Cicp_params.t -> cicp_params_t
(** Wraps a layer 1 handle, {!Ocgdk.Raw.Color_state.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [GdkColorState], give one already wrapped. *)

and color_state : Raw.Color_state.t -> color_state_t

val new_ : unit -> cicp_params_t
