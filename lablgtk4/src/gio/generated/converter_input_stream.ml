(* GENERATED CODE - DO NOT EDIT *)
(* ConverterInputStream: ConverterInputStream *)

type t = [`converter_input_stream | `filter_input_stream | `input_stream | `object_] Gobject.obj

(** Create a new ConverterInputStream *)
external new_ : Input_stream.t -> Converter.t -> t = "ml_g_converter_input_stream_new"

(* Methods *)
(** Gets the #GConverter that is used by @converter_stream. *)
external get_converter : t -> Converter.t = "ml_g_converter_input_stream_get_converter"

(* Properties *)

