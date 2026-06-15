class type d_bus_signal_info_t = object
  method ref : unit -> D_bus_signal_info.t
  method get_ref_count : int
  method set_ref_count : int -> unit
  method get_name : string
  method set_name : string -> unit
  method as_d_bus_signal_info : D_bus_signal_info.t
end

(* High-level class for DBusSignalInfo *)
class d_bus_signal_info (obj : D_bus_signal_info.t) : d_bus_signal_info_t =
  object (self)
    method ref : unit -> D_bus_signal_info.t =
      fun () -> D_bus_signal_info.ref obj

    method get_ref_count : int = D_bus_signal_info.get_ref_count obj

    method set_ref_count : int -> unit =
      fun v -> D_bus_signal_info.set_ref_count obj v

    method get_name : string = D_bus_signal_info.get_name obj
    method set_name : string -> unit = fun v -> D_bus_signal_info.set_name obj v
    method as_d_bus_signal_info = obj
  end

let make (ref_count : int) (name : string) : d_bus_signal_info_t =
  new d_bus_signal_info (D_bus_signal_info.make ref_count name)
