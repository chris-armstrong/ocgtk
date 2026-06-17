class type icon_paintable_t = object
  inherit Ocgtk_gdk.Gdk.Paintable.paintable_t
  inherit GSymbolic_paintable.symbolic_paintable_t
  method get_file : unit -> Ocgtk_gio.Gio.File.file_t option
  method get_icon_name : unit -> string option
  method is_symbolic : unit -> bool
  method as_icon_paintable : Icon_paintable.t
end

class icon_paintable : Icon_paintable.t -> icon_paintable_t

val new_for_file : Ocgtk_gio.Gio.File.file_t -> int -> int -> icon_paintable_t
