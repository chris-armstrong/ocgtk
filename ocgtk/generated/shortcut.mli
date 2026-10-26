class type shortcut_t = object
  method get_action : unit -> Shortcut_action.shortcut_action_t option
  method get_arguments : unit -> Gvariant.t option
  method get_trigger : unit -> Shortcut_trigger.shortcut_trigger_t option
  method set_action : Shortcut_action.shortcut_action_t option -> unit
  method set_arguments : Gvariant.t option -> unit
  method set_trigger : Shortcut_trigger.shortcut_trigger_t option -> unit
  method as_shortcut : Raw.Shortcut.t
end

class shortcut : Raw.Shortcut.t -> shortcut_t

val new_ :
  Shortcut_trigger.shortcut_trigger_t option ->
  Shortcut_action.shortcut_action_t option ->
  shortcut_t
