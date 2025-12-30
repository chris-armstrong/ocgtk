(* GENERATED CODE - DO NOT EDIT *)
(* PollableInputStreamInterface: PollableInputStreamInterface *)

(** The interface for pollable input streams.

The default implementation of @can_poll always returns %TRUE.

The default implementation of @read_nonblocking calls
g_pollable_input_stream_is_readable(), and then calls
g_input_stream_read() if it returns %TRUE. This means you only need
to override it if it is possible that your @is_readable
implementation may return %TRUE when the stream is not actually
readable. *)
type t = [`pollable_input_stream_interface] Gobject.obj

(* Methods *)
