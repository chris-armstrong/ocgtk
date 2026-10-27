(* GENERATED CODE - DO NOT EDIT *)
(* Combined modules for cyclic dependencies *)

(** The layer 1 modules of {!Ocgdk.Raw.Cicp_params}, {!Ocgdk.Raw.Color_state},
    defined together because they refer to each other. Each has a module of its
    own that re-exports it; use that module rather than this one. *)

(** Contains the parameters that define a colorstate with cicp parameters.

    Cicp parameters are specified in the ITU-T H.273
    {{:https://www.itu.int/rec/T-REC-H.273/en}specification}.

    See the documentation of individual properties for supported values.

    The 'unspecified' value (2) is not treated in any special way, and must be
    replaced by a different value before creating a color state.

    [GdkCicpParams] can be used as a builder object to construct a color state
    from Cicp data with [Gdk.CicpParams.build_color_state]. The function will
    return an error if the given parameters are not supported.

    You can obtain a [GdkCicpParams] object from a color state with
    [Gdk.ColorState.create_cicp_params]. This can be used to create a variant of
    a color state, by changing just one of the cicp parameters, or just to
    obtain information about the color state.

    The class built on this module is in {!Ocgdk.Cicp_params}. *)
module rec Cicp_params : sig
  type t = [ `cicp_params | `object_ ] Gobject.obj

  external gtype : unit -> Gobject.Type.t = "ml_gdk_cicp_params_get_type"

  external new_ : unit -> t = "ml_gdk_cicp_params_new"
  (** Create a new CicpParams *)

  (* Methods *)

  external set_transfer_function : t -> int -> unit
    = "ml_gdk_cicp_params_set_transfer_function"
  (** Sets the transfer-function property of [self]. *)

  external set_range : t -> Ocgdk_enums.cicprange -> unit
    = "ml_gdk_cicp_params_set_range"
  (** Sets the range property of [self] *)

  external set_matrix_coefficients : t -> int -> unit
    = "ml_gdk_cicp_params_set_matrix_coefficients"
  (** [self] a [GdkCicpParams] Sets the matrix-coefficients property of [self].
  *)

  external set_color_primaries : t -> int -> unit
    = "ml_gdk_cicp_params_set_color_primaries"
  (** Sets the color-primaries property of [self]. *)

  external get_transfer_function : t -> int
    = "ml_gdk_cicp_params_get_transfer_function"
  (** Gets the transfer-function property of [self]. *)

  external get_range : t -> Ocgdk_enums.cicprange
    = "ml_gdk_cicp_params_get_range"
  (** Gets the range property of [self]. *)

  external get_matrix_coefficients : t -> int
    = "ml_gdk_cicp_params_get_matrix_coefficients"
  (** Gets the matrix-coefficients property of [self]. *)

  external get_color_primaries : t -> int
    = "ml_gdk_cicp_params_get_color_primaries"
  (** Returns the value of the color-primaries property of [self]. *)

  external build_color_state : t -> (Color_state.t, GError.t) result
    = "ml_gdk_cicp_params_build_color_state"
  (** Creates a new [GdkColorState] object for the cicp parameters in [self].

      Note that this may fail if the cicp parameters in [self] are not supported
      by GTK. In that case, [NULL] is returned, and [error] is set with an error
      message that can be presented to the user. *)

  (* Properties *)
end

(** Provides information to interpret colors and pixels in a variety of ways.

    They are also known as
    {{:https://en.wikipedia.org/wiki/Color_space}{i color spaces}}.

    Crucially, GTK knows how to convert colors from one color state to another.

    [GdkColorState] objects are immutable and therefore threadsafe.

    The class built on this module is in {!Ocgdk.Color_state}. *)
and Color_state : sig
  type t = [ `color_state ] Gobject.obj

  external gtype : unit -> Gobject.Type.t = "ml_gdk_color_state_get_type"

  (* Methods *)

  external ref : t -> t = "ml_gdk_color_state_ref"
  (** Increase the reference count of [self]. *)

  external equivalent : t -> t -> bool = "ml_gdk_color_state_equivalent"
  (** Compares two [GdkColorStates] for equivalence.

      Two objects that represent the same color state should be equivalent, even
      though they may not be equal in the sense of [Gdk.ColorState.equal]. *)

  external equal : t -> t -> bool = "ml_gdk_color_state_equal"
  (** Compares two [GdkColorStates] for equality.

      Note that this function is not guaranteed to be perfect and two objects
      describing the same color state may compare not equal. However, different
      color states will never compare equal. *)

  external create_cicp_params : t -> Cicp_params.t option
    = "ml_gdk_color_state_create_cicp_params"
  (** Create a [Gdk.CicpParams] representing the colorstate.

      It is not guaranteed that every [GdkColorState] can be represented with
      Cicp parameters. If that is the case, this function returns [NULL]. *)
end
