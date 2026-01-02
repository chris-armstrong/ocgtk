(* High-level class for ToplevelSize *)
class toplevel_size (obj : Toplevel_size.t) = object (self)

  method set_min_size : int -> int -> unit =
    fun min_width min_height ->
      (Toplevel_size.set_min_size obj min_width min_height)

  method set_shadow_width : int -> int -> int -> int -> unit =
    fun left right top bottom ->
      (Toplevel_size.set_shadow_width obj left right top bottom)

  method set_size : int -> int -> unit =
    fun width height ->
      (Toplevel_size.set_size obj width height)

    method as_toplevel_size = obj
end

