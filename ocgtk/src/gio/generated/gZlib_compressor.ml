class type zlib_compressor_t = object
  inherit GConverter.converter_t
  method get_file_info : unit -> GFile_info.file_info_t option
  method set_file_info : GFile_info.file_info_t option -> unit
  method format : Gio_enums.zlibcompressorformat
  method level : int
  method as_zlib_compressor : Zlib_compressor.t
end

(* High-level class for ZlibCompressor *)
class zlib_compressor (obj : Zlib_compressor.t) : zlib_compressor_t =
  object (self)
    inherit GConverter.converter (Converter.from_gobject obj)

    method get_file_info : unit -> GFile_info.file_info_t option =
      fun () ->
        Option.map
          (fun ret -> new GFile_info.file_info ret)
          (Zlib_compressor.get_file_info obj)

    method set_file_info : GFile_info.file_info_t option -> unit =
      fun file_info ->
        let file_info = Option.map (fun c -> c#as_file_info) file_info in
        Zlib_compressor.set_file_info obj file_info

    method format = Zlib_compressor.get_format obj
    method level = Zlib_compressor.get_level obj
    method as_zlib_compressor = obj
  end

let new_ (format : Gio_enums.zlibcompressorformat) (level : int) :
    zlib_compressor_t =
  let obj_ = Zlib_compressor.new_ format level in
  new zlib_compressor obj_
