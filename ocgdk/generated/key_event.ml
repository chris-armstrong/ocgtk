class type key_event_t = object
  inherit Event.event_t

  (** {2:methods Methods} *)

  method get_consumed_modifiers : unit -> Enums.modifiertype
  (** Extracts the consumed modifiers from a key event. *)

  method get_keycode : unit -> int
  (** Extracts the keycode from a key event. *)

  method get_keyval : unit -> int
  (** Extracts the keyval from a key event. *)

  method get_layout : unit -> int
  (** Extracts the layout from a key event. *)

  method get_level : unit -> int
  (** Extracts the shift level from a key event. *)

  method is_modifier : unit -> bool
  (** Extracts whether the key event is for a modifier key. *)

  method matches : int -> Enums.modifiertype -> Enums.keymatch
  (** Matches a key event against a keyval and modifiers.

      This is typically used to trigger keyboard shortcuts such as Ctrl-C.

      Partial matches are possible where the combination matches if the
      currently active group is ignored.

      Note that we ignore Caps Lock for matching. *)

  (** {2:conversions Conversions} *)

  method as_key_event : Raw.Key_event.t
end

(* High-level class for KeyEvent *)
class key_event (obj : Raw.Key_event.t) : key_event_t =
  object (self)
    inherit Event.event (obj :> Raw.Event.t)

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
