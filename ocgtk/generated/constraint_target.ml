class type constraint_target_t = object
  (** {2:conversions Conversions} *)

  method as_constraint_target : Raw.Constraint_target.t
end

(* High-level class for ConstraintTarget *)
class constraint_target (obj : Raw.Constraint_target.t) : constraint_target_t =
  object (self)
    method as_constraint_target = obj
  end
