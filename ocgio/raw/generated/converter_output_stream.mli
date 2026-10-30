(* GENERATED CODE - DO NOT EDIT *)
(* ConverterOutputStream: ConverterOutputStream *)

(** Converter output stream implements
    {{!Ocgio.Raw.Output_stream}[Gio.OutputStream]} and allows conversion of data
    of various types during reading.

    As of GLib 2.34, [GConverterOutputStream] implements
    {{!Ocgio.Raw.Pollable_output_stream}[Gio.PollableOutputStream]}.

    The class built on this module is in {!Ocgio.Converter_output_stream}. *)

type t =
  [ `converter_output_stream
  | `filter_output_stream
  | `output_stream
  | `object_ ]
  Gobject.obj

external gtype : unit -> Gobject.Type.t
  = "ml_gio_converter_output_stream_get_type"

external new_ : Output_stream.t -> Converter.t -> t
  = "ml_g_converter_output_stream_new"
(** Creates a new converter output stream for the [base_stream]. *)

(* Methods *)

external get_converter : t -> Converter.t
  = "ml_g_converter_output_stream_get_converter"
(** Gets the {{!Ocgio.Raw.Converter}[GConverter]} that is used by
    [converter_stream]. *)

(* Properties *)
