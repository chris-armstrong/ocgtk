(* GENERATED CODE - DO NOT EDIT *)
(* MemoryOutputStream: MemoryOutputStream *)

type t = [`memory_output_stream | `output_stream | `object_] Gobject.obj

(** Create a new MemoryOutputStream *)
external new_resizable : unit -> t = "ml_g_memory_output_stream_new_resizable"

(* Methods *)
(** Returns data from the @ostream as a #GBytes. @ostream must be
closed before calling this function. *)
external steal_as_bytes : t -> Glib_bytes.t = "ml_g_memory_output_stream_steal_as_bytes"

(** Gets the size of the currently allocated data area (available from
g_memory_output_stream_get_data()).

You probably don't want to use this function on resizable streams.
See g_memory_output_stream_get_data_size() instead.  For resizable
streams the size returned by this function is an implementation
detail and may be change at any time in response to operations on the
stream.

If the stream is fixed-sized (ie: no realloc was passed to
g_memory_output_stream_new()) then this is the maximum size of the
stream and further writes will return %G_IO_ERROR_NO_SPACE.

In any case, if you want the number of bytes currently written to the
stream, use g_memory_output_stream_get_data_size(). *)
external get_size : t -> int = "ml_g_memory_output_stream_get_size"

(** Returns the number of bytes from the start up to including the last
byte written in the stream that has not been truncated away. *)
external get_data_size : t -> int = "ml_g_memory_output_stream_get_data_size"

(* Properties *)

