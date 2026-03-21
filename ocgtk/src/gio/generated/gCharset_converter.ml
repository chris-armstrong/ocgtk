class type charset_converter_t = object
    method get_num_fallbacks : unit -> int
    method get_use_fallback : unit -> bool
    method set_use_fallback : bool -> unit
    method from_charset : string
    method to_charset : string
    method as_charset_converter : Charset_converter.t
end

(* High-level class for CharsetConverter *)
class charset_converter (obj : Charset_converter.t) : charset_converter_t = object (self)

  method get_num_fallbacks : unit -> int =
    fun () ->
      (Charset_converter.get_num_fallbacks obj)

  method get_use_fallback : unit -> bool =
    fun () ->
      (Charset_converter.get_use_fallback obj)

  method set_use_fallback : bool -> unit =
    fun use_fallback ->
      (Charset_converter.set_use_fallback obj use_fallback)

  method from_charset = Charset_converter.get_from_charset obj

  method to_charset = Charset_converter.get_to_charset obj

    method as_charset_converter = obj
end

