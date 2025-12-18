(* High-level class for LockButton *)
class lock_button (obj : Lock_button.t) = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (Lock_button.as_widget obj)

  method text_lock = Lock_button.get_text_lock obj
  method set_text_lock v = Lock_button.set_text_lock obj v

  method text_unlock = Lock_button.get_text_unlock obj
  method set_text_unlock v = Lock_button.set_text_unlock obj v

  method tooltip_lock = Lock_button.get_tooltip_lock obj
  method set_tooltip_lock v = Lock_button.set_tooltip_lock obj v

  method tooltip_not_authorized = Lock_button.get_tooltip_not_authorized obj
  method set_tooltip_not_authorized v = Lock_button.set_tooltip_not_authorized obj v

  method tooltip_unlock = Lock_button.get_tooltip_unlock obj
  method set_tooltip_unlock v = Lock_button.set_tooltip_unlock obj v

  method as_widget = (Lock_button.as_widget obj)
    method as_lock_button = obj
end

