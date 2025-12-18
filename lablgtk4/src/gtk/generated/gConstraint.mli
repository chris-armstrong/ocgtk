class constraint_ : Constraint.t ->
  object
    method get_constant : unit -> float
    method get_multiplier : unit -> float
    method get_relation : unit -> Gtk_enums.constraintrelation
    method get_source : unit -> GConstraint_target.constraint_target option
    method get_source_attribute : unit -> Gtk_enums.constraintattribute
    method get_strength : unit -> int
    method get_target : unit -> GConstraint_target.constraint_target option
    method get_target_attribute : unit -> Gtk_enums.constraintattribute
    method is_attached : unit -> bool
    method is_constant : unit -> bool
    method is_required : unit -> bool
    method as_constraint_ : Constraint.t
  end

