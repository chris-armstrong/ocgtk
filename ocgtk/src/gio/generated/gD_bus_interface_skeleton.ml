(* Signal class defined in gd_bus_interface_skeleton_signals.ml *)

(* High-level class for DBusInterfaceSkeleton *)
class d_bus_interface_skeleton (obj : D_bus_interface_skeleton.t) = object (self)
  inherit Gd_bus_interface_skeleton_signals.d_bus_interface_skeleton_signals obj

  method export : 'p1. (#GD_bus_connection.d_bus_connection as 'p1) -> string -> (bool, GError.t) result =
    fun connection object_path ->
      let connection = connection#as_d_bus_connection in
      (D_bus_interface_skeleton.export obj connection object_path)

  method flush : unit -> unit =
    fun () ->
      (D_bus_interface_skeleton.flush obj)

  method get_connection : unit -> GD_bus_connection.d_bus_connection option =
    fun () ->
      Option.map (fun ret -> new GD_bus_connection.d_bus_connection ret) (D_bus_interface_skeleton.get_connection obj)

  method get_flags : unit -> Gio_enums.dbusinterfaceskeletonflags =
    fun () ->
      (D_bus_interface_skeleton.get_flags obj)

  method get_info : unit -> D_bus_interface_info.t =
    fun () ->
      (D_bus_interface_skeleton.get_info obj)

  method get_object_path : unit -> string option =
    fun () ->
      (D_bus_interface_skeleton.get_object_path obj)

  method get_vtable : unit -> D_bus_interface_v_table.t =
    fun () ->
      (D_bus_interface_skeleton.get_vtable obj)

  method has_connection : 'p1. (#GD_bus_connection.d_bus_connection as 'p1) -> bool =
    fun connection ->
      let connection = connection#as_d_bus_connection in
      (D_bus_interface_skeleton.has_connection obj connection)

  method set_flags : Gio_enums.dbusinterfaceskeletonflags -> unit =
    fun flags ->
      (D_bus_interface_skeleton.set_flags obj flags)

  method unexport : unit -> unit =
    fun () ->
      (D_bus_interface_skeleton.unexport obj)

  method unexport_from_connection : 'p1. (#GD_bus_connection.d_bus_connection as 'p1) -> unit =
    fun connection ->
      let connection = connection#as_d_bus_connection in
      (D_bus_interface_skeleton.unexport_from_connection obj connection)

  method g_flags = D_bus_interface_skeleton.get_g_flags obj
  method set_g_flags v =  D_bus_interface_skeleton.set_g_flags obj v

    method as_d_bus_interface_skeleton = obj
end

