(** Struct defining a pad action entry.

    Its methods, signals and properties are on {!class-type-pad_action_entry_t}.
    The functions it is built on are in {!Ocgtk.Raw.Pad_action_entry}. *)

(** The methods, signals and properties of a [PadActionEntry]. *)
class type pad_action_entry_t = object
  method as_pad_action_entry : Raw.Pad_action_entry.t
end

class pad_action_entry : Raw.Pad_action_entry.t -> pad_action_entry_t
(** Wraps a raw handle of {!Ocgtk.Raw.Pad_action_entry.t}. *)
