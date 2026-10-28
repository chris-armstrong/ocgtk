(** An event related to a key-based device.

    Its methods, signals and properties are on {!class-type-key_event_t}. Its
    constructors are under {!section-constructors}. The functions it is built on
    are in {!Ocgdk.Raw.Key_event}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [KeyEvent].}

    Inherits from: {{!Ocgdk.Event.class-type-event_t}Ocgdk.Event}

    An event related to a key-based device. *)
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

class key_event : Raw.Key_event.t -> key_event_t
(** Wraps a raw handle of {!Ocgdk.Raw.Key_event.t}. *)

(** {1:constructors Constructors} *)

(** This class is not instantiated directly - it is used as a return value by
    methods on other classes. *)
