(* High-level class for ShortcutTrigger *)
class shortcut_trigger (obj : Shortcut_trigger.t) = object (self)

  method compare : 'p1. (<as_shortcut_trigger: Shortcut_trigger.t; ..> as 'p1) -> int =
    fun trigger2 ->
      let trigger2 = trigger2#as_shortcut_trigger in
      (Shortcut_trigger.compare obj trigger2)

  method equal : 'p1. (<as_shortcut_trigger: Shortcut_trigger.t; ..> as 'p1) -> bool =
    fun trigger2 ->
      let trigger2 = trigger2#as_shortcut_trigger in
      (Shortcut_trigger.equal obj trigger2)

  method hash : unit -> int =
    fun () ->
      (Shortcut_trigger.hash obj)

  method to_string : unit -> string =
    fun () ->
      (Shortcut_trigger.to_string obj)

    method as_shortcut_trigger = obj
end

