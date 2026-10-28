(* GENERATED CODE - DO NOT EDIT *)
(* BytesIcon: BytesIcon *)

(** [GBytesIcon] specifies an image held in memory in a common format (usually
    PNG) to be used as icon.

    The class built on this module is in {!Ocgio.Bytes_icon}. *)

type t = [ `bytes_icon | `object_ ] Gobject.obj

external gtype : unit -> Gobject.Type.t = "ml_gio_bytes_icon_get_type"

external new_ : Glib_bytes.t -> t = "ml_g_bytes_icon_new"
(** Creates a new icon for a bytes.

    This cannot fail, but loading and interpreting the bytes may fail later on
    (for example, if g_loadable_icon_load() is called) if the image is invalid.
*)

(* Methods *)

external get_bytes : t -> Glib_bytes.t = "ml_g_bytes_icon_get_bytes"
(** Gets the [GBytes] associated with the given [icon]. *)

(* Properties *)
