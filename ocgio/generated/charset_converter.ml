class type charset_converter_t = object
  inherit Converter.converter_t
  inherit Initable.initable_t

  (** {2:methods Methods} *)

  method get_num_fallbacks : unit -> int
  (** Gets the number of fallbacks that [converter] has applied so far. *)

  method get_use_fallback : unit -> bool
  (** Gets the [GCharsetConverter:use]-fallback property. *)

  method set_use_fallback : bool -> unit
  (** Sets the [GCharsetConverter:use]-fallback property. *)

  (** {2:properties Properties} *)

  method from_charset : string
  (** The character encoding to convert from. *)

  method to_charset : string
  (** The character encoding to convert to. *)

  (** {2:conversions Conversions} *)

  method as_charset_converter : Raw.Charset_converter.t
end

(* High-level class for CharsetConverter *)
class charset_converter (obj : Raw.Charset_converter.t) : charset_converter_t =
  object (self)
    inherit Converter.converter (Raw.Converter.from_gobject obj)
    inherit Initable.initable (Raw.Initable.from_gobject obj)

    method get_num_fallbacks : unit -> int =
      fun () -> Raw.Charset_converter.get_num_fallbacks obj

    method get_use_fallback : unit -> bool =
      fun () -> Raw.Charset_converter.get_use_fallback obj

    method set_use_fallback : bool -> unit =
      fun use_fallback ->
        Raw.Charset_converter.set_use_fallback obj use_fallback

    method from_charset = Raw.Charset_converter.get_from_charset obj
    method to_charset = Raw.Charset_converter.get_to_charset obj
    method as_charset_converter = obj
  end

let new_ (to_charset : string) (from_charset : string) :
    (charset_converter_t, GError.t) result =
  let obj_ = Raw.Charset_converter.new_ to_charset from_charset in
  Result.map (fun obj_ -> new charset_converter obj_) obj_
