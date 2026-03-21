class type icon_paintable_t = object
    method get_file : unit -> Ocgtk_gio.Gio.file_t option
    method get_icon_name : unit -> string option
    method is_symbolic : unit -> bool
    method as_icon_paintable : Icon_paintable.t
end

class icon_paintable : Icon_paintable.t -> icon_paintable_t

