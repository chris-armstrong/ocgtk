class type toplevel_size_t = object
    method set_min_size : int -> int -> unit
    method set_shadow_width : int -> int -> int -> int -> unit
    method set_size : int -> int -> unit
    method as_toplevel_size : Toplevel_size.t
end

class toplevel_size : Toplevel_size.t -> toplevel_size_t

