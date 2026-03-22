class type named_action_t = object
    inherit GShortcut_action.shortcut_action_t
    method get_action_name : unit -> string
    method as_named_action : Named_action.t
end

class named_action : Named_action.t -> named_action_t

