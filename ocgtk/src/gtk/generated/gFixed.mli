class fixed : Fixed.t ->
  object
    method get_child_transform : #GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget -> Ocgtk_gsk.Gsk.transform option
    method move : #GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget -> float -> float -> unit
    method put : #GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget -> float -> float -> unit
    method remove : #GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget -> unit
    method set_child_transform : #GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget -> #Ocgtk_gsk.Gsk.transform option -> unit
    method as_fixed : Fixed.t
  end

