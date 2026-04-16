class type custom_layout_t = object
  inherit
    GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
    .layout_manager_t

  method as_custom_layout : Custom_layout.t
end

class custom_layout : Custom_layout.t -> custom_layout_t
