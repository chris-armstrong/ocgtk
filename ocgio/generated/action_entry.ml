class type action_entry_t = object
  (** {2:conversions Conversions} *)

  method as_action_entry : Raw.Action_entry.t
end

(* High-level class for ActionEntry *)
class action_entry (obj : Raw.Action_entry.t) : action_entry_t =
  object (self)
    method as_action_entry = obj
  end
