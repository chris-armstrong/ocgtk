class d_bus_interface_skeleton : D_bus_interface_skeleton.t ->
  object
    inherit Gd_bus_interface_skeleton_signals.d_bus_interface_skeleton_signals
    method export : #GD_bus_connection.d_bus_connection -> string -> (bool, GError.t) result
    method flush : unit -> unit
    method get_connection : unit -> GD_bus_connection.d_bus_connection option
    method get_flags : unit -> Gio_enums.dbusinterfaceskeletonflags
    method get_info : unit -> D_bus_interface_info.t
    method get_object_path : unit -> string option
    method get_vtable : unit -> D_bus_interface_v_table.t
    method has_connection : #GD_bus_connection.d_bus_connection -> bool
    method set_flags : Gio_enums.dbusinterfaceskeletonflags -> unit
    method unexport : unit -> unit
    method unexport_from_connection : #GD_bus_connection.d_bus_connection -> unit
    method g_flags : Gio_enums.dbusinterfaceskeletonflags
    method set_g_flags : Gio_enums.dbusinterfaceskeletonflags -> unit
    method as_d_bus_interface_skeleton : D_bus_interface_skeleton.t
  end

