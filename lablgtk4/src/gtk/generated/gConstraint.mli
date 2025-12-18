class constraint_ : Constraint.t ->
  object
    method constant : float
    method multiplier : float
    method strength : int
    method get_relation : unit -> Gtk_enums.constraintrelation
    method get_source : unit -> GConstraint_target.constraint_target option
    method get_source_attribute : unit -> Gtk_enums.constraintattribute
    method get_target : unit -> GConstraint_target.constraint_target option
    method get_target_attribute : unit -> Gtk_enums.constraintattribute
    method is_attached : unit -> bool
    method is_constant : unit -> bool
    method is_required : unit -> bool
    method as_constraint_ : Constraint.t
  end

