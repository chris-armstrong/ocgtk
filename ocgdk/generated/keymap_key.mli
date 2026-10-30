(** Represents a hardware key that can be mapped to a keyval.

    Its methods, signals and properties are on {!class-type-keymap_key_t}. Its
    constructors are under {!section-constructors}. The functions it is built on
    are in {!Ocgdk.Raw.Keymap_key}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [KeymapKey].}

    Represents a hardware key that can be mapped to a keyval. *)
class type keymap_key_t = object
  (** {2:conversions Conversions} *)

  method as_keymap_key : Raw.Keymap_key.t
end

class keymap_key : Raw.Keymap_key.t -> keymap_key_t
(** Wraps a raw handle of {!Ocgdk.Raw.Keymap_key.t}. *)

(** {1:constructors Constructors} *)

(** This class is not instantiated directly - it is used as a return value by
    methods on other classes. *)
