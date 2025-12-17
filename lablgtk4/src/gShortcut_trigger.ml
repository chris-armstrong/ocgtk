(* High-level class for ShortcutTrigger *)
class shortcut_trigger (obj : Shortcut_trigger.t) = object (self)

  method hash : unit -> int = fun () -> (Shortcut_trigger.hash obj )

  method trigger : 'a. 'a Gdk.event -> bool -> Gdk.keymatch = fun event enable_mnemonics -> (Shortcut_trigger.trigger obj event enable_mnemonics)

    method as_shortcut_trigger = obj
end

