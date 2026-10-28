(** Triggers when a specific mnemonic is pressed.

    Its methods, signals and properties are on {!class-type-mnemonic_trigger_t}.
    Its full description is under {!section-description}. Its constructors are
    under {!section-constructors}. The functions it is built on are in
    {!Ocgtk.Raw.Mnemonic_trigger}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [MnemonicTrigger].}

    Triggers when a specific mnemonic is pressed.

    Mnemonics require a {i mnemonic modifier} (typically <kbd>Alt</kbd>) to be
    pressed together with the mnemonic key. *)
class type mnemonic_trigger_t = object
  inherit Shortcut_trigger.shortcut_trigger_t

  (** {2:methods Methods} *)

  method get_keyval : unit -> int
  (** Gets the keyval that must be pressed to succeed triggering [self]. *)

  (** {2:conversions Conversions} *)

  method as_mnemonic_trigger : Raw.Mnemonic_trigger.t
end

class mnemonic_trigger : Raw.Mnemonic_trigger.t -> mnemonic_trigger_t
(** Wraps a raw handle of {!Ocgtk.Raw.Mnemonic_trigger.t}. *)

(** {1:description Description}

    Triggers when a specific mnemonic is pressed.

    Mnemonics require a {i mnemonic modifier} (typically <kbd>Alt</kbd>) to be
    pressed together with the mnemonic key. *)

(** {1:constructors Constructors} *)

val new_ : int -> mnemonic_trigger_t
(** Creates a [GtkShortcutTrigger] that will trigger whenever the key with the
    given [keyval] is pressed and mnemonics have been activated.

    Mnemonics are activated by calling code when a key event with the right
    modifiers is detected. *)
