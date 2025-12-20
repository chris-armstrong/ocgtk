class zlib_decompressor : Zlib_decompressor.t ->
  object
    method get_file_info : unit -> GFile_info.file_info option
    method format : Gio_enums.zlibcompressorformat
    method as_zlib_decompressor : Zlib_decompressor.t
  end

