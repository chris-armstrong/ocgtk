(* GENERATED CODE - DO NOT EDIT *)
(* ConstraintTarget: ConstraintTarget *)

(** Makes it possible to use an object as source or target in a
    [Gtk.Constraint].

    Besides [GtkWidget], it is also implemented by [GtkConstraintGuide]. *)

type t = [ `constraint_target ] Gobject.obj

external from_gobject : 'a Gobject.obj -> t
  = "ml_gtk_constraint_target_from_gobject"

(* Methods *)
