class type d_bus_arg_info_t = object
  method ref : unit -> D_bus_arg_info.t
  method get_ref_count : int
  method set_ref_count : int -> unit
  method get_name : string
  method set_name : string -> unit
  method get_signature : string
  method set_signature : string -> unit
  method as_d_bus_arg_info : D_bus_arg_info.t
end

class d_bus_arg_info : D_bus_arg_info.t -> d_bus_arg_info_t

val make : int -> string -> string -> d_bus_arg_info_t
