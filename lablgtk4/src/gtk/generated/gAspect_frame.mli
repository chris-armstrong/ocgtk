class aspect_frame : Aspect_frame.t ->
  object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget
    method obey_child : bool
    method set_obey_child : bool -> unit
    method ratio : float
    method set_ratio : float -> unit
    method xalign : float
    method set_xalign : float -> unit
    method yalign : float
    method set_yalign : float -> unit
    method get_child : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option
    method set_child : #GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option -> unit
  method as_widget : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t
    method as_aspect_frame : Aspect_frame.t
  end

