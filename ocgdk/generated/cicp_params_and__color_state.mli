class type cicp_params_t = object
  method build_color_state :
    unit -> (Cicp_params_and__color_state.Color_state.t, GError.t) result

  method get_color_primaries : unit -> int
  method get_matrix_coefficients : unit -> int
  method get_range : unit -> Gdk_enums.cicprange
  method get_transfer_function : unit -> int
  method set_color_primaries : int -> unit
  method set_matrix_coefficients : int -> unit
  method set_range : Gdk_enums.cicprange -> unit
  method set_transfer_function : int -> unit
  method as_cicp_params : Cicp_params_and__color_state.Cicp_params.t
end

and color_state_t = object
  method create_cicp_params : unit -> cicp_params_t option
  method equal : Cicp_params_and__color_state.Color_state.t -> bool
  method equivalent : Cicp_params_and__color_state.Color_state.t -> bool
  method ref : unit -> Cicp_params_and__color_state.Color_state.t
  method as_color_state : Cicp_params_and__color_state.Color_state.t
end

class cicp_params : Cicp_params_and__color_state.Cicp_params.t -> cicp_params_t

and color_state : Cicp_params_and__color_state.Color_state.t -> color_state_t

val new_ : unit -> cicp_params_t
