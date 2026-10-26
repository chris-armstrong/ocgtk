class type fixed_layout_child_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .layout_child_t

  method get_transform : unit -> Ocgsk.Transform.transform_t option
  method set_transform : Ocgsk.Transform.transform_t -> unit
  method as_fixed_layout_child : Raw.Fixed_layout_child.t
end

class fixed_layout_child : Raw.Fixed_layout_child.t -> fixed_layout_child_t
