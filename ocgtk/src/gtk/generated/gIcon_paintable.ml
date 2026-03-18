(* High-level class for IconPaintable *)
class icon_paintable (obj : Icon_paintable.t) = object (self)

  method get_file : unit -> Ocgtk_gio.Gio.file option =
    fun () ->
      Option.map (fun ret -> new Ocgtk_gio.Gio.file ret) (Icon_paintable.get_file obj)

  method get_icon_name : unit -> string option =
    fun () ->
      (Icon_paintable.get_icon_name obj)

  method is_symbolic : unit -> bool =
    fun () ->
      (Icon_paintable.is_symbolic obj)

    method as_icon_paintable = obj
end

