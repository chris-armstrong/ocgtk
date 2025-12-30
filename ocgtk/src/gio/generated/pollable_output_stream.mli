(* GENERATED CODE - DO NOT EDIT *)
(* PollableOutputStream: PollableOutputStream *)

type t = [`pollable_output_stream] Gobject.obj

(* Methods *)
(** Checks if @stream can be written.

Note that some stream types may not be able to implement this 100%
reliably, and it is possible that a call to g_output_stream_write()
after this returns %TRUE would still block. To guarantee
non-blocking behavior, you should always use
g_pollable_output_stream_write_nonblocking(), which will return a
%G_IO_ERROR_WOULD_BLOCK error rather than blocking.

The behaviour of this method is undefined if
g_pollable_output_stream_can_poll() returns %FALSE for @stream. *)
external is_writable : t -> bool = "ml_g_pollable_output_stream_is_writable"

(** Checks if @stream is actually pollable. Some classes may implement
#GPollableOutputStream but have only certain instances of that
class be pollable. If this method returns %FALSE, then the behavior
of other #GPollableOutputStream methods is undefined.

For any given stream, the value returned by this method is constant;
a stream cannot switch from pollable to non-pollable or vice versa. *)
external can_poll : t -> bool = "ml_g_pollable_output_stream_can_poll"

