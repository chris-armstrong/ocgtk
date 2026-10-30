class type zlib_decompressor_t = object
  inherit Converter.converter_t

  (** {2:methods Methods} *)

  method get_file_info : unit -> File_info.file_info_t option
  (** Gets the [Gio.ZlibDecompressor:file-info] property. *)

  (** {2:properties Properties} *)

  method format : Enums.zlibcompressorformat
  (** The format of the compressed data. *)

  (** {2:conversions Conversions} *)

  method as_zlib_decompressor : Raw.Zlib_decompressor.t
end

(* High-level class for ZlibDecompressor *)
class zlib_decompressor (obj : Raw.Zlib_decompressor.t) : zlib_decompressor_t =
  object (self)
    inherit Converter.converter (Raw.Converter.from_gobject obj)

    method get_file_info : unit -> File_info.file_info_t option =
      fun () ->
        Option.map
          (fun ret -> new File_info.file_info ret)
          (Raw.Zlib_decompressor.get_file_info obj)

    method format = Raw.Zlib_decompressor.get_format obj
    method as_zlib_decompressor = obj
  end

let new_ (format : Enums.zlibcompressorformat) : zlib_decompressor_t =
  let obj_ = Raw.Zlib_decompressor.new_ format in
  new zlib_decompressor obj_
