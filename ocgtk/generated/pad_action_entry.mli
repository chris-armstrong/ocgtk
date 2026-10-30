(** Struct defining a pad action entry.

    Its methods, signals and properties are on {!class-type-pad_action_entry_t}.
    Its constructors are under {!section-constructors}. The functions it is
    built on are in {!Ocgtk.Raw.Pad_action_entry}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [PadActionEntry].}

    Struct defining a pad action entry. *)
class type pad_action_entry_t = object
  (** {2:conversions Conversions} *)

  method as_pad_action_entry : Raw.Pad_action_entry.t
end

class pad_action_entry : Raw.Pad_action_entry.t -> pad_action_entry_t
(** Wraps a raw handle of {!Ocgtk.Raw.Pad_action_entry.t}. *)

(** {1:constructors Constructors} *)

(** This class is not instantiated directly - it is used as a return value by
    methods on other classes. *)
