class scale_button : Scale_button.t ->
  object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget
    inherit Gscale_button_signals.scale_button_signals
    method get_active : unit -> bool
    method get_adjustment : unit -> GAdjustment.adjustment
    method get_has_frame : unit -> bool
    method get_minus_button : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget
    method get_plus_button : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget
    method get_popup : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget
    method get_value : unit -> float
    method set_adjustment : #GAdjustment.adjustment -> unit
    method set_has_frame : bool -> unit
    method set_value : float -> unit
  method as_widget : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t
    method as_scale_button : Scale_button.t
  end

