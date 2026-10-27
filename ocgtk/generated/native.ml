class type native_t = object
  method get_renderer : unit -> Ocgsk.Renderer.renderer_t option
  (** Returns the renderer that is used for this [GtkNative]. *)

  method get_surface : unit -> Ocgdk.Surface.surface_t option
  (** Returns the surface of this [GtkNative]. *)

  method realize : unit -> unit
  (** Realizes a [GtkNative].

      This should only be used by subclasses. *)

  method unrealize : unit -> unit
  (** Unrealizes a [GtkNative].

      This should only be used by subclasses. *)

  method as_native : Raw.Native.t
end

(* High-level class for Native *)
class native (obj : Raw.Native.t) : native_t =
  object (self)
    method get_renderer : unit -> Ocgsk.Renderer.renderer_t option =
      fun () ->
        Option.map
          (fun ret -> new Ocgsk.Renderer.renderer ret)
          (Raw.Native.get_renderer obj)

    method get_surface : unit -> Ocgdk.Surface.surface_t option =
      fun () ->
        Option.map
          (fun ret -> new Ocgdk.Surface.surface ret)
          (Raw.Native.get_surface obj)

    method realize : unit -> unit = fun () -> Raw.Native.realize obj
    method unrealize : unit -> unit = fun () -> Raw.Native.unrealize obj
    method as_native = obj
  end
