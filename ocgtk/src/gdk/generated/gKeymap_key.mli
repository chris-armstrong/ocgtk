class type keymap_key_t = object
  method as_keymap_key : Keymap_key.t
end

class keymap_key : Keymap_key.t -> keymap_key_t
