(** Triggers when a specific mnemonic is pressed.

    Mnemonics require a {i mnemonic modifier} (typically <kbd>Alt</kbd>) to be
    pressed together with the mnemonic key.

    Its methods, signals and properties are on {!class-type-mnemonic_trigger_t}.
    The functions it is built on are in {!Ocgtk.Raw.Mnemonic_trigger}. *)

(** The methods, signals and properties of a [GtkMnemonicTrigger]. *)
class type mnemonic_trigger_t = object
  inherit Shortcut_trigger.shortcut_trigger_t

  method get_keyval : unit -> int
  (** Gets the keyval that must be pressed to succeed triggering [self]. *)

  method as_mnemonic_trigger : Raw.Mnemonic_trigger.t
end

class mnemonic_trigger : Raw.Mnemonic_trigger.t -> mnemonic_trigger_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Mnemonic_trigger.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [GtkMnemonicTrigger], give one already wrapped. *)

val new_ : int -> mnemonic_trigger_t
