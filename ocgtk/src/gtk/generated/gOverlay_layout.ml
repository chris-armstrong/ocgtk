(* High-level class for OverlayLayout *)
class overlay_layout (obj : Overlay_layout.t) = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.layout_manager (Overlay_layout.as_layoutmanager obj)

  method as_layoutmanager = (Overlay_layout.as_layoutmanager obj)
    method as_overlay_layout = obj
end

