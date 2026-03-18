(* High-level class for Native *)
class native (obj : Native.t) = object (self)

  method get_renderer : unit -> Ocgtk_gsk.Gsk.renderer option =
    fun () ->
      Option.map (fun ret -> new Ocgtk_gsk.Gsk.renderer ret) (Native.get_renderer obj)

  method get_surface : unit -> Ocgtk_gdk.Gdk.surface option =
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

