class type shortcut_trigger_t = object
  method compare : shortcut_trigger_t -> int
  method equal : shortcut_trigger_t -> bool
  method hash : unit -> int
  method to_label : Ocgdk.Display.display_t -> string
  method to_string : unit -> string
  method trigger : Ocgdk.Event.event_t -> bool -> Ocgdk.Enums.keymatch
  method as_shortcut_trigger : Raw.Shortcut_trigger.t
end

(* High-level class for ShortcutTrigger *)
class shortcut_trigger (obj : Raw.Shortcut_trigger.t) : shortcut_trigger_t =
  object (self)
    method compare : shortcut_trigger_t -> int =
      fun trigger2 ->
        let trigger2 = trigger2#as_shortcut_trigger in
        Raw.Shortcut_trigger.compare obj trigger2

    method equal : shortcut_trigger_t -> bool =
      fun trigger2 ->
        let trigger2 = trigger2#as_shortcut_trigger in
        Raw.Shortcut_trigger.equal obj trigger2

    method hash : unit -> int = fun () -> Raw.Shortcut_trigger.hash obj

    method to_label : Ocgdk.Display.display_t -> string =
      fun display ->
        let display = display#as_display in
        Raw.Shortcut_trigger.to_label obj display

    method to_string : unit -> string =
      fun () -> Raw.Shortcut_trigger.to_string obj

    method trigger : Ocgdk.Event.event_t -> bool -> Ocgdk.Enums.keymatch =
      fun event enable_mnemonics ->
        let event = event#as_event in
        Raw.Shortcut_trigger.trigger obj event enable_mnemonics

    method as_shortcut_trigger = obj
  end

let parse_string (string : string) : shortcut_trigger_t =
  let obj_ = Raw.Shortcut_trigger.parse_string string in
  new shortcut_trigger obj_
