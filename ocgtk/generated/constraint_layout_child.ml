class type constraint_layout_child_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .layout_child_t

  (** {2:conversions Conversions} *)

  method as_constraint_layout_child : Raw.Constraint_layout_child.t
end

(* High-level class for ConstraintLayoutChild *)
class constraint_layout_child (obj : Raw.Constraint_layout_child.t) :
  constraint_layout_child_t =
  object (self)
    inherit
      Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
      .layout_child
        (obj :> Raw.Layout_child.t)

    method as_constraint_layout_child = obj
  end
