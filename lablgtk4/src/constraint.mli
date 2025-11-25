(* GENERATED CODE - DO NOT EDIT *)
(* Widget: Constraint *)

type t = Gtk.widget

(** Create a new Constraint *)
external new_ : unit -> Gtk_enums.constraintattribute -> Gtk_enums.constraintrelation -> unit -> Gtk_enums.constraintattribute -> float -> float -> int -> t = "ml_gtk_constraint_new_bytecode" "ml_gtk_constraint_new_native"

(** Create a new Constraint *)
external new_constant : unit -> Gtk_enums.constraintattribute -> Gtk_enums.constraintrelation -> float -> int -> t = "ml_gtk_constraint_new_constant"

(* Properties *)

(** Checks whether the constraint is a required relation for solving the
constraint layout. *)
external is_required : t -> bool = "ml_gtk_constraint_is_required"

(** Checks whether the constraint describes a relation between an attribute
on the [property@Gtk.Constraint:target] and a constant value. *)
external is_constant : t -> bool = "ml_gtk_constraint_is_constant"

(** Checks whether the constraint is attached to a [class@Gtk.ConstraintLayout],
and it is contributing to the layout. *)
external is_attached : t -> bool = "ml_gtk_constraint_is_attached"

(** Retrieves the attribute of the target to be set by the constraint. *)
external get_target_attribute : t -> Gtk_enums.constraintattribute = "ml_gtk_constraint_get_target_attribute"

(** Retrieves the [iface@Gtk.ConstraintTarget] used as the target for
the constraint.

If the targe is set to `NULL` at creation, the constraint will use
the widget using the [class@Gtk.ConstraintLayout] as the target. *)
external get_target : t -> Gtk.widget = "ml_gtk_constraint_get_target"

(** Retrieves the strength of the constraint. *)
external get_strength : t -> int = "ml_gtk_constraint_get_strength"

(** Retrieves the attribute of the source to be read by the constraint. *)
external get_source_attribute : t -> Gtk_enums.constraintattribute = "ml_gtk_constraint_get_source_attribute"

(** Retrieves the [iface@Gtk.ConstraintTarget] used as the source for the
constraint.

If the source is set to `NULL` at creation, the constraint will use
the widget using the [class@Gtk.ConstraintLayout] as the source. *)
external get_source : t -> Gtk.widget = "ml_gtk_constraint_get_source"

(** The order relation between the terms of the constraint. *)
external get_relation : t -> Gtk_enums.constraintrelation = "ml_gtk_constraint_get_relation"

(** Retrieves the multiplication factor applied to the source
attribute's value. *)
external get_multiplier : t -> float = "ml_gtk_constraint_get_multiplier"

(** Retrieves the constant factor added to the source attributes' value. *)
external get_constant : t -> float = "ml_gtk_constraint_get_constant"

