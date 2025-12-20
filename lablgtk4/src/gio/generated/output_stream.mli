(* GENERATED CODE - DO NOT EDIT *)
(* OutputStream: OutputStream *)

type t = [`output_stream | `object_] Gobject.obj

(* Methods *)
(** Sets @stream to have actions pending. If the pending flag is
already set or @stream is closed, it will return %FALSE and set
@error. *)
external set_pending : t -> (bool, GError.t) result = "ml_g_output_stream_set_pending"

(** Checks if an output stream is being closed. This can be
used inside e.g. a flush implementation to see if the
flush (or other i/o operation) is called from within
the closing operation. *)
external is_closing : t -> bool = "ml_g_output_stream_is_closing"

(** Checks if an output stream has already been closed. *)
external is_closed : t -> bool = "ml_g_output_stream_is_closed"

(** Checks if an output stream has pending actions. *)
external has_pending : t -> bool = "ml_g_output_stream_has_pending"

(** Forces a write of all user-space buffered data for the given
@stream. Will block during the operation. Closing the stream will
implicitly cause a flush.

This function is optional for inherited classes.

If @cancellable is not %NULL, then the operation can be cancelled by
triggering the cancellable object from another thread. If the operation
was cancelled, the error %G_IO_ERROR_CANCELLED will be returned. *)
external flush : t -> Cancellable.t option -> (bool, GError.t) result = "ml_g_output_stream_flush"

(** Closes the stream, releasing resources related to it.

Once the stream is closed, all other operations will return %G_IO_ERROR_CLOSED.
Closing a stream multiple times will not return an error.

Closing a stream will automatically flush any outstanding buffers in the
stream.

Streams will be automatically closed when the last reference
is dropped, but you might want to call this function to make sure
resources are released as early as possible.

Some streams might keep the backing store of the stream (e.g. a file descriptor)
open after the stream is closed. See the documentation for the individual
stream for details.

On failure the first error that happened will be reported, but the close
operation will finish as much as possible. A stream that failed to
close will still return %G_IO_ERROR_CLOSED for all operations. Still, it
is important to check and report the error to the user, otherwise
there might be a loss of data as all data might not be written.

If @cancellable is not %NULL, then the operation can be cancelled by
triggering the cancellable object from another thread. If the operation
was cancelled, the error %G_IO_ERROR_CANCELLED will be returned.
Cancelling a close will still leave the stream closed, but there some streams
can use a faster close that doesn't block to e.g. check errors. On
cancellation (as with any error) there is no guarantee that all written
data will reach the target. *)
external close : t -> Cancellable.t option -> (bool, GError.t) result = "ml_g_output_stream_close"

(** Clears the pending flag on @stream. *)
external clear_pending : t -> unit = "ml_g_output_stream_clear_pending"

