(** Represents a hardware key that can be mapped to a keyval.

    Its methods, signals and properties are on {!class-type-keymap_key_t}. The
    functions it is built on are in {!Ocgdk.Raw.Keymap_key}. *)

(** The methods, signals and properties of a [GdkKeymapKey]. *)
class type keymap_key_t = object
  method as_keymap_key : Raw.Keymap_key.t
end

class keymap_key : Raw.Keymap_key.t -> keymap_key_t
(** Wraps a layer 1 handle, {!Ocgdk.Raw.Keymap_key.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GdkKeymapKey], give one already wrapped. *)
