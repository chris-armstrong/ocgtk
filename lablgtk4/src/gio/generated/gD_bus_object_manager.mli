class d_bus_object_manager : D_bus_object_manager.t ->
  object
    inherit Gd_bus_object_manager_signals.d_bus_object_manager_signals
    method get_object_path : unit -> string
    method as_d_bus_object_manager : D_bus_object_manager.t
  end

