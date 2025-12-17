class overlay_layout : Overlay_layout.t ->
  object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.layout_manager
  method as_layoutmanager : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Layout_manager.t
    method as_overlay_layout : Overlay_layout.t
  end

