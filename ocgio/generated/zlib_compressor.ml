class type zlib_compressor_t = object
  inherit Converter.converter_t

  (** {2:methods Methods} *)

  method get_file_info : unit -> File_info.file_info_t option
  (** Gets the [Gio.ZlibCompressor:file-info] property. *)

  method get_os : unit -> int
  (** Gets the [Gio.ZlibCompressor:os] property. *)

  method set_file_info : File_info.file_info_t option -> unit
  (** Sets the [Gio.ZlibCompressor:file-info] property.

      Note: it is an error to call this function while a compression is in
      progress; it may only be called immediately after creation of
      [compressor], or after resetting it with [Gio.Converter.reset]. *)

  method set_os : int -> unit
  (** Sets the [Gio.ZlibCompressor:os] property.

      Note: it is an error to call this function while a compression is in
      progress; it may only be called immediately after creation of
      [compressor], or after resetting it with [Gio.Converter.reset]. *)

  (** {2:properties Properties} *)

  method format : Enums.zlibcompressorformat
  (** The format of the compressed data. *)

  method level : int
  (** The level of compression from [0] (no compression) to [9] (most
      compression).

      [-1] for the default level. *)

  (** {2:conversions Conversions} *)

  method as_zlib_compressor : Raw.Zlib_compressor.t
end

(* High-level class for ZlibCompressor *)
class zlib_compressor (obj : Raw.Zlib_compressor.t) : zlib_compressor_t =
  object (self)
    inherit Converter.converter (Raw.Converter.from_gobject obj)

    method get_file_info : unit -> File_info.file_info_t option =
      fun () ->
        Option.map
          (fun ret -> new File_info.file_info ret)
          (Raw.Zlib_compressor.get_file_info obj)

    method get_os : unit -> int = fun () -> Raw.Zlib_compressor.get_os obj

    method set_file_info : File_info.file_info_t option -> unit =
      fun file_info ->
        let file_info = Option.map (fun c -> c#as_file_info) file_info in
        Raw.Zlib_compressor.set_file_info obj file_info

    method set_os : int -> unit = fun os -> Raw.Zlib_compressor.set_os obj os
    method format = Raw.Zlib_compressor.get_format obj
    method level = Raw.Zlib_compressor.get_level obj
    method as_zlib_compressor = obj
  end

let new_ (format : Enums.zlibcompressorformat) (level : int) : zlib_compressor_t
    =
  let obj_ = Raw.Zlib_compressor.new_ format level in
  new zlib_compressor obj_
