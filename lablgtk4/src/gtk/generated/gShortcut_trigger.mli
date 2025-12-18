class shortcut_trigger : Shortcut_trigger.t ->
  object
    method hash : unit -> int
    method trigger : 'a. 'a Gdk.event -> bool -> Gdk.keymatch
    method as_shortcut_trigger : Shortcut_trigger.t
  end

