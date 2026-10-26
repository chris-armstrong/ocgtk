class type constraint__t = object
  method get_constant : unit -> float
  method get_multiplier : unit -> float
  method get_relation : unit -> Enums.constraintrelation
  method get_source : unit -> Constraint_target.constraint_target_t option
  method get_source_attribute : unit -> Enums.constraintattribute
  method get_strength : unit -> int
  method get_target : unit -> Constraint_target.constraint_target_t option
  method get_target_attribute : unit -> Enums.constraintattribute
  method is_attached : unit -> bool
  method is_constant : unit -> bool
  method is_required : unit -> bool
  method as_constraint_ : Raw.Constraint.t
end

class constraint_ : Raw.Constraint.t -> constraint__t

val new_ :
  Constraint_target.constraint_target_t option ->
  Enums.constraintattribute ->
  Enums.constraintrelation ->
  Constraint_target.constraint_target_t option ->
  Enums.constraintattribute ->
  float ->
  float ->
  int ->
  constraint__t

val new_constant :
  Constraint_target.constraint_target_t option ->
  Enums.constraintattribute ->
  Enums.constraintrelation ->
  float ->
  int ->
  constraint__t
