(* GENERATED CODE - DO NOT EDIT *)
(* PollableOutputStreamInterface: PollableOutputStreamInterface *)

(** The interface for pollable output streams.

The default implementation of @can_poll always returns %TRUE.

The default implementation of @write_nonblocking calls
g_pollable_output_stream_is_writable(), and then calls
g_output_stream_write() if it returns %TRUE. This means you only
need to override it if it is possible that your @is_writable
implementation may return %TRUE when the stream is not actually
writable.

The default implementation of @writev_nonblocking calls
g_pollable_output_stream_write_nonblocking() for each vector, and converts
its return value and error (if set) to a #GPollableReturn. You should
override this where possible to avoid having to allocate a #GError to return
%G_IO_ERROR_WOULD_BLOCK. *)
type t = [`pollable_output_stream_interface] Gobject.obj

(* Methods *)
