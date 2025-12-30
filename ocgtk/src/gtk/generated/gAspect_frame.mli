class aspect_frame : Aspect_frame.t ->
  object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget
    method get_child : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option
    method get_obey_child : unit -> bool
    method get_ratio : unit -> float
    method get_xalign : unit -> float
    method get_yalign : unit -> float
    method set_child : #GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option -> unit
    method set_obey_child : bool -> unit
    method set_ratio : float -> unit
    method set_xalign : float -> unit
    method set_yalign : float -> unit
  method as_widget : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t
    method as_aspect_frame : Aspect_frame.t
  end

