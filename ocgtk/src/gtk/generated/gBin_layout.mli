class type bin_layout_t = object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.layout_manager_t
    method as_bin_layout : Bin_layout.t
end

class bin_layout : Bin_layout.t -> bin_layout_t

val new_ : unit -> bin_layout_t
