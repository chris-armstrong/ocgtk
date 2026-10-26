class type never_trigger_t = object
  inherit Shortcut_trigger.shortcut_trigger_t
  method as_never_trigger : Raw.Never_trigger.t
end

class never_trigger : Raw.Never_trigger.t -> never_trigger_t
