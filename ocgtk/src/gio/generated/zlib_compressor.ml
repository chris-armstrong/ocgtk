(* GENERATED CODE - DO NOT EDIT *)
(* ZlibCompressor: ZlibCompressor *)

type t = [ `zlib_compressor | `object_ ] Gobject.obj

external new_ : Gio_enums.zlibcompressorformat -> int -> t
  = "ml_g_zlib_compressor_new"
(** Create a new ZlibCompressor *)

(* Methods *)

external set_file_info : t -> File_info.t option -> unit
  = "ml_g_zlib_compressor_set_file_info"
(** Sets @file_info in @compressor. If non-%NULL, and @compressor's
#GZlibCompressor:format property is %G_ZLIB_COMPRESSOR_FORMAT_GZIP,
it will be used to set the file name and modification time in
the GZIP header of the compressed data.

Note: it is an error to call this function while a compression is in
progress; it may only be called immediately after creation of @compressor,
or after resetting it with g_converter_reset(). *)

external get_file_info : t -> File_info.t option
  = "ml_g_zlib_compressor_get_file_info"
(** Returns the #GZlibCompressor:file-info property. *)

(* Properties *)

external get_format : t -> Gio_enums.zlibcompressorformat
  = "ml_g_zlib_compressor_get_format"
(** Get property: format *)

external get_level : t -> int = "ml_g_zlib_compressor_get_level"
(** Get property: level *)
