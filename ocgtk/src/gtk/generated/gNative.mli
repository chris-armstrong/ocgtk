class native : Native.t ->
  object
    method get_renderer : unit -> Ocgtk_gsk.Gsk.renderer option
    method get_surface : unit -> Ocgtk_gdk.Gdk.surface option
    method realize : unit -> unit
    method unrealize : unit -> unit
    method as_native : Native.t
  end

