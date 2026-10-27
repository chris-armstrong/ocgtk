(** The classes of {!Ocgdk.Cicp_params}, {!Ocgdk.Color_state}, defined together
    because they refer to each other. Each has a module of its own that
    re-exports it; use that module rather than this one. *)

(** The methods, signals and properties of a [GdkCicpParams]. *)
class type cicp_params_t = object
  method build_color_state : unit -> (Raw.Color_state.t, GError.t) result
  method get_color_primaries : unit -> int
  method get_matrix_coefficients : unit -> int
  method get_range : unit -> Enums.cicprange
  method get_transfer_function : unit -> int
  method set_color_primaries : int -> unit
  method set_matrix_coefficients : int -> unit
  method set_range : Enums.cicprange -> unit
  method set_transfer_function : int -> unit
  method as_cicp_params : Raw.Cicp_params.t
end

(** The methods, signals and properties of a [GdkColorState]. *)
and color_state_t = object
  method create_cicp_params : unit -> cicp_params_t option
  method equal : Raw.Color_state.t -> bool
  method equivalent : Raw.Color_state.t -> bool
  method ref : unit -> Raw.Color_state.t
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
