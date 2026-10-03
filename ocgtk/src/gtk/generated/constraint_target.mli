(* GENERATED CODE - DO NOT EDIT *)
(* ConstraintTarget: ConstraintTarget *)

type t = [ `constraint_target ] Gobject.obj
(** Makes it possible to use an object as source or target in a
    [Gtk.Constraint].

    Besides [GtkWidget], it is also implemented by [GtkConstraintGuide]. *)

external from_gobject : 'a Gobject.obj -> t
  = "ml_gtk_constraint_target_from_gobject"

(* Methods *)
