(* GENERATED CODE - DO NOT EDIT *)
(* ConverterInputStream: ConverterInputStream *)

(** Converter input stream implements
    {{!Ocgio.Raw.Input_stream}[Gio.InputStream]} and allows conversion of data
    of various types during reading.

    As of GLib 2.34, [GConverterInputStream] implements
    {{!Ocgio.Raw.Pollable_input_stream}[Gio.PollableInputStream]}.

    The class built on this module is in {!Ocgio.Converter_input_stream}. *)

type t =
  [ `converter_input_stream | `filter_input_stream | `input_stream | `object_ ]
  Gobject.obj

external gtype : unit -> Gobject.Type.t
  = "ml_gio_converter_input_stream_get_type"

external new_ : Input_stream.t -> Converter.t -> t
  = "ml_g_converter_input_stream_new"
(** Creates a new converter input stream for the [base_stream]. *)

(* Methods *)

external get_converter : t -> Converter.t
  = "ml_g_converter_input_stream_get_converter"
(** Gets the [GConverter] that is used by [converter_stream]. *)

(* Properties *)
