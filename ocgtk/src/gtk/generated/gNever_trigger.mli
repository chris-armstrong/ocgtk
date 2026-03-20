class type never_trigger_t = object
    method as_never_trigger : Never_trigger.t
end

class never_trigger : Never_trigger.t -> never_trigger_t

