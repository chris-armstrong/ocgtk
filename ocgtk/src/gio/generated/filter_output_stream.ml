(* GENERATED CODE - DO NOT EDIT *)
(* FilterOutputStream: FilterOutputStream *)

(** Base class for output stream implementations that perform some kind of
    filtering operation on a base stream. Typical examples of filtering
    operations are character set conversion, compression and byte order
    flipping. *)

type t = [ `filter_output_stream | `output_stream | `object_ ] Gobject.obj

(* Methods *)

external set_close_base_stream : t -> bool -> unit
  = "ml_g_filter_output_stream_set_close_base_stream"
(** Sets whether the base stream will be closed when [stream] is closed. *)

external get_close_base_stream : t -> bool
  = "ml_g_filter_output_stream_get_close_base_stream"
(** Returns whether the base stream will be closed when [stream] is closed. *)

external get_base_stream : t -> Output_stream.t
  = "ml_g_filter_output_stream_get_base_stream"
(** Gets the base stream for the filter stream. *)

(* Properties *)
