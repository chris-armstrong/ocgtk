(* GENERATED CODE - DO NOT EDIT *)
(* MnemonicAction: MnemonicAction *)

(** Activates a widget with a mnemonic.

    This means that [Gtk.Widget.mnemonic_activate] is called.

    The class built on this module is in {!Ocgtk.Mnemonic_action}. *)

type t = [ `mnemonic_action | `shortcut_action | `object_ ] Gobject.obj

external gtype : unit -> Gobject.Type.t = "ml_gtk_mnemonic_action_get_type"

(* Methods *)
