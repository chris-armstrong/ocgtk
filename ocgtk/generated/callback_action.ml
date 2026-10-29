class type callback_action_t = object
  inherit Shortcut_action.shortcut_action_t

  (** {2:conversions Conversions} *)

  method as_callback_action : Raw.Callback_action.t
end

(* High-level class for CallbackAction *)
class callback_action (obj : Raw.Callback_action.t) : callback_action_t =
  object (self)
    inherit Shortcut_action.shortcut_action (obj :> Raw.Shortcut_action.t)
    method as_callback_action = obj
  end
