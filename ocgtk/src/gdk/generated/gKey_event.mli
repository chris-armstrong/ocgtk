class key_event : Key_event.t ->
  object
    method get_consumed_modifiers : unit -> Gdk_enums.modifiertype
    method get_keycode : unit -> int
    method get_keyval : unit -> int
    method get_layout : unit -> int
    method get_level : unit -> int
    method is_modifier : unit -> bool
    method matches : int -> Gdk_enums.modifiertype -> Gdk_enums.keymatch
    method as_key_event : Key_event.t
  end

