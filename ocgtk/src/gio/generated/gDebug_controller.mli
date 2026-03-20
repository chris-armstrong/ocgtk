class type debug_controller_t = object
    method get_debug_enabled : unit -> bool
    method set_debug_enabled : bool -> unit
    method as_debug_controller : Debug_controller.t
end

class debug_controller : Debug_controller.t -> debug_controller_t

