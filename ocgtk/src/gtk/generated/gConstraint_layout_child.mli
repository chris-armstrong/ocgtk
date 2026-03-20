class type constraint_layout_child_t = object
    method as_constraint_layout_child : Constraint_layout_child.t
end

class constraint_layout_child : Constraint_layout_child.t -> constraint_layout_child_t

