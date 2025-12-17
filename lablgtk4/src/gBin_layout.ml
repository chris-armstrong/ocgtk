(* High-level class for BinLayout *)
class bin_layout (obj : Bin_layout.t) = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.layout_manager (Bin_layout.as_layoutmanager obj)

  method as_layoutmanager = (Bin_layout.as_layoutmanager obj)
    method as_bin_layout = obj
end

