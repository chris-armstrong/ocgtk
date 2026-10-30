(* GENERATED CODE - DO NOT EDIT *)
(* BufferedOutputStream: BufferedOutputStream *)

(** Buffered output stream implements
    {{!Ocgio.Raw.Filter_output_stream}[Gio.FilterOutputStream]} and provides for
    buffered writes.

    By default, [GBufferedOutputStream]'s buffer size is set at 4 kilobytes.

    To create a buffered output stream, use
    {{!Ocgio.Raw.Buffered_output_stream.val-new_}[Gio.BufferedOutputStream.new]},
    or
    {{!Ocgio.Raw.Buffered_output_stream.val-new_sized}[Gio.BufferedOutputStream.new_sized]}
    to specify the buffer's size at construction.

    To get the size of a buffer within a buffered input stream, use
    {{!Ocgio.Raw.Buffered_output_stream.val-get_buffer_size}[Gio.BufferedOutputStream.get_buffer_size]}.
    To change the size of a buffered output stream's buffer, use
    {{!Ocgio.Raw.Buffered_output_stream.val-set_buffer_size}[Gio.BufferedOutputStream.set_buffer_size]}.
    Note that the buffer's size cannot be reduced below the size of the data
    within the buffer.

    The class built on this module is in {!Ocgio.Buffered_output_stream}. *)

type t =
  [ `buffered_output_stream | `filter_output_stream | `output_stream | `object_ ]
  Gobject.obj

external gtype : unit -> Gobject.Type.t
  = "ml_gio_buffered_output_stream_get_type"

external new_ : Output_stream.t -> t = "ml_g_buffered_output_stream_new"
(** Creates a new buffered output stream for a base stream. *)

external new_sized : Output_stream.t -> Gsize.t -> t
  = "ml_g_buffered_output_stream_new_sized"
(** Creates a new buffered output stream with a given buffer size. *)

(* Methods *)

external set_buffer_size : t -> Gsize.t -> unit
  = "ml_g_buffered_output_stream_set_buffer_size"
(** Sets the size of the internal buffer to [size]. *)

external set_auto_grow : t -> bool -> unit
  = "ml_g_buffered_output_stream_set_auto_grow"
(** Sets whether or not the [stream]'s buffer should automatically grow. If
    [auto_grow] is true, then each write will just make the buffer larger, and
    you must manually flush the buffer to actually write out the data to the
    underlying stream. *)

external get_buffer_size : t -> Gsize.t
  = "ml_g_buffered_output_stream_get_buffer_size"
(** Gets the size of the buffer in the [stream]. *)

external get_auto_grow : t -> bool = "ml_g_buffered_output_stream_get_auto_grow"
(** Checks if the buffer automatically grows as data is added. *)

(* Properties *)
