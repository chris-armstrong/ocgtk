class type pad_action_entry_t = object
  (** {2:conversions Conversions} *)

  method as_pad_action_entry : Raw.Pad_action_entry.t
end

(* High-level class for PadActionEntry *)
class pad_action_entry (obj : Raw.Pad_action_entry.t) : pad_action_entry_t =
  object (self)
    method as_pad_action_entry = obj
  end
