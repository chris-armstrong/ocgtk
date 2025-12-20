(* GENERATED CODE - DO NOT EDIT *)
(* FilterOutputStream: FilterOutputStream *)

type t = [`filter_output_stream | `output_stream | `object_] Gobject.obj

(* Methods *)
(** Sets whether the base stream will be closed when @stream is closed. *)
external set_close_base_stream : t -> bool -> unit = "ml_g_filter_output_stream_set_close_base_stream"

(** Returns whether the base stream will be closed when @stream is
closed. *)
external get_close_base_stream : t -> bool = "ml_g_filter_output_stream_get_close_base_stream"

(** Gets the base stream for the filter stream. *)
external get_base_stream : t -> Output_stream.t = "ml_g_filter_output_stream_get_base_stream"

(* Properties *)

