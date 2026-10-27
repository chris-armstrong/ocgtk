(* GENERATED CODE - DO NOT EDIT *)
(* Combined classes for cyclic dependencies *)

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

class cicp_params (obj : Raw.Cicp_params.t) : cicp_params_t =
  object (self)
    method build_color_state : unit -> (Raw.Color_state.t, GError.t) result =
      fun () -> Raw.Cicp_params.build_color_state obj

    method get_color_primaries : unit -> int =
      fun () -> Raw.Cicp_params.get_color_primaries obj

    method get_matrix_coefficients : unit -> int =
      fun () -> Raw.Cicp_params.get_matrix_coefficients obj

    method get_range : unit -> Enums.cicprange =
      fun () -> Raw.Cicp_params.get_range obj

    method get_transfer_function : unit -> int =
      fun () -> Raw.Cicp_params.get_transfer_function obj

    method set_color_primaries : int -> unit =
      fun color_primaries ->
        Raw.Cicp_params.set_color_primaries obj color_primaries

    method set_matrix_coefficients : int -> unit =
      fun matrix_coefficients ->
        Raw.Cicp_params.set_matrix_coefficients obj matrix_coefficients

    method set_range : Enums.cicprange -> unit =
      fun range -> Raw.Cicp_params.set_range obj range

    method set_transfer_function : int -> unit =
      fun transfer_function ->
        Raw.Cicp_params.set_transfer_function obj transfer_function

    method as_cicp_params = obj
  end

and color_state (obj : Raw.Color_state.t) : color_state_t =
  object (self)
    method create_cicp_params : unit -> cicp_params_t option =
      fun () ->
        Option.map
          (fun ret -> new cicp_params ret)
          (Raw.Color_state.create_cicp_params obj)

    method equal : Raw.Color_state.t -> bool =
      fun other -> Raw.Color_state.equal obj other

    method equivalent : Raw.Color_state.t -> bool =
      fun other -> Raw.Color_state.equivalent obj other

    method ref : unit -> Raw.Color_state.t = fun () -> Raw.Color_state.ref obj
    method as_color_state = obj
  end

let new_ () : cicp_params_t = new cicp_params (Raw.Cicp_params.new_ ())
