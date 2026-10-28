(** [GtkLayoutChild] subclass for children in a [GtkConstraintLayout].

    Its methods, signals and properties are on
    {!class-type-constraint_layout_child_t}. The functions it is built on are in
    {!Ocgtk.Raw.Constraint_layout_child}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [ConstraintLayoutChild].}

    [GtkLayoutChild] subclass for children in a [GtkConstraintLayout]. *)
class type constraint_layout_child_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .layout_child_t

  method as_constraint_layout_child : Raw.Constraint_layout_child.t
end

class constraint_layout_child :
  Raw.Constraint_layout_child.t ->
  constraint_layout_child_t
(** Wraps a raw handle of {!Ocgtk.Raw.Constraint_layout_child.t}. *)
