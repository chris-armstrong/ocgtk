(* High-level class for FixedLayout *)
class fixed_layout (obj : Fixed_layout.t) = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.layout_manager (Fixed_layout.as_layoutmanager obj)

  method as_layoutmanager = (Fixed_layout.as_layoutmanager obj)
    method as_fixed_layout = obj
end

