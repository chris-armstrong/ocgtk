(* Signal class defined in gd_bus_proxy_signals.ml *)

(* High-level class for DBusProxy *)
class d_bus_proxy (obj : D_bus_proxy.t) = object (self)
  inherit Gd_bus_proxy_signals.d_bus_proxy_signals obj

  method get_connection : unit -> GD_bus_connection.d_bus_connection =
    fun () ->
      new  GD_bus_connection.d_bus_connection(D_bus_proxy.get_connection obj)

  method get_default_timeout : unit -> int =
    fun () ->
      (D_bus_proxy.get_default_timeout obj)

  method get_interface_info : unit -> D_bus_interface_info.t option =
    fun () ->
      (D_bus_proxy.get_interface_info obj)

  method get_interface_name : unit -> string =
    fun () ->
      (D_bus_proxy.get_interface_name obj)

  method get_name : unit -> string option =
    fun () ->
      (D_bus_proxy.get_name obj)

  method get_name_owner : unit -> string option =
    fun () ->
      (D_bus_proxy.get_name_owner obj)

  method get_object_path : unit -> string =
    fun () ->
      (D_bus_proxy.get_object_path obj)

  method set_default_timeout : int -> unit =
    fun timeout_msec ->
      (D_bus_proxy.set_default_timeout obj timeout_msec)

  method set_interface_info : D_bus_interface_info.t option -> unit =
    fun info ->
      (D_bus_proxy.set_interface_info obj info)

  method g_bus_type = D_bus_proxy.get_g_bus_type obj

  method g_connection = new GD_bus_connection.d_bus_connection (D_bus_proxy.get_g_connection obj)

  method g_default_timeout = D_bus_proxy.get_g_default_timeout obj
  method set_g_default_timeout v =  D_bus_proxy.set_g_default_timeout obj v

  method g_interface_info = D_bus_proxy.get_g_interface_info obj
  method set_g_interface_info v =  D_bus_proxy.set_g_interface_info obj v

  method g_interface_name = D_bus_proxy.get_g_interface_name obj

  method g_name = D_bus_proxy.get_g_name obj

  method g_name_owner = D_bus_proxy.get_g_name_owner obj

  method g_object_path = D_bus_proxy.get_g_object_path obj

    method as_d_bus_proxy = obj
end

