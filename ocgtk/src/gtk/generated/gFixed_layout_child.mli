class type fixed_layout_child_t = object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.layout_child_t
    method get_transform : unit -> Ocgtk_gsk.Gsk.transform_t option
    method set_transform : Ocgtk_gsk.Gsk.transform_t -> unit
    method as_fixed_layout_child : Fixed_layout_child.t
end

class fixed_layout_child : Fixed_layout_child.t -> fixed_layout_child_t

