(** Describes a constraint between attributes of two widgets, expressed as a
    linear equation.

    Its methods, signals and properties are on {!class-type-constraint__t}. Its
    full description is under {!section-description}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgtk.Raw.Constraint}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [Constraint].}

    Describes a constraint between attributes of two widgets, expressed as a
    linear equation.

    The typical equation for a constraint is:

    {[
      target.target_attr = source.source_attr × multiplier + constant
    ]}

    Each [GtkConstraint] is part of a system that will be solved by a
    [Gtk.ConstraintLayout] in order to allocate and position each child widget
    or guide.

    The source and target, as well as their attributes, of a [GtkConstraint]
    instance are immutable after creation. *)
class type constraint__t = object
  method get_constant : unit -> float
  (** Retrieves the constant factor added to the source attributes' value. *)

  method get_multiplier : unit -> float
  (** Retrieves the multiplication factor applied to the source attribute's
      value. *)

  method get_relation : unit -> Enums.constraintrelation
  (** The order relation between the terms of the constraint. *)

  method get_source : unit -> Constraint_target.constraint_target_t option
  (** Retrieves the [Gtk.ConstraintTarget] used as the source for the
      constraint.

      If the source is set to [NULL] at creation, the constraint will use the
      widget using the [Gtk.ConstraintLayout] as the source. *)

  method get_source_attribute : unit -> Enums.constraintattribute
  (** Retrieves the attribute of the source to be read by the constraint. *)

  method get_strength : unit -> int
  (** Retrieves the strength of the constraint. *)

  method get_target : unit -> Constraint_target.constraint_target_t option
  (** Retrieves the [Gtk.ConstraintTarget] used as the target for the
      constraint.

      If the targe is set to [NULL] at creation, the constraint will use the
      widget using the [Gtk.ConstraintLayout] as the target. *)

  method get_target_attribute : unit -> Enums.constraintattribute
  (** Retrieves the attribute of the target to be set by the constraint. *)

  method is_attached : unit -> bool
  (** Checks whether the constraint is attached to a [Gtk.ConstraintLayout], and
      it is contributing to the layout. *)

  method is_constant : unit -> bool
  (** Checks whether the constraint describes a relation between an attribute on
      the [Gtk.Constraint:target] and a constant value. *)

  method is_required : unit -> bool
  (** Checks whether the constraint is a required relation for solving the
      constraint layout. *)

  method as_constraint_ : Raw.Constraint.t
end

class constraint_ : Raw.Constraint.t -> constraint__t
(** Wraps a raw handle of {!Ocgtk.Raw.Constraint.t}. *)

(** {1:description Description}

    Describes a constraint between attributes of two widgets, expressed as a
    linear equation.

    The typical equation for a constraint is:

    {[
      target.target_attr = source.source_attr × multiplier + constant
    ]}

    Each [GtkConstraint] is part of a system that will be solved by a
    [Gtk.ConstraintLayout] in order to allocate and position each child widget
    or guide.

    The source and target, as well as their attributes, of a [GtkConstraint]
    instance are immutable after creation. *)

(** {1:constructors Constructors} *)

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
(** Creates a new constraint representing a relation between a layout attribute
    on a source and a layout attribute on a target. *)

val new_constant :
  Constraint_target.constraint_target_t option ->
  Enums.constraintattribute ->
  Enums.constraintrelation ->
  float ->
  int ->
  constraint__t
(** Creates a new constraint representing a relation between a layout attribute
    on a target and a constant value. *)
