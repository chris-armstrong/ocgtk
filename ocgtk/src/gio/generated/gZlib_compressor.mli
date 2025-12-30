class zlib_compressor : Zlib_compressor.t ->
  object
    method get_file_info : unit -> GFile_info.file_info option
    method set_file_info : #GFile_info.file_info option -> unit
    method format : Gio_enums.zlibcompressorformat
    method level : int
    method as_zlib_compressor : Zlib_compressor.t
  end

