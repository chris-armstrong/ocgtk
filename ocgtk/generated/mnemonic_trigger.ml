class type mnemonic_trigger_t = object
  inherit Shortcut_trigger.shortcut_trigger_t

  (** {2:methods Methods} *)

  method get_keyval : unit -> int
  (** Gets the keyval that must be pressed to succeed triggering [self]. *)

  (** {2:conversions Conversions} *)

  method as_mnemonic_trigger : Raw.Mnemonic_trigger.t
end

(* High-level class for MnemonicTrigger *)
class mnemonic_trigger (obj : Raw.Mnemonic_trigger.t) : mnemonic_trigger_t =
  object (self)
    inherit Shortcut_trigger.shortcut_trigger (obj :> Raw.Shortcut_trigger.t)

    method get_keyval : unit -> int =
      fun () -> Raw.Mnemonic_trigger.get_keyval obj

    method as_mnemonic_trigger = obj
  end

let new_ (keyval : int) : mnemonic_trigger_t =
  let obj_ = Raw.Mnemonic_trigger.new_ keyval in
  new mnemonic_trigger obj_
