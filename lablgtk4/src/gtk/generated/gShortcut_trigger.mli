class shortcut_trigger : Shortcut_trigger.t ->
  object
    method compare : <as_shortcut_trigger: Shortcut_trigger.t; ..> -> int
    method equal : <as_shortcut_trigger: Shortcut_trigger.t; ..> -> bool
    method hash : unit -> int
    method to_string : unit -> string
    method as_shortcut_trigger : Shortcut_trigger.t
  end

