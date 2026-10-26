class type zlib_decompressor_t = object
  inherit Converter.converter_t
  method get_file_info : unit -> File_info.file_info_t option
  method format : Enums.zlibcompressorformat
  method as_zlib_decompressor : Raw.Zlib_decompressor.t
end

class zlib_decompressor : Raw.Zlib_decompressor.t -> zlib_decompressor_t

val new_ : Enums.zlibcompressorformat -> zlib_decompressor_t
