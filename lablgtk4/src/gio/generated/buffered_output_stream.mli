(* GENERATED CODE - DO NOT EDIT *)
(* BufferedOutputStream: BufferedOutputStream *)

type t = [`buffered_output_stream | `filter_output_stream | `output_stream | `object_] Gobject.obj

(** Create a new BufferedOutputStream *)
external new_ : Output_stream.t -> t = "ml_g_buffered_output_stream_new"

(** Create a new BufferedOutputStream *)
external new_sized : Output_stream.t -> unit -> t = "ml_g_buffered_output_stream_new_sized"

(* Methods *)
(** Sets whether or not the @stream's buffer should automatically grow.
If @auto_grow is true, then each write will just make the buffer
larger, and you must manually flush the buffer to actually write out
the data to the underlying stream. *)
external set_auto_grow : t -> bool -> unit = "ml_g_buffered_output_stream_set_auto_grow"

(** Checks if the buffer automatically grows as data is added. *)
external get_auto_grow : t -> bool = "ml_g_buffered_output_stream_get_auto_grow"

(* Properties *)

