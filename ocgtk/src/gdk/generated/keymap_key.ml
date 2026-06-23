(* GENERATED CODE - DO NOT EDIT *)
(* KeymapKey: KeymapKey *)

type t = [ `keymap_key ] Gobject.obj
(** A `GdkKeymapKey` is a hardware key that can be mapped to a keyval. *)

(* Methods *)

(* Record field accessors *)

(* Getters *)
external get_keycode : t -> int = "ml_gdk_keymap_key_get_keycode"
external get_group : t -> int = "ml_gdk_keymap_key_get_group"
external get_level : t -> int = "ml_gdk_keymap_key_get_level"

(* Setters *)
external set_keycode : t -> int -> unit = "ml_gdk_keymap_key_set_keycode"
external set_group : t -> int -> unit = "ml_gdk_keymap_key_set_group"
external set_level : t -> int -> unit = "ml_gdk_keymap_key_set_level"
external make : int -> int -> int -> t = "ml_gdk_keymap_key_make"
