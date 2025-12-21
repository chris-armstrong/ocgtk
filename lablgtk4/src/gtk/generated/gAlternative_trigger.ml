(* High-level class for AlternativeTrigger *)
class alternative_trigger (obj : Alternative_trigger.t) = object (self)

  method get_first : unit -> GShortcut_trigger.shortcut_trigger =
    fun () ->
      new  GShortcut_trigger.shortcut_trigger(Alternative_trigger.get_first obj)

  method get_second : unit -> GShortcut_trigger.shortcut_trigger =
    fun () ->
      new  GShortcut_trigger.shortcut_trigger(Alternative_trigger.get_second obj)

    method as_alternative_trigger = obj
end

