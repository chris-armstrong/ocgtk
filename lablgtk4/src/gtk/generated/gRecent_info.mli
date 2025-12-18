class recent_info : Recent_info.t ->
  object
    method exists : unit -> bool
    method get_age : unit -> int
    method get_description : unit -> string
    method get_display_name : unit -> string
    method get_mime_type : unit -> string
    method get_private_hint : unit -> bool
    method get_uri : unit -> string
    method has_application : string -> bool
    method has_group : string -> bool
    method is_local : unit -> bool
    method match_ : Recent_info.t -> bool
    method ref : unit -> Recent_info.t
    method unref : unit -> unit
    method as_recent_info : Recent_info.t
  end

