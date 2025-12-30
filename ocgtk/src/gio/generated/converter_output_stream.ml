(* GENERATED CODE - DO NOT EDIT *)
(* ConverterOutputStream: ConverterOutputStream *)

type t = [`converter_output_stream | `filter_output_stream | `output_stream | `object_] Gobject.obj

(** Create a new ConverterOutputStream *)
external new_ : Output_stream.t -> Converter.t -> t = "ml_g_converter_output_stream_new"

(* Methods *)
(** Gets the #GConverter that is used by @converter_stream. *)
external get_converter : t -> Converter.t = "ml_g_converter_output_stream_get_converter"

(* Properties *)

