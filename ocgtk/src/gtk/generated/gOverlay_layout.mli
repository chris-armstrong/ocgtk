class type overlay_layout_t = object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.layout_manager_t
    method as_overlay_layout : Overlay_layout.t
end

class overlay_layout : Overlay_layout.t -> overlay_layout_t

