(* Signal class defined in gdebug_controller_d_bus_signals.ml *)

class type debug_controller_d_bus_t = object
    inherit GDebug_controller.debug_controller_t
    inherit GInitable.initable_t
    inherit Gdebug_controller_d_bus_signals.debug_controller_d_bus_signals
    method stop : unit -> unit
    method connection : GD_bus_connection.d_bus_connection_t
    method as_debug_controller_d_bus : Debug_controller_d_bus.t
end

(* High-level class for DebugControllerDBus *)
class debug_controller_d_bus (obj : Debug_controller_d_bus.t) : debug_controller_d_bus_t = object (self)
  inherit GDebug_controller.debug_controller (Debug_controller.from_gobject obj)
  inherit GInitable.initable (Initable.from_gobject obj)
  inherit Gdebug_controller_d_bus_signals.debug_controller_d_bus_signals obj

  method stop : unit -> unit =
    fun () ->
      (Debug_controller_d_bus.stop obj)

  method connection = new GD_bus_connection.d_bus_connection (Debug_controller_d_bus.get_connection obj)

    method as_debug_controller_d_bus = obj
end

let new_ (connection : GD_bus_connection.d_bus_connection_t) (cancellable : GCancellable.cancellable_t option) : (debug_controller_d_bus_t, GError.t) result =
  let connection = connection#as_d_bus_connection in
  let cancellable = Option.map (fun c -> c#as_cancellable) cancellable in
  let obj_ = Debug_controller_d_bus.new_ connection cancellable in
Result.map (fun obj_ ->  new debug_controller_d_bus obj_) obj_

