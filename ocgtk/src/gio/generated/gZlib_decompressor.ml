(* High-level class for ZlibDecompressor *)
class zlib_decompressor (obj : Zlib_decompressor.t) = object (self)

  method get_file_info : unit -> GFile_info.file_info option =
    fun () ->
      Option.map (fun ret -> new GFile_info.file_info ret) (Zlib_decompressor.get_file_info obj)

  method format = Zlib_decompressor.get_format obj

    method as_zlib_decompressor = obj
end

