class themed_icon : Themed_icon.t ->
  object
    method append_name : string -> unit
    method get_names : unit -> string array
    method prepend_name : string -> unit
    method name : string
    method use_default_fallbacks : bool
    method as_themed_icon : Themed_icon.t
  end

