(* GENERATED CODE - DO NOT EDIT *)
(* MnemonicTrigger: MnemonicTrigger *)

type t = [ `mnemonic_trigger | `shortcut_trigger | `object_ ] Gobject.obj
(** Triggers when a specific mnemonic is pressed.

    Mnemonics require a {i mnemonic modifier} (typically <kbd>Alt</kbd>) to be
    pressed together with the mnemonic key. *)

external new_ : int -> t = "ml_gtk_mnemonic_trigger_new"
(** Create a new MnemonicTrigger *)

(* Methods *)

external get_keyval : t -> int = "ml_gtk_mnemonic_trigger_get_keyval"
(** Gets the keyval that must be pressed to succeed triggering [self]. *)

(* Properties *)
