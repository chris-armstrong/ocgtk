class type constraint__t = object
  method get_constant : unit -> float
  method get_multiplier : unit -> float
  method get_relation : unit -> Gtk_enums.constraintrelation
  method get_source : unit -> GConstraint_target.constraint_target_t option
  method get_source_attribute : unit -> Gtk_enums.constraintattribute
  method get_strength : unit -> int
  method get_target : unit -> GConstraint_target.constraint_target_t option
  method get_target_attribute : unit -> Gtk_enums.constraintattribute
  method is_attached : unit -> bool
  method is_constant : unit -> bool
  method is_required : unit -> bool
  method as_constraint_ : Constraint.t
end

class constraint_ : Constraint.t -> constraint__t

val new_ :
  GConstraint_target.constraint_target_t option ->
  Gtk_enums.constraintattribute ->
  Gtk_enums.constraintrelation ->
  GConstraint_target.constraint_target_t option ->
  Gtk_enums.constraintattribute ->
  float ->
  float ->
  int ->
  constraint__t

val new_constant :
  GConstraint_target.constraint_target_t option ->
  Gtk_enums.constraintattribute ->
  Gtk_enums.constraintrelation ->
  float ->
  int ->
  constraint__t
