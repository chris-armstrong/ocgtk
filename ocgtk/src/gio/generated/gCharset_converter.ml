class type charset_converter_t = object
    inherit GConverter.converter_t
    inherit GInitable.initable_t
    method get_num_fallbacks : unit -> int
    method get_use_fallback : unit -> bool
    method set_use_fallback : bool -> unit
    method from_charset : string
    method to_charset : string
    method as_charset_converter : Charset_converter.t
end

(* High-level class for CharsetConverter *)
class charset_converter (obj : Charset_converter.t) : charset_converter_t = object (self)
  inherit GConverter.converter (Converter.from_gobject obj)
  inherit GInitable.initable (Initable.from_gobject obj)

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

let new_ (to_charset : string) (from_charset : string) : (charset_converter_t, GError.t) result =
  let obj_ = Charset_converter.new_ to_charset from_charset in
Result.map (fun obj_ ->  new charset_converter obj_) obj_

