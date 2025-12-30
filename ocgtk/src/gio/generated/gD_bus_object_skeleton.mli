class d_bus_object_skeleton : D_bus_object_skeleton.t ->
  object
    inherit Gd_bus_object_skeleton_signals.d_bus_object_skeleton_signals
    method add_interface : #GD_bus_interface_skeleton.d_bus_interface_skeleton -> unit
    method flush : unit -> unit
    method remove_interface : #GD_bus_interface_skeleton.d_bus_interface_skeleton -> unit
    method remove_interface_by_name : string -> unit
    method set_object_path : string -> unit
    method g_object_path : string
    method set_g_object_path : string -> unit
    method as_d_bus_object_skeleton : D_bus_object_skeleton.t
  end

