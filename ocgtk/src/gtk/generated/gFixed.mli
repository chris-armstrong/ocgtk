class type fixed_t = object
    method get_child_transform : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> Ocgtk_gsk.Gsk.transform_t option
    method move : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> float -> float -> unit
    method put : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> float -> float -> unit
    method remove : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> unit
    method set_child_transform : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> Ocgtk_gsk.Gsk.transform_t option -> unit
    method as_fixed : Fixed.t
end

class fixed : Fixed.t -> fixed_t

