(* GENERATED CODE - DO NOT EDIT *)
(* BufferedInputStream: BufferedInputStream *)

type t = [`buffered_input_stream | `filter_input_stream | `input_stream | `object_] Gobject.obj

(** Create a new BufferedInputStream *)
external new_ : Input_stream.t -> t = "ml_g_buffered_input_stream_new"

(** Create a new BufferedInputStream *)
external new_sized : Input_stream.t -> int -> t = "ml_g_buffered_input_stream_new_sized"

(* Methods *)
(** Sets the size of the internal buffer of @stream to @size, or to the
size of the contents of the buffer. The buffer can never be resized
smaller than its current contents. *)
external set_buffer_size : t -> int -> unit = "ml_g_buffered_input_stream_set_buffer_size"

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

(** Gets the size of the input buffer. *)
external get_buffer_size : t -> int = "ml_g_buffered_input_stream_get_buffer_size"

(** Gets the size of the available data within the stream. *)
external get_available : t -> int = "ml_g_buffered_input_stream_get_available"

(** Finishes an asynchronous read. *)
external fill_finish : t -> Async_result.t -> (int, GError.t) result = "ml_g_buffered_input_stream_fill_finish"

(** Tries to read @count bytes from the stream into the buffer.
Will block during this read.

If @count is zero, returns zero and does nothing. A value of @count
larger than %G_MAXSSIZE will cause a %G_IO_ERROR_INVALID_ARGUMENT error.

On success, the number of bytes read into the buffer is returned.
It is not an error if this is not the same as the requested size, as it
can happen e.g. near the end of a file. Zero is returned on end of file
(or if @count is zero),  but never otherwise.

If @count is -1 then the attempted read size is equal to the number of
bytes that are required to fill the buffer.

If @cancellable is not %NULL, then the operation can be cancelled by
triggering the cancellable object from another thread. If the operation
was cancelled, the error %G_IO_ERROR_CANCELLED will be returned. If an
operation was partially finished when the operation was cancelled the
partial result will be returned, without an error.

On error -1 is returned and @error is set accordingly.

For the asynchronous, non-blocking, version of this function, see
g_buffered_input_stream_fill_async(). *)
external fill : t -> int -> Cancellable.t option -> (int, GError.t) result = "ml_g_buffered_input_stream_fill"

(* Properties *)

