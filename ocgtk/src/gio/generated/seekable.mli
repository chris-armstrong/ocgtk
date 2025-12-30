(* GENERATED CODE - DO NOT EDIT *)
(* Seekable: Seekable *)

type t = [`seekable] Gobject.obj

(* Methods *)
(** Tests if the length of the stream can be adjusted with
g_seekable_truncate(). *)
external can_truncate : t -> bool = "ml_g_seekable_can_truncate"

(** Tests if the stream supports the #GSeekableIface. *)
external can_seek : t -> bool = "ml_g_seekable_can_seek"

