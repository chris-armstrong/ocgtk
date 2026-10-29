(** [GZlibDecompressor] is an implementation of
    {{!Ocgio.Converter.class-type-converter_t}[Gio.Converter]} that decompresses
    data compressed with zlib.

    Its methods, signals and properties are on
    {!class-type-zlib_decompressor_t}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgio.Raw.Zlib_decompressor}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [ZlibDecompressor].}

    Implements:
    - {{!Ocgio.Converter.class-type-converter_t}Ocgio.Converter}

    [GZlibDecompressor] is an implementation of
    {{!Ocgio.Converter.class-type-converter_t}[Gio.Converter]} that decompresses
    data compressed with zlib. *)
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

class zlib_decompressor : Raw.Zlib_decompressor.t -> zlib_decompressor_t
(** Wraps a raw handle of {!Ocgio.Raw.Zlib_decompressor.t}. *)

(** {1:constructors Constructors} *)

val new_ : Enums.zlibcompressorformat -> zlib_decompressor_t
(** Creates a new decompressor. *)
