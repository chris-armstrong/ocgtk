class type shortcut_trigger_t = object
  method compare : shortcut_trigger_t -> int
  method equal : shortcut_trigger_t -> bool
  method hash : unit -> int
  method to_label : Ocgdk.Display.display_t -> string
  method to_string : unit -> string
  method trigger : Ocgdk.Event.event_t -> bool -> Ocgdk.Enums.keymatch
  method as_shortcut_trigger : Raw.Shortcut_trigger.t
end

class shortcut_trigger : Raw.Shortcut_trigger.t -> shortcut_trigger_t

val parse_string : string -> shortcut_trigger_t
