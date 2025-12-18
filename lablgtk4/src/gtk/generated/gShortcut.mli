class shortcut : Shortcut.t ->
  object
    method get_action : unit -> GShortcut_action.shortcut_action option
    method get_trigger : unit -> GShortcut_trigger.shortcut_trigger option
    method set_action : #GShortcut_action.shortcut_action option -> unit
    method set_trigger : #GShortcut_trigger.shortcut_trigger option -> unit
    method as_shortcut : Shortcut.t
  end

