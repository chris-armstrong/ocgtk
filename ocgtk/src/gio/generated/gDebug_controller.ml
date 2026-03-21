class type debug_controller_t = object
    method get_debug_enabled : unit -> bool
    method set_debug_enabled : bool -> unit
    method as_debug_controller : Debug_controller.t
end

(* High-level class for DebugController *)
class debug_controller (obj : Debug_controller.t) : debug_controller_t = object (self)

  method get_debug_enabled : unit -> bool =
    fun () ->
      (Debug_controller.get_debug_enabled obj)

  method set_debug_enabled : bool -> unit =
    fun debug_enabled ->
      (Debug_controller.set_debug_enabled obj debug_enabled)

    method as_debug_controller = obj
end

