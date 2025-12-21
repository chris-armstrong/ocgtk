class debug_controller : Debug_controller.t ->
  object
    method get_debug_enabled : unit -> bool
    method set_debug_enabled : bool -> unit
    method as_debug_controller : Debug_controller.t
  end

