class type signal_action_t = object
  inherit GShortcut_action.shortcut_action_t
  method get_signal_name : unit -> string
  method as_signal_action : Signal_action.t
end

class signal_action : Signal_action.t -> signal_action_t

val new_ : string -> signal_action_t
