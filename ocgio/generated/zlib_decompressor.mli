class type zlib_decompressor_t = object
  inherit GConverter.converter_t
  method get_file_info : unit -> GFile_info.file_info_t option
  method format : Gio_enums.zlibcompressorformat
  method as_zlib_decompressor : Zlib_decompressor.t
end

class zlib_decompressor : Zlib_decompressor.t -> zlib_decompressor_t

val new_ : Gio_enums.zlibcompressorformat -> zlib_decompressor_t
