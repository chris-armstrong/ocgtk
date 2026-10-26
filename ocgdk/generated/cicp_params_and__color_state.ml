(* GENERATED CODE - DO NOT EDIT *)
(* Combined classes for cyclic dependencies *)

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

class cicp_params (obj : Cicp_params_and__color_state.Cicp_params.t) :
  cicp_params_t =
  object (self)
    method build_color_state :
        unit -> (Cicp_params_and__color_state.Color_state.t, GError.t) result =
      fun () -> Cicp_params_and__color_state.Cicp_params.build_color_state obj

    method get_color_primaries : unit -> int =
      fun () -> Cicp_params_and__color_state.Cicp_params.get_color_primaries obj

    method get_matrix_coefficients : unit -> int =
      fun () ->
        Cicp_params_and__color_state.Cicp_params.get_matrix_coefficients obj

    method get_range : unit -> Gdk_enums.cicprange =
      fun () -> Cicp_params_and__color_state.Cicp_params.get_range obj

    method get_transfer_function : unit -> int =
      fun () ->
        Cicp_params_and__color_state.Cicp_params.get_transfer_function obj

    method set_color_primaries : int -> unit =
      fun color_primaries ->
        Cicp_params_and__color_state.Cicp_params.set_color_primaries obj
          color_primaries

    method set_matrix_coefficients : int -> unit =
      fun matrix_coefficients ->
        Cicp_params_and__color_state.Cicp_params.set_matrix_coefficients obj
          matrix_coefficients

    method set_range : Gdk_enums.cicprange -> unit =
      fun range -> Cicp_params_and__color_state.Cicp_params.set_range obj range

    method set_transfer_function : int -> unit =
      fun transfer_function ->
        Cicp_params_and__color_state.Cicp_params.set_transfer_function obj
          transfer_function

    method as_cicp_params = obj
  end

and color_state (obj : Cicp_params_and__color_state.Color_state.t) :
  color_state_t =
  object (self)
    method create_cicp_params : unit -> cicp_params_t option =
      fun () ->
        Option.map
          (fun ret -> new cicp_params ret)
          (Cicp_params_and__color_state.Color_state.create_cicp_params obj)

    method equal : Cicp_params_and__color_state.Color_state.t -> bool =
      fun other -> Cicp_params_and__color_state.Color_state.equal obj other

    method equivalent : Cicp_params_and__color_state.Color_state.t -> bool =
      fun other -> Cicp_params_and__color_state.Color_state.equivalent obj other

    method ref : unit -> Cicp_params_and__color_state.Color_state.t =
      fun () -> Cicp_params_and__color_state.Color_state.ref obj

    method as_color_state = obj
  end

let new_ () : cicp_params_t =
  new cicp_params (Cicp_params_and__color_state.Cicp_params.new_ ())
