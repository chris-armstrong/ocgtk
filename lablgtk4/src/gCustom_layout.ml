(* High-level class for CustomLayout *)
class custom_layout (obj : Custom_layout.t) = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.layout_manager (Custom_layout.as_layoutmanager obj)

  method as_layoutmanager = (Custom_layout.as_layoutmanager obj)
    method as_custom_layout = obj
end

