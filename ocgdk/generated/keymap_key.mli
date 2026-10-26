class type keymap_key_t = object
  method as_keymap_key : Raw.Keymap_key.t
end

class keymap_key : Raw.Keymap_key.t -> keymap_key_t
