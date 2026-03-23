class type icon_paintable_t = object
    method get_file : unit -> Ocgtk_gio.Gio.File.file_t option
    method get_icon_name : unit -> string option
    method is_symbolic : unit -> bool
    method as_icon_paintable : Icon_paintable.t
end

(* High-level class for IconPaintable *)
class icon_paintable (obj : Icon_paintable.t) : icon_paintable_t = object (self)

  method get_file : unit -> Ocgtk_gio.Gio.File.file_t option =
    fun () ->
      Option.map (fun ret -> new Ocgtk_gio.Gio.File.file ret) (Icon_paintable.get_file obj)

  method get_icon_name : unit -> string option =
    fun () ->
      (Icon_paintable.get_icon_name obj)

  method is_symbolic : unit -> bool =
    fun () ->
      (Icon_paintable.is_symbolic obj)

    method as_icon_paintable = obj
end

let new_for_file (file : Ocgtk_gio.Gio.File.file_t) (size : int) (scale : int) : icon_paintable_t =
  let file = file#as_file in
  new icon_paintable (Icon_paintable.new_for_file file size scale)

