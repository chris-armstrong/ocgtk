class type mnemonic_trigger_t = object
    inherit GShortcut_trigger.shortcut_trigger_t
    method get_keyval : unit -> int
    method as_mnemonic_trigger : Mnemonic_trigger.t
end

(* High-level class for MnemonicTrigger *)
class mnemonic_trigger (obj : Mnemonic_trigger.t) : mnemonic_trigger_t = object (self)
  inherit GShortcut_trigger.shortcut_trigger (Obj.magic obj : Shortcut_trigger.t)

  method get_keyval : unit -> int =
    fun () ->
      (Mnemonic_trigger.get_keyval obj)

    method as_mnemonic_trigger = obj
end

let new_ (keyval : int) : mnemonic_trigger_t =
  new mnemonic_trigger (Mnemonic_trigger.new_ keyval)

