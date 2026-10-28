(* GENERATED CODE - DO NOT EDIT *)
(* ConstraintGuide: ConstraintGuide *)

(** An invisible layout element in a [GtkConstraintLayout].

    The [GtkConstraintLayout] treats guides like widgets. They can be used as
    the source or target of a [GtkConstraint].

    Guides have a minimum, maximum and natural size. Depending on the
    constraints that are applied, they can act like a guideline that widgets can
    be aligned to, or like {i flexible space}.

    Unlike a [GtkWidget], a [GtkConstraintGuide] will not be drawn.

    The class built on this module is in {!Ocgtk.Constraint_guide}. *)

type t = [ `constraint_guide | `object_ ] Gobject.obj

external gtype : unit -> Gobject.Type.t = "ml_gtk_constraint_guide_get_type"

external new_ : unit -> t = "ml_gtk_constraint_guide_new"
(** Creates a new [GtkConstraintGuide] object. *)

(* Methods *)

external set_strength : t -> Ocgtk_enums.constraintstrength -> unit
  = "ml_gtk_constraint_guide_set_strength"
(** Sets the strength of the constraint on the natural size of the given
    [GtkConstraintGuide]. *)

external set_nat_size : t -> int -> int -> unit
  = "ml_gtk_constraint_guide_set_nat_size"
(** Sets the natural size of [guide].

    If [guide] is attached to a [GtkConstraintLayout], the constraints will be
    updated to reflect the new size. *)

external set_name : t -> string option -> unit
  = "ml_gtk_constraint_guide_set_name"
(** Sets a name for the given [GtkConstraintGuide].

    The name is useful for debugging purposes. *)

external set_min_size : t -> int -> int -> unit
  = "ml_gtk_constraint_guide_set_min_size"
(** Sets the minimum size of [guide].

    If [guide] is attached to a [GtkConstraintLayout], the constraints will be
    updated to reflect the new size. *)

external set_max_size : t -> int -> int -> unit
  = "ml_gtk_constraint_guide_set_max_size"
(** Sets the maximum size of [guide].

    If [guide] is attached to a [GtkConstraintLayout], the constraints will be
    updated to reflect the new size. *)

external get_strength : t -> Ocgtk_enums.constraintstrength
  = "ml_gtk_constraint_guide_get_strength"
(** Retrieves the strength set using gtk_constraint_guide_set_strength(). *)

external get_nat_size : t -> int * int = "ml_gtk_constraint_guide_get_nat_size"
(** Gets the natural size of [guide]. *)

external get_name : t -> string option = "ml_gtk_constraint_guide_get_name"
(** Retrieves the name set using gtk_constraint_guide_set_name(). *)

external get_min_size : t -> int * int = "ml_gtk_constraint_guide_get_min_size"
(** Gets the minimum size of [guide]. *)

external get_max_size : t -> int * int = "ml_gtk_constraint_guide_get_max_size"
(** Gets the maximum size of [guide]. *)

(* Properties *)

external get_max_height : t -> int = "ml_gtk_constraint_guide_get_max_height"
(** The maximum height of the guide. *)

external set_max_height : t -> int -> unit
  = "ml_gtk_constraint_guide_set_max_height"
(** The maximum height of the guide. *)

external get_max_width : t -> int = "ml_gtk_constraint_guide_get_max_width"
(** The maximum width of the guide. *)

external set_max_width : t -> int -> unit
  = "ml_gtk_constraint_guide_set_max_width"
(** The maximum width of the guide. *)

external get_min_height : t -> int = "ml_gtk_constraint_guide_get_min_height"
(** The minimum height of the guide. *)

external set_min_height : t -> int -> unit
  = "ml_gtk_constraint_guide_set_min_height"
(** The minimum height of the guide. *)

external get_min_width : t -> int = "ml_gtk_constraint_guide_get_min_width"
(** The minimum width of the guide. *)

external set_min_width : t -> int -> unit
  = "ml_gtk_constraint_guide_set_min_width"
(** The minimum width of the guide. *)

external get_nat_height : t -> int = "ml_gtk_constraint_guide_get_nat_height"
(** The preferred, or natural, height of the guide. *)

external set_nat_height : t -> int -> unit
  = "ml_gtk_constraint_guide_set_nat_height"
(** The preferred, or natural, height of the guide. *)

external get_nat_width : t -> int = "ml_gtk_constraint_guide_get_nat_width"
(** The preferred, or natural, width of the guide. *)

external set_nat_width : t -> int -> unit
  = "ml_gtk_constraint_guide_set_nat_width"
(** The preferred, or natural, width of the guide. *)
