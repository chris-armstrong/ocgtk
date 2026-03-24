class type alternative_trigger_t = object
    inherit GShortcut_trigger.shortcut_trigger_t
    method get_first : unit -> GShortcut_trigger.shortcut_trigger_t
    method get_second : unit -> GShortcut_trigger.shortcut_trigger_t
    method as_alternative_trigger : Alternative_trigger.t
end

(* High-level class for AlternativeTrigger *)
class alternative_trigger (obj : Alternative_trigger.t) : alternative_trigger_t = object (self)
  inherit GShortcut_trigger.shortcut_trigger (obj :> Shortcut_trigger.t)

  method get_first : unit -> GShortcut_trigger.shortcut_trigger_t =
    fun () ->
      new  GShortcut_trigger.shortcut_trigger(Alternative_trigger.get_first obj)

  method get_second : unit -> GShortcut_trigger.shortcut_trigger_t =
    fun () ->
      new  GShortcut_trigger.shortcut_trigger(Alternative_trigger.get_second obj)

    method as_alternative_trigger = obj
end

let new_ (first : GShortcut_trigger.shortcut_trigger_t) (second : GShortcut_trigger.shortcut_trigger_t) : alternative_trigger_t =
  let first = first#as_shortcut_trigger in
  let second = second#as_shortcut_trigger in
  new alternative_trigger (Alternative_trigger.new_ first second)

