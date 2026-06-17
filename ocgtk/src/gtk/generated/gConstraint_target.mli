class type constraint_target_t = object
    method as_constraint_target : Constraint_target.t
end

class constraint_target : Constraint_target.t -> constraint_target_t

