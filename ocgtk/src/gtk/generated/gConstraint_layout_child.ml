class type constraint_layout_child_t = object
    method as_constraint_layout_child : Constraint_layout_child.t
end

(* High-level class for ConstraintLayoutChild *)
class constraint_layout_child (obj : Constraint_layout_child.t) : constraint_layout_child_t = object (self)

    method as_constraint_layout_child = obj
end

