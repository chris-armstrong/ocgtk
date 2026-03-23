class type zlib_decompressor_t = object
    method get_file_info : unit -> GFile_info.file_info_t option
    method format : Gio_enums.zlibcompressorformat
    method as_zlib_decompressor : Zlib_decompressor.t
end

(* High-level class for ZlibDecompressor *)
class zlib_decompressor (obj : Zlib_decompressor.t) : zlib_decompressor_t = object (self)

  method get_file_info : unit -> GFile_info.file_info_t option =
    fun () ->
      Option.map (fun ret -> new GFile_info.file_info ret) (Zlib_decompressor.get_file_info obj)

  method format = Zlib_decompressor.get_format obj

    method as_zlib_decompressor = obj
end

let new_ (format : Gio_enums.zlibcompressorformat) : zlib_decompressor_t =
  new zlib_decompressor (Zlib_decompressor.new_ format)

