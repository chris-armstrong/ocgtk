(* High-level class for Actionable *)
class actionable (obj : Actionable.t) = object (self)

  method action_name = Actionable.get_action_name obj
  method set_action_name v = Actionable.set_action_name obj v

  method set_detailed_action_name : string -> unit = fun detailed_action_name -> (Actionable.set_detailed_action_name obj detailed_action_name)

    method as_actionable = obj
end

