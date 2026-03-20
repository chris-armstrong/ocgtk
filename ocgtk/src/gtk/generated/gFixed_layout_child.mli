class type fixed_layout_child_t = object
    method get_transform : unit -> Ocgtk_gsk.Gsk.transform_t option
    method set_transform : Ocgtk_gsk.Gsk.transform_t -> unit
    method as_fixed_layout_child : Fixed_layout_child.t
end

class fixed_layout_child : Fixed_layout_child.t -> fixed_layout_child_t

