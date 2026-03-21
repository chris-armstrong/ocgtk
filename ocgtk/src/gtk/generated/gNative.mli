class type native_t = object
    method get_renderer : unit -> Ocgtk_gsk.Gsk.renderer_t option
    method get_surface : unit -> Ocgtk_gdk.Gdk.surface_t option
    method realize : unit -> unit
    method unrealize : unit -> unit
    method as_native : Native.t
end

class native : Native.t -> native_t

