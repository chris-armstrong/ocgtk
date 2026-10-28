(** Triggers when a specific mnemonic is pressed.

    Mnemonics require a {i mnemonic modifier} (typically <kbd>Alt</kbd>) to be
    pressed together with the mnemonic key.

    Its methods, signals and properties are on {!class-type-mnemonic_trigger_t}.
    Its constructors are under {!section-constructors}. The functions it is
    built on are in {!Ocgtk.Raw.Mnemonic_trigger}. *)

(** {b The methods, signals and properties of a [MnemonicTrigger].}

    Triggers when a specific mnemonic is pressed.

    Mnemonics require a {i mnemonic modifier} (typically <kbd>Alt</kbd>) to be
    pressed together with the mnemonic key. *)
class type mnemonic_trigger_t = object
  inherit Shortcut_trigger.shortcut_trigger_t

  method get_keyval : unit -> int
  (** Gets the keyval that must be pressed to succeed triggering [self]. *)

  method as_mnemonic_trigger : Raw.Mnemonic_trigger.t
end

class mnemonic_trigger : Raw.Mnemonic_trigger.t -> mnemonic_trigger_t
(** Wraps a raw handle of {!Ocgtk.Raw.Mnemonic_trigger.t}. *)

(** {2:constructors Constructors} *)

val new_ : int -> mnemonic_trigger_t
(** Creates a [GtkShortcutTrigger] that will trigger whenever the key with the
    given [keyval] is pressed and mnemonics have been activated.

    Mnemonics are activated by calling code when a key event with the right
    modifiers is detected. *)
