(** [GZlibCompressor] is an implementation of [Gio.Converter] that compresses
    data using zlib.

    Its methods, signals and properties are on {!class-type-zlib_compressor_t}.
    The functions it is built on are in {!Ocgio.Raw.Zlib_compressor}. *)

(** The methods, signals and properties of a [GZlibCompressor]. *)
class type zlib_compressor_t = object
  inherit Converter.converter_t
  method get_file_info : unit -> File_info.file_info_t option
  method get_os : unit -> int
  method set_file_info : File_info.file_info_t option -> unit
  method set_os : int -> unit
  method format : Enums.zlibcompressorformat
  method level : int
  method as_zlib_compressor : Raw.Zlib_compressor.t
end

class zlib_compressor : Raw.Zlib_compressor.t -> zlib_compressor_t
(** Wraps a layer 1 handle, {!Ocgio.Raw.Zlib_compressor.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [GZlibCompressor], give one already wrapped. *)

val new_ : Enums.zlibcompressorformat -> int -> zlib_compressor_t
