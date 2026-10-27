(** [GZlibDecompressor] is an implementation of [Gio.Converter] that
    decompresses data compressed with zlib.

    Its methods, signals and properties are on
    {!class-type-zlib_decompressor_t}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgio.Raw.Zlib_decompressor}. *)

(** The methods, signals and properties of a [GZlibDecompressor]. *)
class type zlib_decompressor_t = object
  inherit Converter.converter_t

  method get_file_info : unit -> File_info.file_info_t option
  (** Gets the [Gio.ZlibDecompressor:file-info] property. *)

  method format : Enums.zlibcompressorformat
  method as_zlib_decompressor : Raw.Zlib_decompressor.t
end

class zlib_decompressor : Raw.Zlib_decompressor.t -> zlib_decompressor_t
(** Wraps a layer 1 handle, {!Ocgio.Raw.Zlib_decompressor.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [GZlibDecompressor], give one already wrapped. *)

(** {2:constructors Constructors} *)

val new_ : Enums.zlibcompressorformat -> zlib_decompressor_t
(** Creates a new decompressor. *)
