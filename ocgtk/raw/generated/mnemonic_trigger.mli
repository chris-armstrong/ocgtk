(* GENERATED CODE - DO NOT EDIT *)
(* MnemonicTrigger: MnemonicTrigger *)

(** Triggers when a specific mnemonic is pressed.

    Mnemonics require a {i mnemonic modifier} (typically <kbd>Alt</kbd>) to be
    pressed together with the mnemonic key.

    The class built on this module is in {!Ocgtk.Mnemonic_trigger}. *)

type t = [ `mnemonic_trigger | `shortcut_trigger | `object_ ] Gobject.obj

external gtype : unit -> Gobject.Type.t = "ml_gtk_mnemonic_trigger_get_type"

external new_ : int -> t = "ml_gtk_mnemonic_trigger_new"
(** Creates a [GtkShortcutTrigger] that will trigger whenever the key with the
    given [keyval] is pressed and mnemonics have been activated.

    Mnemonics are activated by calling code when a key event with the right
    modifiers is detected. *)

(* Methods *)

external get_keyval : t -> int = "ml_gtk_mnemonic_trigger_get_keyval"
(** Gets the keyval that must be pressed to succeed triggering [self]. *)

(* Properties *)
