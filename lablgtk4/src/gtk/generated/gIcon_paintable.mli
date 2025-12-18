class icon_paintable : Icon_paintable.t ->
  object
    method icon_name : string
    method is_symbolic : bool
    method as_icon_paintable : Icon_paintable.t
  end

