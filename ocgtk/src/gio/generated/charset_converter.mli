(* GENERATED CODE - DO NOT EDIT *)
(* CharsetConverter: CharsetConverter *)

type t = [`charset_converter | `object_] Gobject.obj

(* Methods *)
(** Sets the #GCharsetConverter:use-fallback property. *)
external set_use_fallback : t -> bool -> unit = "ml_g_charset_converter_set_use_fallback"

(** Gets the #GCharsetConverter:use-fallback property. *)
external get_use_fallback : t -> bool = "ml_g_charset_converter_get_use_fallback"

(** Gets the number of fallbacks that @converter has applied so far. *)
external get_num_fallbacks : t -> int = "ml_g_charset_converter_get_num_fallbacks"

(* Properties *)

(** Get property: from-charset *)
external get_from_charset : t -> string = "ml_g_charset_converter_get_from_charset"

(** Get property: to-charset *)
external get_to_charset : t -> string = "ml_g_charset_converter_get_to_charset"

