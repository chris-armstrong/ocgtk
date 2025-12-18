(* High-level class for IconPaintable *)
class icon_paintable (obj : Icon_paintable.t) = object (self)

  method icon_name = Icon_paintable.get_icon_name obj

  method is_symbolic = Icon_paintable.get_is_symbolic obj

    method as_icon_paintable = obj
end

