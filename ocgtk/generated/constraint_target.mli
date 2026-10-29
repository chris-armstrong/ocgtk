(** Makes it possible to use an object as source or target in a
    {{!Ocgtk.Constraint.class-type-constraint__t}[Gtk.Constraint]}.

    Its methods, signals and properties are on
    {!class-type-constraint_target_t}. Its full description is under
    {!section-description}. Its constructors are under {!section-constructors}.
    The functions it is built on are in {!Ocgtk.Raw.Constraint_target}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [ConstraintTarget].}

    Makes it possible to use an object as source or target in a
    {{!Ocgtk.Constraint.class-type-constraint__t}[Gtk.Constraint]}.

    Besides [GtkWidget], it is also implemented by [GtkConstraintGuide]. *)
class type constraint_target_t = object
  (** {2:conversions Conversions} *)

  method as_constraint_target : Raw.Constraint_target.t
end

class constraint_target : Raw.Constraint_target.t -> constraint_target_t
(** Wraps a raw handle of {!Ocgtk.Raw.Constraint_target.t}. *)

(** {1:description Description}

    Makes it possible to use an object as source or target in a
    {{!Ocgtk.Constraint.class-type-constraint__t}[Gtk.Constraint]}.

    Besides [GtkWidget], it is also implemented by [GtkConstraintGuide]. *)

(** {1:constructors Constructors} *)

(** This is an interface which can't be instantiated directly, but which may be
    returned from a method or function. *)
