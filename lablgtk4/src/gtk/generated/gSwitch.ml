(* Signal class defined in gswitch_signals.ml *)

(* High-level class for Switch *)
class switch (obj : Switch.t) = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (Switch.as_widget obj)
  inherit Gswitch_signals.switch_signals obj

  method get_active : unit -> bool =
    fun () ->
      (Switch.get_active obj)

  method get_state : unit -> bool =
    fun () ->
      (Switch.get_state obj)

  method set_active : bool -> unit =
    fun is_active ->
      (Switch.set_active obj is_active)

  method set_state : bool -> unit =
    fun state ->
      (Switch.set_state obj state)

  method as_widget = (Switch.as_widget obj)
    method as_switch = obj
end

