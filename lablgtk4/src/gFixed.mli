class fixed : Fixed.t ->
  object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget
    method move : #GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget -> float -> float -> unit
    method put : #GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget -> float -> float -> unit
    method remove : #GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget -> unit
  method as_widget : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t
    method as_fixed : Fixed.t
  end

