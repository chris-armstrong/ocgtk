(* GENERATED CODE - DO NOT EDIT *)
(* ZlibDecompressor: ZlibDecompressor *)

(** [GZlibDecompressor] is an implementation of [Gio.Converter] that
    decompresses data compressed with zlib.

    The class built on this module is in {!Ocgio.Zlib_decompressor}. *)

type t = [ `zlib_decompressor | `object_ ] Gobject.obj

external gtype : unit -> Gobject.Type.t = "ml_gio_zlib_decompressor_get_type"

external new_ : Ocgio_enums.zlibcompressorformat -> t
  = "ml_g_zlib_decompressor_new"
(** Create a new ZlibDecompressor *)

(* Methods *)

external get_file_info : t -> File_info.t option
  = "ml_g_zlib_decompressor_get_file_info"
(** Gets the [Gio.ZlibDecompressor:file-info] property. *)

(* Properties *)

external get_format : t -> Ocgio_enums.zlibcompressorformat
  = "ml_g_zlib_decompressor_get_format"
(** Get property: format *)
