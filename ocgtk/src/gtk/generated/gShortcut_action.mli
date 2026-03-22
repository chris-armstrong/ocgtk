class type shortcut_action_t = object
    method to_string : unit -> string
    method as_shortcut_action : Shortcut_action.t
end

class shortcut_action : Shortcut_action.t -> shortcut_action_t

val parse_string : string -> shortcut_action_t
