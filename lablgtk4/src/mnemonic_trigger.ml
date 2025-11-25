(* GENERATED CODE - DO NOT EDIT *)
(* Widget: MnemonicTrigger *)

type t = Gtk.widget

(** Create a new MnemonicTrigger *)
external new_ : int -> t = "ml_gtk_mnemonic_trigger_new"

(* Properties *)

(** Gets the keyval that must be pressed to succeed triggering @self. *)
external get_keyval : t -> int = "ml_gtk_mnemonic_trigger_get_keyval"

