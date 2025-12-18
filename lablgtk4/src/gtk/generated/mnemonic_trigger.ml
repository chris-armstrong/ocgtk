(* GENERATED CODE - DO NOT EDIT *)
(* MnemonicTrigger: MnemonicTrigger *)

type t = [`mnemonic_trigger | `shortcut_trigger | `object_] Gobject.obj

(** Create a new MnemonicTrigger *)
external new_ : int -> t = "ml_gtk_mnemonic_trigger_new"

(* Properties *)

(** Get property: keyval *)
external get_keyval : t -> int = "ml_gtk_mnemonic_trigger_get_keyval"

