class type d_bus_signal_info_t = object
  method ref : unit -> D_bus_signal_info.t
  method get_ref_count : int
  method set_ref_count : int -> unit
  method get_name : string
  method set_name : string -> unit
  method as_d_bus_signal_info : D_bus_signal_info.t
end

class d_bus_signal_info : D_bus_signal_info.t -> d_bus_signal_info_t

val make : int -> string -> d_bus_signal_info_t
