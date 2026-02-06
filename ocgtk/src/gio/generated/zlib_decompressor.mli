(* GENERATED CODE - DO NOT EDIT *)
(* ZlibDecompressor: ZlibDecompressor *)

type t = [`zlib_decompressor | `object_] Gobject.obj

(** Create a new ZlibDecompressor *)
external new_ : Gio_enums.zlibcompressorformat -> t = "ml_g_zlib_decompressor_new"

(* Methods *)
(** Retrieves the #GFileInfo constructed from the GZIP header data
of compressed data processed by @compressor, or %NULL if @decompressor's
#GZlibDecompressor:format property is not %G_ZLIB_COMPRESSOR_FORMAT_GZIP,
or the header data was not fully processed yet, or it not present in the
data stream at all. *)
external get_file_info : t -> File_info.t option = "ml_g_zlib_decompressor_get_file_info"

(* Properties *)

(** Get property: format *)
external get_format : t -> Gio_enums.zlibcompressorformat = "ml_g_zlib_decompressor_get_format"

