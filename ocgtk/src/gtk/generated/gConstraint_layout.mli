class constraint_layout : Constraint_layout.t ->
  object
    method add_constraint : #GConstraint.constraint_ -> unit
    method add_guide : #GConstraint_guide.constraint_guide -> unit
    method observe_constraints : unit -> Ocgtk_gio.Gio.list_model
    method observe_guides : unit -> Ocgtk_gio.Gio.list_model
    method remove_all_constraints : unit -> unit
    method remove_constraint : #GConstraint.constraint_ -> unit
    method remove_guide : #GConstraint_guide.constraint_guide -> unit
    method as_constraint_layout : Constraint_layout.t
  end

