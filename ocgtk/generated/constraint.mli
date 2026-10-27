(** Describes a constraint between attributes of two widgets, expressed as a
    linear equation.

    The typical equation for a constraint is:

    {[
      target.target_attr = source.source_attr × multiplier + constant
    ]}

    Each [GtkConstraint] is part of a system that will be solved by a
    [Gtk.ConstraintLayout] in order to allocate and position each child widget
    or guide.

    The source and target, as well as their attributes, of a [GtkConstraint]
    instance are immutable after creation.

    Its methods, signals and properties are on {!class-type-constraint__t}. The
    functions it is built on are in {!Ocgtk.Raw.Constraint}. *)

(** The methods, signals and properties of a [GtkConstraint]. *)
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
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Constraint.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkConstraint], give one already wrapped. *)

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
