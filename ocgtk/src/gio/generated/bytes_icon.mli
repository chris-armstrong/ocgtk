(* GENERATED CODE - DO NOT EDIT *)
(* BytesIcon: BytesIcon *)

type t = [ `bytes_icon | `object_ ] Gobject.obj
(** [GBytesIcon] specifies an image held in memory in a common format (usually
    PNG) to be used as icon. *)

external new_ : Glib_bytes.t -> t = "ml_g_bytes_icon_new"
(** Create a new BytesIcon *)

(* Methods *)

external get_bytes : t -> Glib_bytes.t = "ml_g_bytes_icon_get_bytes"
(** Gets the [GBytes] associated with the given [icon]. *)

(* Properties *)
