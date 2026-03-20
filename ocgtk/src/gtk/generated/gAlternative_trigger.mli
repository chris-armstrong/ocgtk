class type alternative_trigger_t = object
    method get_first : unit -> GShortcut_trigger.shortcut_trigger_t
    method get_second : unit -> GShortcut_trigger.shortcut_trigger_t
    method as_alternative_trigger : Alternative_trigger.t
end

class alternative_trigger : Alternative_trigger.t -> alternative_trigger_t

