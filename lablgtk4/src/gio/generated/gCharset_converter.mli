class charset_converter : Charset_converter.t ->
  object
    method get_num_fallbacks : unit -> int
    method get_use_fallback : unit -> bool
    method set_use_fallback : bool -> unit
    method from_charset : string
    method to_charset : string
    method as_charset_converter : Charset_converter.t
  end

