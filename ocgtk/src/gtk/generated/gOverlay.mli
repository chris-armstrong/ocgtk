class type overlay_t = object
    inherit Goverlay_signals.overlay_signals
    method add_overlay : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> unit
    method get_child : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option
    method get_clip_overlay : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> bool
    method get_measure_overlay : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> bool
    method remove_overlay : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> unit
    method set_child : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option -> unit
    method set_clip_overlay : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> bool -> unit
    method set_measure_overlay : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> bool -> unit
    method as_overlay : Overlay.t
end

class overlay : Overlay.t -> overlay_t

