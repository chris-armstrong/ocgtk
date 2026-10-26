class type native_t = object
  method get_renderer : unit -> Ocgsk.Renderer.renderer_t option
  method get_surface : unit -> Ocgdk.Surface.surface_t option
  method realize : unit -> unit
  method unrealize : unit -> unit
  method as_native : Raw.Native.t
end

class native : Raw.Native.t -> native_t
