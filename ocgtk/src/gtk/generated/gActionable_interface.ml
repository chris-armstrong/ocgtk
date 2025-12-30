(* High-level class for ActionableInterface *)
class actionable_interface (obj : Actionable_interface.t) = object (self)

    method as_actionable_interface = obj
end

