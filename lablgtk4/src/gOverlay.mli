class overlay : Overlay.t ->
  object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget
    inherit Goverlay_signals.overlay_signals
    method add_overlay : #GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget -> unit
    method get_child : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option
    method get_clip_overlay : #GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget -> bool
    method get_measure_overlay : #GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget -> bool
    method remove_overlay : #GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget -> unit
    method set_child : #GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option -> unit
    method set_clip_overlay : #GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget -> bool -> unit
    method set_measure_overlay : #GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget -> bool -> unit
  method as_widget : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t
    method as_overlay : Overlay.t
  end

