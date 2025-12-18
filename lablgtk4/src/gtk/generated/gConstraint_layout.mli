class constraint_layout : Constraint_layout.t ->
  object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.layout_manager
    method add_constraint : #GConstraint.constraint_ -> unit
    method add_guide : #GConstraint_guide.constraint_guide -> unit
    method remove_all_constraints : unit -> unit
    method remove_constraint : #GConstraint.constraint_ -> unit
    method remove_guide : #GConstraint_guide.constraint_guide -> unit
  method as_layoutmanager : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Layout_manager.t
    method as_constraint_layout : Constraint_layout.t
  end

