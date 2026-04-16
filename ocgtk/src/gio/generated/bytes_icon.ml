(* GENERATED CODE - DO NOT EDIT *)
(* BytesIcon: BytesIcon *)

type t = [`bytes_icon | `object_] Gobject.obj

(** Create a new BytesIcon *)
external new_ : Glib_bytes.t -> t = "ml_g_bytes_icon_new"

(* Methods *)
(** Gets the #GBytes associated with the given @icon. *)
external get_bytes : t -> Glib_bytes.t = "ml_g_bytes_icon_get_bytes"

(* Properties *)

