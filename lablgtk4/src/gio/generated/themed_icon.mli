(* GENERATED CODE - DO NOT EDIT *)
(* ThemedIcon: ThemedIcon *)

type t = [`themed_icon | `object_] Gobject.obj

(** Create a new ThemedIcon *)
external new_ : string -> t = "ml_g_themed_icon_new"

(** Create a new ThemedIcon *)
external new_from_names : unit -> int -> t = "ml_g_themed_icon_new_from_names"

(** Create a new ThemedIcon *)
external new_with_default_fallbacks : string -> t = "ml_g_themed_icon_new_with_default_fallbacks"

(* Methods *)
(** Prepend a name to the list of icons from within @icon.

Note that doing so invalidates the hash computed by prior calls
to g_icon_hash(). *)
external prepend_name : t -> string -> unit = "ml_g_themed_icon_prepend_name"

(** Append a name to the list of icons from within @icon.

Note that doing so invalidates the hash computed by prior calls
to g_icon_hash(). *)
external append_name : t -> string -> unit = "ml_g_themed_icon_append_name"

(* Properties *)

(** Get property: name *)
external get_name : t -> string = "ml_gtk_themed_icon_get_name"

(** Get property: use-default-fallbacks *)
external get_use_default_fallbacks : t -> bool = "ml_gtk_themed_icon_get_use_default_fallbacks"

