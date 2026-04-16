(* GENERATED CODE - DO NOT EDIT *)
(* UnixOutputStream: UnixOutputStream *)

type t = [ `unix_output_stream | `output_stream | `object_ ] Gobject.obj

external new_ : int -> bool -> t = "ml_g_unix_output_stream_new"
(** Create a new UnixOutputStream *)

(* Methods *)

external set_close_fd : t -> bool -> unit
  = "ml_g_unix_output_stream_set_close_fd"
(** Sets whether the file descriptor of @stream shall be closed
when the stream is closed. *)

external get_fd : t -> int = "ml_g_unix_output_stream_get_fd"
(** Return the UNIX file descriptor that the stream writes to. *)

external get_close_fd : t -> bool = "ml_g_unix_output_stream_get_close_fd"
(** Returns whether the file descriptor of @stream will be
closed when the stream is closed. *)

(* Properties *)
