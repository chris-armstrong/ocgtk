class type debug_controller_t = object
  (** {2:methods Methods} *)

  method get_debug_enabled : unit -> bool
  (** Get the value of [GDebugController:debug-enabled]. *)

  method set_debug_enabled : bool -> unit
  (** Set the value of [GDebugController:debug-enabled]. *)

  (** {2:conversions Conversions} *)

  method as_debug_controller : Raw.Debug_controller.t
end

(* High-level class for DebugController *)
class debug_controller (obj : Raw.Debug_controller.t) : debug_controller_t =
  object (self)
    method get_debug_enabled : unit -> bool =
      fun () -> Raw.Debug_controller.get_debug_enabled obj

    method set_debug_enabled : bool -> unit =
      fun debug_enabled ->
        Raw.Debug_controller.set_debug_enabled obj debug_enabled

    method as_debug_controller = obj
  end
