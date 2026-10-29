class type constraint_layout_child_t = object
  inherit Layout_child.layout_child_t

  (** {2:conversions Conversions} *)

  method as_constraint_layout_child : Raw.Constraint_layout_child.t
end

(* High-level class for ConstraintLayoutChild *)
class constraint_layout_child (obj : Raw.Constraint_layout_child.t) :
  constraint_layout_child_t =
  object (self)
    inherit Layout_child.layout_child (obj :> Raw.Layout_child.t)
    method as_constraint_layout_child = obj
  end
