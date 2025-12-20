class style_context : Style_context.t ->
  object
    method add_class : string -> unit
    method get_scale : unit -> int
    method has_class : string -> bool
    method remove_class : string -> unit
    method restore : unit -> unit
    method save : unit -> unit
    method set_scale : int -> unit
    method as_style_context : Style_context.t
  end

