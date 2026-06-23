class type keymap_key_t = object
  method get_keycode : int
  method set_keycode : int -> unit
  method get_group : int
  method set_group : int -> unit
  method get_level : int
  method set_level : int -> unit
  method as_keymap_key : Keymap_key.t
end

class keymap_key : Keymap_key.t -> keymap_key_t

val make : int -> int -> int -> keymap_key_t
