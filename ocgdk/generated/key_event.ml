class type key_event_t = object
  inherit App_launch_context_cycle_de440b34.event_t
  method get_consumed_modifiers : unit -> Enums.modifiertype
  method get_keycode : unit -> int
  method get_keyval : unit -> int
  method get_layout : unit -> int
  method get_level : unit -> int
  method is_modifier : unit -> bool
  method matches : int -> Enums.modifiertype -> Enums.keymatch
  method as_key_event : Raw.Key_event.t
end

(* High-level class for KeyEvent *)
class key_event (obj : Raw.Key_event.t) : key_event_t =
  object (self)
    inherit App_launch_context_cycle_de440b34.event (obj :> Raw.Event.t)

    method get_consumed_modifiers : unit -> Enums.modifiertype =
      fun () -> Raw.Key_event.get_consumed_modifiers obj

    method get_keycode : unit -> int = fun () -> Raw.Key_event.get_keycode obj
    method get_keyval : unit -> int = fun () -> Raw.Key_event.get_keyval obj
    method get_layout : unit -> int = fun () -> Raw.Key_event.get_layout obj
    method get_level : unit -> int = fun () -> Raw.Key_event.get_level obj
    method is_modifier : unit -> bool = fun () -> Raw.Key_event.is_modifier obj

    method matches : int -> Enums.modifiertype -> Enums.keymatch =
      fun keyval modifiers -> Raw.Key_event.matches obj keyval modifiers

    method as_key_event = obj
  end
