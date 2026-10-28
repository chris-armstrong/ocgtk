(** Activates a widget with a mnemonic.

    This means that [Gtk.Widget.mnemonic_activate] is called.

    Its methods, signals and properties are on {!class-type-mnemonic_action_t}.
    The functions it is built on are in {!Ocgtk.Raw.Mnemonic_action}. *)

(** The methods, signals and properties of a [MnemonicAction]. *)
class type mnemonic_action_t = object
  inherit Shortcut_action.shortcut_action_t
  method as_mnemonic_action : Raw.Mnemonic_action.t
end

class mnemonic_action : Raw.Mnemonic_action.t -> mnemonic_action_t
(** Wraps a raw handle of {!Ocgtk.Raw.Mnemonic_action.t}. *)
