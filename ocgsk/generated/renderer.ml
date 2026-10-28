class type renderer_t = object
  method get_surface : unit -> Ocgdk.Surface.surface_t option
  (** Retrieves the surface that the renderer is associated with.

      If the renderer has not been realized yet, [NULL] will be returned. *)

  method is_realized : unit -> bool
  (** Checks whether the renderer is realized or not. *)

  method realize : Ocgdk.Surface.surface_t option -> (bool, GError.t) result
  (** Creates the resources needed by the renderer.

      Since GTK 4.6, the surface may be [NULL], which allows using renderers
      without having to create a surface. Since GTK 4.14, it is recommended to
      use [Gsk.Renderer.realize_for_display] for this case.

      Note that it is mandatory to call [Gsk.Renderer.unrealize] before
      destroying the renderer. *)

  method realize_for_display :
    Ocgdk.Display.display_t -> (bool, GError.t) result
  (** Creates the resources needed by the renderer.

      Note that it is mandatory to call [Gsk.Renderer.unrealize] before
      destroying the renderer. *)

  method render :
    Render_node.render_node_t -> Occairo.Region.region_t option -> unit
  (** Renders the scene graph, described by a tree of [GskRenderNode] instances
      to the renderer's surface, ensuring that the given region gets redrawn.

      If the renderer has no associated surface, this function does nothing.

      Renderers must ensure that changes of the contents given by the [root]
      node as well as the area given by [region] are redrawn. They are however
      free to not redraw any pixel outside of [region] if they can guarantee
      that it didn't change.

      The renderer will acquire a reference on the [GskRenderNode] tree while
      the rendering is in progress. *)

  method render_texture :
    Render_node.render_node_t ->
    Ocgraphene.Rect.rect_t option ->
    Ocgdk.Texture.texture_t
  (** Renders a scene graph, described by a tree of [GskRenderNode] instances,
      to a texture.

      The renderer will acquire a reference on the [GskRenderNode] tree while
      the rendering is in progress.

      If you want to apply any transformations to [root], you should put it into
      a transform node and pass that node instead. *)

  method unrealize : unit -> unit
  (** Releases all the resources created by [Gsk.Renderer.realize]. *)

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
