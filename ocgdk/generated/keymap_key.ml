class type keymap_key_t = object
  method as_keymap_key : Keymap_key.t
end

(* High-level class for KeymapKey *)
class keymap_key (obj : Keymap_key.t) : keymap_key_t =
  object (self)
    method as_keymap_key = obj
  end
