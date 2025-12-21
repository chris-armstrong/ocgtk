class d_bus_proxy : D_bus_proxy.t ->
  object
    inherit Gd_bus_proxy_signals.d_bus_proxy_signals
    method get_connection : unit -> GD_bus_connection.d_bus_connection
    method get_default_timeout : unit -> int
    method get_interface_info : unit -> D_bus_interface_info.t option
    method get_interface_name : unit -> string
    method get_name : unit -> string option
    method get_name_owner : unit -> string option
    method get_object_path : unit -> string
    method set_default_timeout : int -> unit
    method set_interface_info : D_bus_interface_info.t option -> unit
    method g_bus_type : Gio_enums.bustype
    method g_connection : GD_bus_connection.d_bus_connection
    method g_default_timeout : int
    method set_g_default_timeout : int -> unit
    method g_interface_info : D_bus_interface_info.t
    method set_g_interface_info : D_bus_interface_info.t -> unit
    method g_interface_name : string
    method g_name : string
    method g_name_owner : string
    method g_object_path : string
    method as_d_bus_proxy : D_bus_proxy.t
  end

