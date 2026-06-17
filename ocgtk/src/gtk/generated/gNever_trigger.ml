class type never_trigger_t = object
    inherit GShortcut_trigger.shortcut_trigger_t
    method as_never_trigger : Never_trigger.t
end

(* High-level class for NeverTrigger *)
class never_trigger (obj : Never_trigger.t) : never_trigger_t = object (self)
  inherit GShortcut_trigger.shortcut_trigger (obj :> Shortcut_trigger.t)

    method as_never_trigger = obj
end

