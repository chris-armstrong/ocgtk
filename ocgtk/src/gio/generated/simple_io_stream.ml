(* GENERATED CODE - DO NOT EDIT *)
(* SimpleIOStream: SimpleIOStream *)

type t = [ `simple_io_stream | `io_stream | `object_ ] Gobject.obj
(** [GSimpleIOStream] creates a [Gio.IOStream] from an arbitrary
    [Gio.InputStream] and [Gio.OutputStream]. This allows any pair of input and
    output streams to be used with [Gio.IOStream] methods.

    This is useful when you obtained a [Gio.InputStream] and a
    [Gio.OutputStream] by other means, for instance creating them with platform
    specific methods as [g_unix_input_stream_new()] (from [gio-unix-2.0.pc] /
    [GioUnix-2.0]), and you want to take advantage of the methods provided by
    [Gio.IOStream]. *)

external new_ : Input_stream.t -> Output_stream.t -> t
  = "ml_g_simple_io_stream_new"
(** Create a new SimpleIOStream *)

(* Methods *)
(* Properties *)

external get_input_stream : t -> Input_stream.t
  = "ml_g_simple_io_stream_get_input_stream"
(** Get property: input-stream *)

external get_output_stream : t -> Output_stream.t
  = "ml_g_simple_io_stream_get_output_stream"
(** Get property: output-stream *)
