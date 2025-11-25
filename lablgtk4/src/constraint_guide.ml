(* GENERATED CODE - DO NOT EDIT *)
(* Widget: ConstraintGuide *)

type t = Gtk.widget

(** Create a new ConstraintGuide *)
external new_ : unit -> t = "ml_gtk_constraint_guide_new"

(* Properties *)

(** Sets the strength of the constraint on the natural size of the
given `GtkConstraintGuide`. *)
external set_strength : t -> Gtk_enums.constraintstrength -> unit = "ml_gtk_constraint_guide_set_strength"

(** Sets the natural size of @guide.

If @guide is attached to a `GtkConstraintLayout`,
the constraints will be updated to reflect the new size. *)
external set_nat_size : t -> int -> int -> unit = "ml_gtk_constraint_guide_set_nat_size"

(** Sets a name for the given `GtkConstraintGuide`.

The name is useful for debugging purposes. *)
external set_name : t -> string option -> unit = "ml_gtk_constraint_guide_set_name"

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

(** Retrieves the name set using gtk_constraint_guide_set_name(). *)
external get_name : t -> string option = "ml_gtk_constraint_guide_get_name"

