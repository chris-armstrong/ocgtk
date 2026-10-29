(* GENERATED CODE - DO NOT EDIT *)
(* ZlibCompressor: ZlibCompressor *)

(** [GZlibCompressor] is an implementation of
    {{!Ocgio.Raw.Converter}[Gio.Converter]} that compresses data using zlib.

    The class built on this module is in {!Ocgio.Zlib_compressor}. *)

type t = [ `zlib_compressor | `object_ ] Gobject.obj

external gtype : unit -> Gobject.Type.t = "ml_gio_zlib_compressor_get_type"

external new_ : Ocgio_enums.zlibcompressorformat -> int -> t
  = "ml_g_zlib_compressor_new"
(** Creates a compressor. *)

(* Methods *)

external set_os : t -> int -> unit = "ml_g_zlib_compressor_set_os"
(** Sets the {{!Ocgio.Raw.Zlib_compressor.val-get_os}[Gio.ZlibCompressor:os]}
    property.

    Note: it is an error to call this function while a compression is in
    progress; it may only be called immediately after creation of [compressor],
    or after resetting it with
    {{!Ocgio.Raw.Converter.val-reset}[Gio.Converter.reset]}. *)

external set_file_info : t -> File_info.t option -> unit
  = "ml_g_zlib_compressor_set_file_info"
(** Sets the
    {{!Ocgio.Raw.Zlib_compressor.val-get_file_info}[Gio.ZlibCompressor:file-info]}
    property.

    Note: it is an error to call this function while a compression is in
    progress; it may only be called immediately after creation of [compressor],
    or after resetting it with
    {{!Ocgio.Raw.Converter.val-reset}[Gio.Converter.reset]}. *)

external get_os : t -> int = "ml_g_zlib_compressor_get_os"
(** Gets the {{!Ocgio.Raw.Zlib_compressor.val-get_os}[Gio.ZlibCompressor:os]}
    property. *)

external get_file_info : t -> File_info.t option
  = "ml_g_zlib_compressor_get_file_info"
(** Gets the
    {{!Ocgio.Raw.Zlib_compressor.val-get_file_info}[Gio.ZlibCompressor:file-info]}
    property. *)

(* Properties *)

external get_format : t -> Ocgio_enums.zlibcompressorformat
  = "ml_g_zlib_compressor_get_format"
(** The format of the compressed data. *)

external get_level : t -> int = "ml_g_zlib_compressor_get_level"
(** The level of compression from [0] (no compression) to [9] (most
    compression).

    [-1] for the default level. *)
