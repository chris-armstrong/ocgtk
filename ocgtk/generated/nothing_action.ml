class type nothing_action_t = object
  inherit Shortcut_action.shortcut_action_t

  (** {2:conversions Conversions} *)

  method as_nothing_action : Raw.Nothing_action.t
end

(* High-level class for NothingAction *)
class nothing_action (obj : Raw.Nothing_action.t) : nothing_action_t =
  object (self)
    inherit Shortcut_action.shortcut_action (obj :> Raw.Shortcut_action.t)
    method as_nothing_action = obj
  end
