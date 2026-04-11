class type constraint_layout_child_t = object
  inherit
    GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
    .layout_child_t

  method as_constraint_layout_child : Constraint_layout_child.t
end

class constraint_layout_child :
  Constraint_layout_child.t ->
  constraint_layout_child_t
