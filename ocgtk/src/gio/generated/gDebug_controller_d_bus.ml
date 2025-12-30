(* Signal class defined in gdebug_controller_d_bus_signals.ml *)

(* High-level class for DebugControllerDBus *)
class debug_controller_d_bus (obj : Debug_controller_d_bus.t) = object (self)
  inherit Gdebug_controller_d_bus_signals.debug_controller_d_bus_signals obj

  method stop : unit -> unit =
    fun () ->
      (Debug_controller_d_bus.stop obj)

  method connection = new GD_bus_connection.d_bus_connection (Debug_controller_d_bus.get_connection obj)

    method as_debug_controller_d_bus = obj
end

