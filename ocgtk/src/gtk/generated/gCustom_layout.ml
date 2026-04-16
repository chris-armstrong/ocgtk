class type custom_layout_t = object
  inherit
    GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
    .layout_manager_t

  method as_custom_layout : Custom_layout.t
end

(* High-level class for CustomLayout *)
class custom_layout (obj : Custom_layout.t) : custom_layout_t =
  object (self)
    inherit
      GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
      .layout_manager
        (obj
          :> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget
             .Layout_manager
             .t)

    method as_custom_layout = obj
  end
