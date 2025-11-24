(* GENERATED CODE - DO NOT EDIT *)
(* Widget: Constraint *)

type t = Gtk.widget

external new_ : unit -> Gtk_enums.constraintattribute -> Gtk_enums.constraintrelation -> unit -> Gtk_enums.constraintattribute -> float -> float -> int -> t = "ml_gtk_constraint_new_bytecode" "ml_gtk_constraint_new_native"

external new_constant : unit -> Gtk_enums.constraintattribute -> Gtk_enums.constraintrelation -> float -> int -> t = "ml_gtk_constraint_new_constant"

(* Properties *)

external get_constant : t -> float = "ml_gtk_constraint_get_constant"

external get_multiplier : t -> float = "ml_gtk_constraint_get_multiplier"

external get_strength : t -> int = "ml_gtk_constraint_get_strength"

external is_required : t -> bool = "ml_gtk_constraint_is_required"

external is_constant : t -> bool = "ml_gtk_constraint_is_constant"

external is_attached : t -> bool = "ml_gtk_constraint_is_attached"

external get_target_attribute : t -> Gtk_enums.constraintattribute = "ml_gtk_constraint_get_target_attribute"

external get_target : t -> Gtk.widget = "ml_gtk_constraint_get_target"

external get_source_attribute : t -> Gtk_enums.constraintattribute = "ml_gtk_constraint_get_source_attribute"

external get_source : t -> Gtk.widget = "ml_gtk_constraint_get_source"

external get_relation : t -> Gtk_enums.constraintrelation = "ml_gtk_constraint_get_relation"

