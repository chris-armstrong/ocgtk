(* High-level class for LockButton *)
class lock_button (obj : Lock_button.t) = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (Lock_button.as_widget obj)

  method as_widget = (Lock_button.as_widget obj)
    method as_lock_button = obj
end

