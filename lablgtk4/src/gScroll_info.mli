class scroll_info : Scroll_info.t ->
  object
    method get_enable_horizontal : unit -> bool
    method get_enable_vertical : unit -> bool
    method ref : unit -> Scroll_info.t
    method set_enable_horizontal : bool -> unit
    method set_enable_vertical : bool -> unit
    method unref : unit -> unit
    method as_scroll_info : Scroll_info.t
  end

