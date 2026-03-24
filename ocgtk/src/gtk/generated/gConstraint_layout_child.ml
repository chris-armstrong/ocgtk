class type constraint_layout_child_t = object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.layout_child_t
    method as_constraint_layout_child : Constraint_layout_child.t
end

(* High-level class for ConstraintLayoutChild *)
class constraint_layout_child (obj : Constraint_layout_child.t) : constraint_layout_child_t = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.layout_child (obj :> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Layout_child.t)

    method as_constraint_layout_child = obj
end

