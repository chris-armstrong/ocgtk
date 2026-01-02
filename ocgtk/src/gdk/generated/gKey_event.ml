(* High-level class for KeyEvent *)
class key_event (obj : Key_event.t) = object (self)

  method get_consumed_modifiers : unit -> Gdk_enums.modifiertype =
    fun () ->
      (Key_event.get_consumed_modifiers obj)

  method get_keycode : unit -> int =
    fun () ->
      (Key_event.get_keycode obj)

  method get_keyval : unit -> int =
    fun () ->
      (Key_event.get_keyval obj)

  method get_layout : unit -> int =
    fun () ->
      (Key_event.get_layout obj)

  method get_level : unit -> int =
    fun () ->
      (Key_event.get_level obj)

  method is_modifier : unit -> bool =
    fun () ->
      (Key_event.is_modifier obj)

  method matches : int -> Gdk_enums.modifiertype -> Gdk_enums.keymatch =
    fun keyval modifiers ->
      (Key_event.matches obj keyval modifiers)

    method as_key_event = obj
end

