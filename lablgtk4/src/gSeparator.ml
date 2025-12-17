(* High-level class for Separator *)
class separator (obj : Separator.t) = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (Separator.as_widget obj)

  method as_widget = (Separator.as_widget obj)
    method as_separator = obj
end

