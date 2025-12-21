(* GENERATED CODE - DO NOT EDIT *)
(* Constraint: Constraint *)

type t = [`constraint_ | `object_] Gobject.obj

(** Create a new Constraint *)
external new_ : unit -> Gtk_enums.constraintattribute -> Gtk_enums.constraintrelation -> unit -> Gtk_enums.constraintattribute -> float -> float -> int -> t = "ml_gtk_constraint_new_bytecode" "ml_gtk_constraint_new_native"

(** Create a new Constraint *)
external new_constant : unit -> Gtk_enums.constraintattribute -> Gtk_enums.constraintrelation -> float -> int -> t = "ml_gtk_constraint_new_constant"

(* Methods *)
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

(** Retrieves the strength of the constraint. *)
external get_strength : t -> int = "ml_gtk_constraint_get_strength"

(** Retrieves the attribute of the source to be read by the constraint. *)
external get_source_attribute : t -> Gtk_enums.constraintattribute = "ml_gtk_constraint_get_source_attribute"

(** The order relation between the terms of the constraint. *)
external get_relation : t -> Gtk_enums.constraintrelation = "ml_gtk_constraint_get_relation"

(** Retrieves the multiplication factor applied to the source
attribute's value. *)
external get_multiplier : t -> float = "ml_gtk_constraint_get_multiplier"

(** Retrieves the constant factor added to the source attributes' value. *)
external get_constant : t -> float = "ml_gtk_constraint_get_constant"

(* Properties *)

