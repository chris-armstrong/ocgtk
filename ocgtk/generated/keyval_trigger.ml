class type keyval_trigger_t = object
  inherit Shortcut_trigger.shortcut_trigger_t

  (** {2:methods Methods} *)

  method get_keyval : unit -> int
  (** Gets the keyval that must be pressed to succeed triggering [self]. *)

  method get_modifiers : unit -> Ocgdk.Enums.modifiertype
  (** Gets the modifiers that must be present to succeed triggering [self]. *)

  (** {2:conversions Conversions} *)

  method as_keyval_trigger : Raw.Keyval_trigger.t
end

(* High-level class for KeyvalTrigger *)
class keyval_trigger (obj : Raw.Keyval_trigger.t) : keyval_trigger_t =
  object (self)
    inherit Shortcut_trigger.shortcut_trigger (obj :> Raw.Shortcut_trigger.t)

    method get_keyval : unit -> int =
      fun () -> Raw.Keyval_trigger.get_keyval obj

    method get_modifiers : unit -> Ocgdk.Enums.modifiertype =
      fun () -> Raw.Keyval_trigger.get_modifiers obj

    method as_keyval_trigger = obj
  end

let new_ (keyval : int) (modifiers : Ocgdk.Enums.modifiertype) :
    keyval_trigger_t =
  let obj_ = Raw.Keyval_trigger.new_ keyval modifiers in
  new keyval_trigger obj_
