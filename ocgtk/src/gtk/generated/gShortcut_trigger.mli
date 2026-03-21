class type shortcut_trigger_t = object
    method compare : shortcut_trigger_t -> int
    method equal : shortcut_trigger_t -> bool
    method hash : unit -> int
    method to_label : Ocgtk_gdk.Gdk.display_t -> string
    method to_string : unit -> string
    method trigger : Ocgtk_gdk.Gdk.event_t -> bool -> Ocgtk_gdk.Gdk.keymatch
    method as_shortcut_trigger : Shortcut_trigger.t
end

class shortcut_trigger : Shortcut_trigger.t -> shortcut_trigger_t

