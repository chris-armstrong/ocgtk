(* GENERATED CODE - DO NOT EDIT *)
(* ZlibCompressor: ZlibCompressor *)

type t = [`zlib_compressor | `object_] Gobject.obj

(** Create a new ZlibCompressor *)
external new_ : Gio_enums.zlibcompressorformat -> int -> t = "ml_g_zlib_compressor_new"

(* Methods *)
(** Sets @file_info in @compressor. If non-%NULL, and @compressor's
#GZlibCompressor:format property is %G_ZLIB_COMPRESSOR_FORMAT_GZIP,
it will be used to set the file name and modification time in
the GZIP header of the compressed data.

Note: it is an error to call this function while a compression is in
progress; it may only be called immediately after creation of @compressor,
or after resetting it with g_converter_reset(). *)
external set_file_info : t -> File_info.t option -> unit = "ml_g_zlib_compressor_set_file_info"

(** Returns the #GZlibCompressor:file-info property. *)
external get_file_info : t -> File_info.t option = "ml_g_zlib_compressor_get_file_info"

(* Properties *)

(** Get property: format *)
external get_format : t -> Gio_enums.zlibcompressorformat = "ml_g_zlib_compressor_get_format"

(** Get property: level *)
external get_level : t -> int = "ml_g_zlib_compressor_get_level"

