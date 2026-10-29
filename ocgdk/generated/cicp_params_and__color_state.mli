(** The classes of {!Ocgdk.Cicp_params}, {!Ocgdk.Color_state}, defined together
    because they refer to each other. Each has a module of its own that
    re-exports it; use that module rather than this one. *)

(** {b The methods, signals and properties of a [CicpParams].}

    Contains the parameters that define a colorstate with cicp parameters.

    Cicp parameters are specified in the ITU-T H.273
    {{:https://www.itu.int/rec/T-REC-H.273/en}specification}.

    See the documentation of individual properties for supported values.

    The 'unspecified' value (2) is not treated in any special way, and must be
    replaced by a different value before creating a color state.

    [GdkCicpParams] can be used as a builder object to construct a color state
    from Cicp data with
    {{!Ocgdk.Cicp_params.class-type-cicp_params_t.method-build_color_state}[Gdk.CicpParams.build_color_state]}.
    The function will return an error if the given parameters are not supported.

    You can obtain a [GdkCicpParams] object from a color state with
    {{!Ocgdk.Color_state.class-type-color_state_t.method-create_cicp_params}[Gdk.ColorState.create_cicp_params]}.
    This can be used to create a variant of a color state, by changing just one
    of the cicp parameters, or just to obtain information about the color state.
*)
class type cicp_params_t = object
  (** {2:methods Methods} *)

  method build_color_state : unit -> (Raw.Color_state.t, GError.t) result
  (** Creates a new [GdkColorState] object for the cicp parameters in [self].

      Note that this may fail if the cicp parameters in [self] are not supported
      by GTK. In that case, [None] is returned, and [error] is set with an error
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

  (** {2:conversions Conversions} *)

  method as_cicp_params : Raw.Cicp_params.t
end

(** {b The methods, signals and properties of a [ColorState].}

    Provides information to interpret colors and pixels in a variety of ways.

    They are also known as
    {{:https://en.wikipedia.org/wiki/Color_space}{i color spaces}}.

    Crucially, GTK knows how to convert colors from one color state to another.

    [GdkColorState] objects are immutable and therefore threadsafe. *)
and color_state_t = object
  (** {2:methods Methods} *)

  method create_cicp_params : unit -> cicp_params_t option
  (** Create a [Gdk.CicpParams] representing the colorstate.

      It is not guaranteed that every [GdkColorState] can be represented with
      Cicp parameters. If that is the case, this function returns [None]. *)

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

  (** {2:conversions Conversions} *)

  method as_color_state : Raw.Color_state.t
end

(** Wraps a raw handle of {!Ocgdk.Raw.Cicp_params.t}. *)
class cicp_params : Raw.Cicp_params.t -> cicp_params_t
(** Wraps a raw handle of {!Ocgdk.Raw.Color_state.t}. *)

and color_state : Raw.Color_state.t -> color_state_t

val new_ : unit -> cicp_params_t
[@@ocaml.doc
  "Creates a new [GdkCicpParams] object.\n\n\
   The initial values of the properties are the values for \"undefined\"\n\
   and need to be set before a color state object can be built."]
