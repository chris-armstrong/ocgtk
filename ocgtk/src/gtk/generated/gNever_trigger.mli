class type never_trigger_t = object
    inherit GShortcut_trigger.shortcut_trigger_t
    method as_never_trigger : Never_trigger.t
end

class never_trigger : Never_trigger.t -> never_trigger_t

