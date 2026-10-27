(** Struct defining a pad action entry.

    Its methods, signals and properties are on {!class-type-pad_action_entry_t}.
    The functions it is built on are in {!Ocgtk.Raw.Pad_action_entry}. *)

(** The methods, signals and properties of a [GtkPadActionEntry]. *)
class type pad_action_entry_t = object
  method as_pad_action_entry : Raw.Pad_action_entry.t
end

class pad_action_entry : Raw.Pad_action_entry.t -> pad_action_entry_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Pad_action_entry.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [GtkPadActionEntry], give one already wrapped. *)
