(** An event related to a key-based device.

    Its methods, signals and properties are on {!class-type-key_event_t}. The
    functions it is built on are in {!Ocgdk.Raw.Key_event}. *)

(** The methods, signals and properties of a [GdkKeyEvent]. *)
class type key_event_t = object
  inherit App_launch_context_cycle_de440b34.event_t

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

  method as_key_event : Raw.Key_event.t
end

class key_event : Raw.Key_event.t -> key_event_t
(** Wraps a layer 1 handle, {!Ocgdk.Raw.Key_event.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GdkKeyEvent], give one already wrapped. *)
