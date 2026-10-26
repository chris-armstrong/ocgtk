class type icon_paintable_t = object
  inherit Ocgdk.Paintable.paintable_t
  inherit Symbolic_paintable.symbolic_paintable_t
  method get_file : unit -> Ocgio.File.file_t option
  method get_icon_name : unit -> string option
  method is_symbolic : unit -> bool
  method scale : int
  method set_scale : int -> unit
  method size : int
  method set_size : int -> unit
  method as_icon_paintable : Raw.Icon_paintable.t
end

class icon_paintable : Raw.Icon_paintable.t -> icon_paintable_t

val new_for_file : Ocgio.File.file_t -> int -> int -> icon_paintable_t
