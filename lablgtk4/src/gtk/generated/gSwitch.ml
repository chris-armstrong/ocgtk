(* Signal class defined in gswitch_signals.ml *)

(* High-level class for Switch *)
class switch (obj : Switch.t) = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (Switch.as_widget obj)
  inherit Gswitch_signals.switch_signals obj

  method active = Switch.get_active obj
  method set_active v = Switch.set_active obj v

  method state = Switch.get_state obj
  method set_state v = Switch.set_state obj v

  method as_widget = (Switch.as_widget obj)
    method as_switch = obj
end

