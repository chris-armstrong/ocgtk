class type shortcut_t = object
  method get_action : unit -> GShortcut_action.shortcut_action_t option
  method get_arguments : unit -> Gvariant.t option
  method get_trigger : unit -> GShortcut_trigger.shortcut_trigger_t option
  method set_action : GShortcut_action.shortcut_action_t option -> unit
  method set_arguments : Gvariant.t option -> unit
  method set_trigger : GShortcut_trigger.shortcut_trigger_t option -> unit
  method as_shortcut : Shortcut.t
end

class shortcut : Shortcut.t -> shortcut_t

val new_ :
  GShortcut_trigger.shortcut_trigger_t option ->
  GShortcut_action.shortcut_action_t option ->
  shortcut_t
