class type debug_controller_d_bus_t = object
  inherit GDebug_controller.debug_controller_t
  inherit GInitable.initable_t
  method stop : unit -> unit
  method connection : GD_bus_connection.d_bus_connection_t
  method as_debug_controller_d_bus : Debug_controller_d_bus.t
end

class debug_controller_d_bus :
  Debug_controller_d_bus.t ->
  debug_controller_d_bus_t

val new_ :
  GD_bus_connection.d_bus_connection_t ->
  GCancellable.cancellable_t option ->
  (debug_controller_d_bus_t, GError.t) result
