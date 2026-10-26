class type alternative_trigger_t = object
  inherit Shortcut_trigger.shortcut_trigger_t
  method get_first : unit -> Shortcut_trigger.shortcut_trigger_t
  method get_second : unit -> Shortcut_trigger.shortcut_trigger_t
  method as_alternative_trigger : Raw.Alternative_trigger.t
end

class alternative_trigger : Raw.Alternative_trigger.t -> alternative_trigger_t

val new_ :
  Shortcut_trigger.shortcut_trigger_t ->
  Shortcut_trigger.shortcut_trigger_t ->
  alternative_trigger_t
