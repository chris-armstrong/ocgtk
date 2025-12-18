(* GENERATED CODE - DO NOT EDIT *)
(* Layout manager: ConstraintLayout *)

type t = [`constraint_layout | `layout_manager | `object_] Gobject.obj

val as_layoutmanager : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Layout_manager.t

(** Create a new ConstraintLayout *)
external new_ : unit -> t = "ml_gtk_constraint_layout_new"

(** Removes `guide` from the layout manager,
so that it no longer influences the layout. *)
external remove_guide : t -> Constraint_guide.t -> unit = "ml_gtk_constraint_layout_remove_guide"

(** Removes `constraint` from the layout manager,
so that it no longer influences the layout. *)
external remove_constraint : t -> Constraint.t -> unit = "ml_gtk_constraint_layout_remove_constraint"

(** Removes all constraints from the layout manager. *)
external remove_all_constraints : t -> unit = "ml_gtk_constraint_layout_remove_all_constraints"

(** Adds a guide to `layout`.

A guide can be used as the source or target of constraints,
like a widget, but it is not visible.

The `layout` acquires the ownership of `guide` after calling
this function. *)
external add_guide : t -> Constraint_guide.t -> unit = "ml_gtk_constraint_layout_add_guide"

(** Adds a constraint to the layout manager.

The [property@Gtk.Constraint:source] and [property@Gtk.Constraint:target]
properties of `constraint` can be:

 - set to `NULL` to indicate that the constraint refers to the
   widget using `layout`
 - set to the [class@Gtk.Widget] using `layout`
 - set to a child of the [class@Gtk.Widget] using `layout`
 - set to a [class@Gtk.ConstraintGuide] that is part of `layout`

The @layout acquires the ownership of @constraint after calling
this function. *)
external add_constraint : t -> Constraint.t -> unit = "ml_gtk_constraint_layout_add_constraint"

