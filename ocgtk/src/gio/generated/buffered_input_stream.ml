(* GENERATED CODE - DO NOT EDIT *)
(* BufferedInputStream: BufferedInputStream *)

type t = [`buffered_input_stream | `filter_input_stream | `input_stream | `object_] Gobject.obj

(** Create a new BufferedInputStream *)
external new_ : Input_stream.t -> t = "ml_g_buffered_input_stream_new"

(** Create a new BufferedInputStream *)
external new_sized : Input_stream.t -> unit -> t = "ml_g_buffered_input_stream_new_sized"

(* Methods *)
(** Tries to read a single byte from the stream or the buffer. Will block
during this read.

On success, the byte read from the stream is returned. On end of stream
-1 is returned but it's not an exceptional error and @error is not set.

If @cancellable is not %NULL, then the operation can be cancelled by
triggering the cancellable object from another thread. If the operation
was cancelled, the error %G_IO_ERROR_CANCELLED will be returned. If an
operation was partially finished when the operation was cancelled the
partial result will be returned, without an error.

On error -1 is returned and @error is set accordingly. *)
external read_byte : t -> Cancellable.t option -> (int, GError.t) result = "ml_g_buffered_input_stream_read_byte"

(* Properties *)

