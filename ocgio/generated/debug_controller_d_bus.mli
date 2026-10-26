class type debug_controller_d_bus_t = object
  inherit Debug_controller.debug_controller_t
  inherit Initable.initable_t

  method on_authorize :
    ?after:bool ->
    callback:
      (invocation:D_bus_method_invocation.d_bus_method_invocation_t -> bool) ->
    unit ->
    Gobject.Signal.handler_id

  method stop : unit -> unit
  method connection : D_bus_connection.d_bus_connection_t
  method as_debug_controller_d_bus : Raw.Debug_controller_d_bus.t
end

class debug_controller_d_bus :
  Raw.Debug_controller_d_bus.t ->
  debug_controller_d_bus_t

val new_ :
  D_bus_connection.d_bus_connection_t ->
  Cancellable.cancellable_t option ->
  (debug_controller_d_bus_t, GError.t) result
