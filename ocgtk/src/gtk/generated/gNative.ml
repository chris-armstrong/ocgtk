class type native_t = object
    method get_renderer : unit -> Ocgtk_gsk.Gsk.renderer_t option
    method get_surface : unit -> Ocgtk_gdk.Gdk.surface_t option
    method realize : unit -> unit
    method unrealize : unit -> unit
    method as_native : Native.t
end

(* High-level class for Native *)
class native (obj : Native.t) : native_t = object (self)

  method get_renderer : unit -> Ocgtk_gsk.Gsk.renderer_t option =
    fun () ->
      Option.map (fun ret -> new Ocgtk_gsk.Gsk.renderer ret) (Native.get_renderer obj)

  method get_surface : unit -> Ocgtk_gdk.Gdk.surface_t option =
    fun () ->
      Option.map (fun ret -> new Ocgtk_gdk.Gdk.surface ret) (Native.get_surface obj)

  method realize : unit -> unit =
    fun () ->
      (Native.realize obj)

  method unrealize : unit -> unit =
    fun () ->
      (Native.unrealize obj)

    method as_native = obj
end

