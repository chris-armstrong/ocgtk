class type shortcut_trigger_t = object
    method compare : shortcut_trigger_t -> int
    method equal : shortcut_trigger_t -> bool
    method hash : unit -> int
    method to_label : Ocgtk_gdk.Gdk.Display.display_t -> string
    method to_string : unit -> string
    method trigger : Ocgtk_gdk.Gdk.Event.event_t -> bool -> Ocgtk_gdk.Gdk.keymatch
    method as_shortcut_trigger : Shortcut_trigger.t
end

(* High-level class for ShortcutTrigger *)
class shortcut_trigger (obj : Shortcut_trigger.t) : shortcut_trigger_t = object (self)

  method compare : shortcut_trigger_t -> int =
    fun trigger2 ->
      let trigger2 = trigger2#as_shortcut_trigger in
      (Shortcut_trigger.compare obj trigger2)

  method equal : shortcut_trigger_t -> bool =
    fun trigger2 ->
      let trigger2 = trigger2#as_shortcut_trigger in
      (Shortcut_trigger.equal obj trigger2)

  method hash : unit -> int =
    fun () ->
      (Shortcut_trigger.hash obj)

  method to_label : Ocgtk_gdk.Gdk.Display.display_t -> string =
    fun display ->
      let display = display#as_display in
      (Shortcut_trigger.to_label obj display)

  method to_string : unit -> string =
    fun () ->
      (Shortcut_trigger.to_string obj)

  method trigger : Ocgtk_gdk.Gdk.Event.event_t -> bool -> Ocgtk_gdk.Gdk.keymatch =
    fun event enable_mnemonics ->
      let event = event#as_event in
      (Shortcut_trigger.trigger obj event enable_mnemonics)

    method as_shortcut_trigger = obj
end

let parse_string (string : string) : shortcut_trigger_t =
  new shortcut_trigger (Shortcut_trigger.parse_string string)

