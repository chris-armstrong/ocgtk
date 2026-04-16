class type constraint_target_t = object
  method as_constraint_target : Constraint_target.t
end

(* High-level class for ConstraintTarget *)
class constraint_target (obj : Constraint_target.t) : constraint_target_t =
  object (self)
    method as_constraint_target = obj
  end
