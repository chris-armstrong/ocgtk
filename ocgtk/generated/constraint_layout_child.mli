(** [GtkLayoutChild] subclass for children in a [GtkConstraintLayout].

    Its methods, signals and properties are on
    {!class-type-constraint_layout_child_t}. The functions it is built on are in
    {!Ocgtk.Raw.Constraint_layout_child}. *)

(** The methods, signals and properties of a [GtkConstraintLayoutChild]. *)
class type constraint_layout_child_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .layout_child_t

  method as_constraint_layout_child : Raw.Constraint_layout_child.t
end

class constraint_layout_child :
  Raw.Constraint_layout_child.t ->
  constraint_layout_child_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Constraint_layout_child.t}. Apply it
    directly only to convert a handle obtained from layer 1: constructors, and
    methods that return a [GtkConstraintLayoutChild], give one already wrapped.
*)
