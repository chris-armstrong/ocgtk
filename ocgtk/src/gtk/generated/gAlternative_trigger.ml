class type alternative_trigger_t = object
    method get_first : unit -> GShortcut_trigger.shortcut_trigger_t
    method get_second : unit -> GShortcut_trigger.shortcut_trigger_t
    method as_alternative_trigger : Alternative_trigger.t
end

(* High-level class for AlternativeTrigger *)
class alternative_trigger (obj : Alternative_trigger.t) : alternative_trigger_t = object (self)

  method get_first : unit -> GShortcut_trigger.shortcut_trigger_t =
    fun () ->
      new  GShortcut_trigger.shortcut_trigger(Alternative_trigger.get_first obj)

  method get_second : unit -> GShortcut_trigger.shortcut_trigger_t =
    fun () ->
      new  GShortcut_trigger.shortcut_trigger(Alternative_trigger.get_second obj)

    method as_alternative_trigger = obj
end

