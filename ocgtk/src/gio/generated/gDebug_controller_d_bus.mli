class debug_controller_d_bus : Debug_controller_d_bus.t ->
  object
    inherit Gdebug_controller_d_bus_signals.debug_controller_d_bus_signals
    method stop : unit -> unit
    method connection : GD_bus_connection.d_bus_connection
    method as_debug_controller_d_bus : Debug_controller_d_bus.t
  end

