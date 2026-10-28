(** Activates a widget with a mnemonic.

    Its methods, signals and properties are on {!class-type-mnemonic_action_t}.
    Its full description is under {!section-description}. The functions it is
    built on are in {!Ocgtk.Raw.Mnemonic_action}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [MnemonicAction].}

    Activates a widget with a mnemonic.

    This means that [Gtk.Widget.mnemonic_activate] is called. *)
class type mnemonic_action_t = object
  inherit Shortcut_action.shortcut_action_t

  (** {2:conversions Conversions} *)

  method as_mnemonic_action : Raw.Mnemonic_action.t
end

class mnemonic_action : Raw.Mnemonic_action.t -> mnemonic_action_t
(** Wraps a raw handle of {!Ocgtk.Raw.Mnemonic_action.t}. *)

(** {1:description Description}

    Activates a widget with a mnemonic.

    This means that [Gtk.Widget.mnemonic_activate] is called. *)
