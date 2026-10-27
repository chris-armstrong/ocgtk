(** Makes it possible to use an object as source or target in a
    [Gtk.Constraint].

    Besides [GtkWidget], it is also implemented by [GtkConstraintGuide].

    Its methods, signals and properties are on
    {!class-type-constraint_target_t}. The functions it is built on are in
    {!Ocgtk.Raw.Constraint_target}. *)

(** The methods, signals and properties of a [GtkConstraintTarget]. *)
class type constraint_target_t = object
  method as_constraint_target : Raw.Constraint_target.t
end

class constraint_target : Raw.Constraint_target.t -> constraint_target_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Constraint_target.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [GtkConstraintTarget], give one already wrapped. *)
