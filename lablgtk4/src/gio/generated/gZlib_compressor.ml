(* High-level class for ZlibCompressor *)
class zlib_compressor (obj : Zlib_compressor.t) = object (self)

  method get_file_info : unit -> GFile_info.file_info option =
    fun () ->
      Option.map (fun ret -> new GFile_info.file_info ret) (Zlib_compressor.get_file_info obj)

  method set_file_info : 'p1. (#GFile_info.file_info as 'p1) option -> unit =
    fun file_info ->
      let file_info = Option.map (fun (c) -> c#as_file_info) file_info in
      (Zlib_compressor.set_file_info obj file_info)

  method format = Zlib_compressor.get_format obj

  method level = Zlib_compressor.get_level obj

    method as_zlib_compressor = obj
end

