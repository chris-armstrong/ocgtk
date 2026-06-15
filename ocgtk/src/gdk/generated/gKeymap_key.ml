class type keymap_key_t = object
  method get_keycode : int
  method set_keycode : int -> unit
  method get_group : int
  method set_group : int -> unit
  method get_level : int
  method set_level : int -> unit
  method as_keymap_key : Keymap_key.t
end

(* High-level class for KeymapKey *)
class keymap_key (obj : Keymap_key.t) : keymap_key_t =
  object (self)
    method get_keycode : int = Keymap_key.get_keycode obj
    method set_keycode : int -> unit = fun v -> Keymap_key.set_keycode obj v
    method get_group : int = Keymap_key.get_group obj
    method set_group : int -> unit = fun v -> Keymap_key.set_group obj v
    method get_level : int = Keymap_key.get_level obj
    method set_level : int -> unit = fun v -> Keymap_key.set_level obj v
    method as_keymap_key = obj
  end

let make (keycode : int) (group : int) (level : int) : keymap_key_t =
  new keymap_key (Keymap_key.make keycode group level)
