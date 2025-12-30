class shortcut_action : Shortcut_action.t ->
  object
    method to_string : unit -> string
    method as_shortcut_action : Shortcut_action.t
  end

