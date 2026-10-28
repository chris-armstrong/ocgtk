(** [GZlibCompressor] is an implementation of [Gio.Converter] that compresses
    data using zlib.

    Its methods, signals and properties are on {!class-type-zlib_compressor_t}.
    Its constructors are under {!section-constructors}. The functions it is
    built on are in {!Ocgio.Raw.Zlib_compressor}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [ZlibCompressor].}

    Inherits from: [GObject.Object]

    Implements:
    - {{!Ocgio.Converter.class-type-converter_t}Ocgio.Converter}

    [GZlibCompressor] is an implementation of [Gio.Converter] that compresses
    data using zlib. *)
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

class zlib_compressor : Raw.Zlib_compressor.t -> zlib_compressor_t
(** Wraps a raw handle of {!Ocgio.Raw.Zlib_compressor.t}. *)

(** {1:constructors Constructors} *)

val new_ : Enums.zlibcompressorformat -> int -> zlib_compressor_t
(** Creates a compressor. *)
