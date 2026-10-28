(* GENERATED CODE - DO NOT EDIT *)
(* ConstraintTarget: ConstraintTarget *)

(** Makes it possible to use an object as source or target in a
    [Gtk.Constraint].

    Besides [GtkWidget], it is also implemented by [GtkConstraintGuide].

    The class built on this module is in {!Ocgtk.Constraint_target}. *)

type t = [ `constraint_target ] Gobject.obj

external gtype : unit -> Gobject.Type.t = "ml_gtk_constraint_target_get_type"

external from_gobject : 'a Gobject.obj -> t
  = "ml_gtk_constraint_target_from_gobject"

(* Methods *)
