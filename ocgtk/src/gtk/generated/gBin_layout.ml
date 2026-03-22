class type bin_layout_t = object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.layout_manager_t
    method as_bin_layout : Bin_layout.t
end

(* High-level class for BinLayout *)
class bin_layout (obj : Bin_layout.t) : bin_layout_t = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.layout_manager (Obj.magic obj : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Layout_manager.t)

    method as_bin_layout = obj
end

