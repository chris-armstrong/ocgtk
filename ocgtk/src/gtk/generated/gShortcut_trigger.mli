class shortcut_trigger : Shortcut_trigger.t ->
  object
    method compare : <as_shortcut_trigger: Shortcut_trigger.t; ..> -> int
    method equal : <as_shortcut_trigger: Shortcut_trigger.t; ..> -> bool
    method hash : unit -> int
    method to_label : #Ocgtk_gdk.Gdk.display -> string
    method to_string : unit -> string
    method trigger : #Ocgtk_gdk.Gdk.event -> bool -> Ocgtk_gdk.Gdk.keymatch
    method as_shortcut_trigger : Shortcut_trigger.t
  end

