class type zlib_compressor_t = object
    inherit GConverter.converter_t
    method get_file_info : unit -> GFile_info.file_info_t option
    method set_file_info : GFile_info.file_info_t option -> unit
    method format : Gio_enums.zlibcompressorformat
    method level : int
    method as_zlib_compressor : Zlib_compressor.t
end

class zlib_compressor : Zlib_compressor.t -> zlib_compressor_t

val new_ : Gio_enums.zlibcompressorformat -> int -> zlib_compressor_t
