class type never_trigger_t = object
    method as_never_trigger : Never_trigger.t
end

(* High-level class for NeverTrigger *)
class never_trigger (obj : Never_trigger.t) : never_trigger_t = object (self)

    method as_never_trigger = obj
end

