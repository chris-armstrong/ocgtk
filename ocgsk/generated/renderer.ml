class type renderer_t = object
  method get_surface : unit -> Ocgdk.Surface.surface_t option
  method is_realized : unit -> bool
  method realize : Ocgdk.Surface.surface_t option -> (bool, GError.t) result

  method realize_for_display :
    Ocgdk.Display.display_t -> (bool, GError.t) result

  method render :
    Render_node.render_node_t -> Occairo.Region.region_t option -> unit

  method render_texture :
    Render_node.render_node_t ->
    Ocgraphene.Rect.rect_t option ->
    Ocgdk.Texture.texture_t

  method unrealize : unit -> unit
  method as_renderer : Raw.Renderer.t
end

(* High-level class for Renderer *)
class renderer (obj : Raw.Renderer.t) : renderer_t =
  object (self)
    method get_surface : unit -> Ocgdk.Surface.surface_t option =
      fun () ->
        Option.map
          (fun ret -> new Ocgdk.Surface.surface ret)
          (Raw.Renderer.get_surface obj)

    method is_realized : unit -> bool = fun () -> Raw.Renderer.is_realized obj

    method realize : Ocgdk.Surface.surface_t option -> (bool, GError.t) result =
      fun surface ->
        let surface = Option.map (fun c -> c#as_surface) surface in
        Raw.Renderer.realize obj surface

    method realize_for_display :
        Ocgdk.Display.display_t -> (bool, GError.t) result =
      fun display ->
        let display = display#as_display in
        Raw.Renderer.realize_for_display obj display

    method render :
        Render_node.render_node_t -> Occairo.Region.region_t option -> unit =
      fun root region ->
        let root = root#as_render_node in
        let region = Option.map (fun c -> c#as_region) region in
        Raw.Renderer.render obj root region

    method render_texture :
        Render_node.render_node_t ->
        Ocgraphene.Rect.rect_t option ->
        Ocgdk.Texture.texture_t =
      fun root viewport ->
        let root = root#as_render_node in
        let viewport = Option.map (fun c -> c#as_rect) viewport in
        new Ocgdk.Texture.texture
          (Raw.Renderer.render_texture obj root viewport)

    method unrealize : unit -> unit = fun () -> Raw.Renderer.unrealize obj
    method as_renderer = obj
  end

let new_for_surface (surface : Ocgdk.Surface.surface_t) : renderer_t =
  let surface = surface#as_surface in
  let obj_ = Raw.Renderer.new_for_surface surface in
  new renderer obj_
