class alternative_trigger : Alternative_trigger.t ->
  object
    method get_first : unit -> GShortcut_trigger.shortcut_trigger
    method get_second : unit -> GShortcut_trigger.shortcut_trigger
    method as_alternative_trigger : Alternative_trigger.t
  end

