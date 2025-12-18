class icon_paintable : Icon_paintable.t ->
  object
    method get_icon_name : unit -> string option
    method is_symbolic : unit -> bool
    method as_icon_paintable : Icon_paintable.t
  end

