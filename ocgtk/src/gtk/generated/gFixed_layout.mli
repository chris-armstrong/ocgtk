class type fixed_layout_t = object
  inherit
    GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
    .layout_manager_t

  method as_fixed_layout : Fixed_layout.t
end

class fixed_layout : Fixed_layout.t -> fixed_layout_t

val new_ : unit -> fixed_layout_t
