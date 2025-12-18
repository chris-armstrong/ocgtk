(* GENERATED CODE - DO NOT EDIT *)
(* ConstraintGuide: ConstraintGuide *)

type t = [`constraint_guide | `object_] Gobject.obj

(** Create a new ConstraintGuide *)
external new_ : unit -> t = "ml_gtk_constraint_guide_new"

(* Properties *)

(** Get property: max-height *)
external get_max_height : t -> int = "ml_gtk_constraint_guide_get_max_height"

(** Set property: max-height *)
external set_max_height : t -> int -> unit = "ml_gtk_constraint_guide_set_max_height"

(** Get property: max-width *)
external get_max_width : t -> int = "ml_gtk_constraint_guide_get_max_width"

(** Set property: max-width *)
external set_max_width : t -> int -> unit = "ml_gtk_constraint_guide_set_max_width"

(** Get property: min-height *)
external get_min_height : t -> int = "ml_gtk_constraint_guide_get_min_height"

(** Set property: min-height *)
external set_min_height : t -> int -> unit = "ml_gtk_constraint_guide_set_min_height"

(** Get property: min-width *)
external get_min_width : t -> int = "ml_gtk_constraint_guide_get_min_width"

(** Set property: min-width *)
external set_min_width : t -> int -> unit = "ml_gtk_constraint_guide_set_min_width"

(** Get property: name *)
external get_name : t -> string = "ml_gtk_constraint_guide_get_name"

(** Set property: name *)
external set_name : t -> string -> unit = "ml_gtk_constraint_guide_set_name"

(** Get property: nat-height *)
external get_nat_height : t -> int = "ml_gtk_constraint_guide_get_nat_height"

(** Set property: nat-height *)
external set_nat_height : t -> int -> unit = "ml_gtk_constraint_guide_set_nat_height"

(** Get property: nat-width *)
external get_nat_width : t -> int = "ml_gtk_constraint_guide_get_nat_width"

(** Set property: nat-width *)
external set_nat_width : t -> int -> unit = "ml_gtk_constraint_guide_set_nat_width"

(** Sets the strength of the constraint on the natural size of the
given `GtkConstraintGuide`. *)
external set_strength : t -> Gtk_enums.constraintstrength -> unit = "ml_gtk_constraint_guide_set_strength"

(** Sets the natural size of @guide.

If @guide is attached to a `GtkConstraintLayout`,
the constraints will be updated to reflect the new size. *)
external set_nat_size : t -> int -> int -> unit = "ml_gtk_constraint_guide_set_nat_size"

(** Sets the minimum size of @guide.

If @guide is attached to a `GtkConstraintLayout`,
the constraints will be updated to reflect the new size. *)
external set_min_size : t -> int -> int -> unit = "ml_gtk_constraint_guide_set_min_size"

(** Sets the maximum size of @guide.

If @guide is attached to a `GtkConstraintLayout`,
the constraints will be updated to reflect the new size. *)
external set_max_size : t -> int -> int -> unit = "ml_gtk_constraint_guide_set_max_size"

(** Retrieves the strength set using gtk_constraint_guide_set_strength(). *)
external get_strength : t -> Gtk_enums.constraintstrength = "ml_gtk_constraint_guide_get_strength"

