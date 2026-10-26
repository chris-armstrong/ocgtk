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

val new_ : Enums.zlibcompressorformat -> int -> zlib_compressor_t
